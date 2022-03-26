//
//  PostDto.swift
//  JsonPlaceHolderApp
//
//  Created by Fernando Gomes on 25/03/2022.
//

import Foundation

class PostDto : Codable {
    
    var id : Int
    let title : String
    let body : String
    let userId : Int
    lazy var favorite : Bool = false
}
