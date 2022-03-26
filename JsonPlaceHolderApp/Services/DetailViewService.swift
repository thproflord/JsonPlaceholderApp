//
//  DetailViewService.swift
//  JsonPlaceHolderApp
//
//  Created by Fernando Gomes on 26/03/2022.
//

import Foundation
import Alamofire
class DetailViewService {
    
    static func getUserfromPost (userId : Int) -> UserDto?{
        var resultUser : UserDto?
        let semaphore = DispatchSemaphore(value: 0)
        AF.request(Constants.baseUrl + Constants.usersUrl + "\(userId)").responseJSON { response in
            if response.response?.statusCode == 200 {
                if let safeResponse = response.data  {
                    let decoder = JSONDecoder()
                    do{
                        resultUser = try decoder.decode(UserDto.self, from: safeResponse)
                    }
                    catch {
                        print(error)
                    }
                } else {
                    print("Error")
                }
            }
            semaphore.signal()
        }
        semaphore.wait()
        return resultUser
    }
    
    static func getCommentsList(postId : Int) -> [CommentDto]{
        var resultCommentList : [CommentDto] = []
        let semaphore = DispatchSemaphore(value: 0)
        AF.request(Constants.baseUrl + Constants.commentsOnPostUrl + "\(postId)").responseJSON { response in
            if response.response?.statusCode == 200 {
                if let safeResponse = response.data  {
                    let decoder = JSONDecoder()
                    do{
                        resultCommentList = try decoder.decode([CommentDto].self, from: safeResponse)
                    }
                    catch {
                        print(error)
                    }
                } else {
                    print("Error")
                }
            }else{
                print("Error")
            }
            semaphore.signal()
        }
        semaphore.wait()
        return resultCommentList
    }
}
