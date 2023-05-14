//
//  APIHandler.swift
//  MyMovie
//
//  Created by Dương Văn Cường on 09/05/2023.
//

import Foundation
import Alamofire

class APIHandler {
    func getMovies(completion: @escaping (Movies) -> ()) {
        AF.request("https://6422f979001cb9fc2034ee99.mockapi.io/Movie", method: .get).responseDecodable(of: Movies.self) { (response) in
//            print(response)

            if let moviesResponse = response.value {
                completion(moviesResponse)
//                print(moviesResponse)
            }
        }
    }
    
    func postMovie(movie: Movie) {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.request("https://6422f979001cb9fc2034ee99.mockapi.io/cartMovie", method: .post, parameters: movie, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            switch response.result {
            case .success(_):
                print("Call API thành công")
                break
                // Xử lý dữ liệu trả về thành công
            case .failure(let error):
                print(error.localizedDescription)
                break
                // Xử lý lỗi
            }
        }
    }
    
    func getCartMovies(completion: @escaping (Movies) -> ()) {
        AF.request("https://6422f979001cb9fc2034ee99.mockapi.io/cartMovie", method: .get).responseDecodable(of: Movies.self) { (response) in
            if let cartMoviesResponse = response.value {
                completion(cartMoviesResponse)
            }
        }
    }
    
    func deleteMovie(_id: String){
            AF.request("https://6422f979001cb9fc2034ee99.mockapi.io/cartMovie/\(_id)", method: .delete).responseDecodable(of: Movie.self) { (response) in
            }
    }
}
