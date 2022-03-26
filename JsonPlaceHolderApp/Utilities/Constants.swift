//
//  Constants.swift
//  JsonPlaceHolderApp
//
//  Created by Fernando Gomes on 25/03/2022.
//

import Foundation

struct Constants {
    
    //MARK: - Services URLs
    
    static let baseUrl = "https://jsonplaceholder.typicode.com/"
    static let postsUrl = "posts"
    static let usersUrl = "users"
    static let commentsOnPostUrl = "/comments?postId="
    
    //MARK: - Cells Identifier
    static let postCell = "PostCellView"
    
    //MARK: - Segue Identifier
    
    static let toDetail = "toDetail"
    
    //MARK: - Localizable Constants
    
    //Main View Controller
    static let mainView_title = "mainView_title"
    static let mainView_deleteAll = "mainView_deleteAll"
    static let mainView_segment1 = "mainView_segment1"
    static let mainView_segment2 = "mainView_segment2"

    //Detail View Controller
    static let detailView_title = "detailView_title"
    
    //No internet alert
    static let noInternet_title = "noInternet_title"
    static let noInternet_description = "noInternet_description"
    
    //Delete All Alert
    static let deleteAll_title = "deleteAll_title"
    static let deleteAll_description = "deleteAll_description"
    static let deleteAll_cancel = "deleteAll_cancel"
    static let deleteAll_delete = "deleteAll_delete"
    
    //Description Cell
    static let descriptionCell_title = "description_title";

    
}