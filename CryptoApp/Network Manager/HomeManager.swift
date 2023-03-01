//
//  HomeManager.swift
//  CryptoApp
//
//  Created by Erkan on 1.03.2023.
//

import Foundation



class HomeManager{
    
    static let shared = HomeManager()
    
    
    func getLatestCoins(completion: @escaping(LatestCoins?, Error?) -> Void){
        
        Network.shared.request(Type: LatestCoins.self, url: Endpoint.latest.path, method: .get) { response in
            //print(response)
            switch response{
            
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
                print("babababa")
            }
        }
        
    }
    
    
    
}
