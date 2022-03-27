//
//  Constants.swift
//  JsonPlaceHolderApp
//
//  Created by Fernando Gomes on 25/03/2022.
//

import Foundation

struct Constants {
    
    static let detailView_staticCells = 2
    
    //MARK: - Services URLs
    
    static let baseUrl = "https://jsonplaceholder.typicode.com/"
    static let postsUrl = "posts"
    static let usersUrl = "users/"
    static let commentsOnPostUrl = "comments?postId="
    
    //MARK: - Cells Identifier
    static let postCell = "PostCellView"
    static let descriptionCell = "descriptionCell"
    static let userCell = "userCell"
    static let commentsCell = "commentsCell"
    
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
    
    //User Cell
    static let user_title = "user_title"
    static let name_label = "name_label"
    static let phone_label = "phone_label"
    static let email_label = "email_label"
    static let web_label = "web_label"
    static let comments_title = "commets_title"

    //MARK: - CoreData
    
    static let postEntity = "Post"
    static let idAttribute = "id"
    static let titleAttribute = "title"
    static let bodyAttribute = "body"
    static let userIdAttribute = "userId"
    static let favoriteAttribute = "favorite"
    
    //MARK: - Images
    static let star = "star"
    static let star_fill = "star.fill"
    
    
}
