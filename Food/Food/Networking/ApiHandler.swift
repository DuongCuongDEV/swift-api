//
//  ApiHandler.swift
//  Food
//
//  Created by Dương Văn Cường on 10/05/2023.
//

import Foundation

import Alamofire

class APIHandler {
    func getFoods(completion: @escaping (Foods) -> ()) {
        AF.request("https://6422f979001cb9fc2034ee99.mockapi.io/Food", method: .get).responseDecodable(of: Foods.self) { (response) in
            if let foodsResponse = response.value {
                completion(foodsResponse)
            }
        }
    }
}
