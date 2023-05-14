//
//  MovieModel.swift
//  MyMovie
//
//  Created by Dương Văn Cường on 09/05/2023.
//

import Foundation

struct Movie: Codable {
    let info: String
        let name: String
        let avatar: String
        let price: String
    let link: String
        let id: String
    

    enum CodingKeys: String, CodingKey {
        case info = "info"
        case name = "name"
        case avatar = "avatar"
        case price = "price"
        case link = "link"
        case id = "id"

    }
}

typealias Movies = [Movie]
