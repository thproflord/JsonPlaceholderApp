//
//  UserDto.swift
//  JsonPlaceHolderApp
//
//  Created by Fernando Gomes on 26/03/2022.
//

import Foundation

class UserDto : Codable {
    let id : Int
    let name : String
    let email : String
    let phone : String
    let website : String
}
