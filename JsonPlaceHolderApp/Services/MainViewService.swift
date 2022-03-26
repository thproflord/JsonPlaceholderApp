//
//  MainViewService.swift
//  JsonPlaceHolderApp
//
//  Created by Fernando Gomes on 25/03/2022.
//

import Foundation
import Alamofire

class MainViewService {
    
    static func getPostList() -> [PostDto]{
        var resultPostList : [PostDto] = []
        let semaphore = DispatchSemaphore(value: 0)
        AF.request(Constants.baseUrl + Constants.postsUrl).responseJSON { response in
            if response.response?.statusCode == 200 {
                if let safeResponse = response.data  {
                    let decoder = JSONDecoder()
                    do{
                        resultPostList = try decoder.decode([PostDto].self, from: safeResponse)
                        
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
        return resultPostList
    }
    
    static func getPostbyId (id : Int) -> PostDto?{
        var resultPost : PostDto? = nil
        let semaphore = DispatchSemaphore(value: 0)
        AF.request(Constants.baseUrl + Constants.postsUrl + "/\(id)").responseJSON { response in
            if response.response?.statusCode == 200 {
                if let safeResponse = response.data {
                    let decoder = JSONDecoder()
                    do{
                        resultPost = try decoder.decode(PostDto.self, from: safeResponse)
                        print(resultPost!.title)
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
        return resultPost
    }
    
}
