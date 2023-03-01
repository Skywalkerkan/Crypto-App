//
//  Network.swift
//  CryptoApp
//
//  Created by Erkan on 1.03.2023.
//

import Foundation
import Alamofire

class Network{
    
    static let shared = Network()
    
    
    let headers: HTTPHeaders = ["X-CMC_PRO_API_KEY": "22452c5f-0f64-4645-98c4-f484815c223c", "Accept": "application/json"]

    
    
    func request<T: Codable>(Type: T.Type, url: String, method: HTTPMethod, completion: @escaping(Result<T,Errors>) -> Void){
        AF.request(url,method: .get,headers: headers).responseData { response in
            switch response.result{
            case .success(let data):
                DispatchQueue.main.async {
                    self.handleresponse(data: data) { response in
                        completion(response)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(.generalError))
            }
        }
    }
    
    
    func handleresponse<T: Codable>(data: Data, completion: @escaping(Result<T,Errors>)->Void){
        print(data)
        do{
            print("ooooo")
            let results = try JSONDecoder().decode(T.self, from: data)
            //print(results)
            completion(.success(results))
        }catch{
            completion(.failure(.invalidData))
        }
    }
    
    
    
}
