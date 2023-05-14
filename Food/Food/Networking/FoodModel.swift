//
//  FoodModel.swift
//  Food
//
//  Created by Dương Văn Cường on 10/05/2023.
//

import Foundation


struct Food: Codable {
    let id: String
    let detail: String
    let name: String
    let avatar: String
    let price: String
    

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case detail = "detail"
        case name = "name"
        case avatar = "avatar"
        case price = "price"
    }
}

typealias Foods = [Food]
