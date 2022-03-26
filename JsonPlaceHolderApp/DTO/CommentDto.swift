//
//  CommentsDto.swift
//  JsonPlaceHolderApp
//
//  Created by Fernando Gomes on 26/03/2022.
//

import Foundation

class CommentDto: Codable {
    var postId: Int
    var id: Int
    var email: String
    var body: String
}
