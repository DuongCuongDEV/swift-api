//
//  cartModel.swift
//  MyMovie
//
//  Created by Dương Văn Cường on 11/05/2023.
//

import Foundation

struct CartMove: Codable {
    let info: String
    let name: String
    let avatar: String
    let price: String
    let id: String
    
    
    enum CodingKeys: String, CodingKey {
        case info = "info"
        case name = "name"
        case avatar = "avatar"
        case price = "price"
        case id = "id"
    }
}

typealias CartMoves = [CartMove]
