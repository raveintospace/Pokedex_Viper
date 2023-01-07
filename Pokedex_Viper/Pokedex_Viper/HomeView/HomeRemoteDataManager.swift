//
//  HomeRemoteDataManager.swift
//  Pokedex_Viper
//
//  Created by Uri on 3/1/23.
//  
//

import Foundation

struct APIClient {
    enum Method: String {
        case GET
        case POST
        case DELETE
        case PUT
        case PATCH
    }
    
    func request<T: Decodable>(url: URL, method: Method, type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        let session = URLSession.shared
        
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/x-www-form-urlencoded; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "cache-control")
        
        session.dataTask(with: request) {(data, response, error) in
            guard let secureData = data?.parseData(removeString: "null,") else {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                fatalError("Data and error should never be nil both")
            }
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                print("Getting from server: \(secureData)")
                
                let result = Result { try JSONDecoder().decode(T.self, from: secureData) }
                
                completion(result)
                
            } else {
                print("An error happened: TBD")
            }
        }.resume()
    }
}

final class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    
    // call to our remote server to get data for our interactor
    func fetchPokemons() {
        APIClient().request(url: URL(string: "https://pokedex-bb36f.firebaseio.com/pokemon.json")!,
                            method: .GET,
                            type: [Pokemon].self) { [remoteRequestHandler] result in
            switch result {
            case let .success(entity):
                remoteRequestHandler?.remoteDataManagerCallBackData(with: entity.self)
            case .failure:
                break
            }
        }
    }
}

// https://youtu.be/Uokamj2WtxU - min 13
extension Data {
    func parseData(removeString word: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parseDataString = dataAsString?.replacingOccurrences(of: word, with: "")
        
        guard let data = parseDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
