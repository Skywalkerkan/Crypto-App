//
//  Endpoint.swift
//  CryptoApp
//
//  Created by Erkan on 1.03.2023.
//

import Foundation


enum Endpoint: String{
    
    case latest = "/v1/cryptocurrency/listings/latest"
    case info = "/v2/cryptocurrency/info?id=1"
    
    var path: String{
        switch self{
        case .latest:
            return NetworkHelper.shared.requestUrl(url: Endpoint.latest.rawValue)
        case.info:
            return NetworkHelper.shared.requestUrl(url: Endpoint.info.rawValue)
        }
    }
    
    
}


class NetworkHelper{
    
    static let shared = NetworkHelper()
    
    //private let baseUrl = "https://api.binance.com"
      private let baseUrl = "https://pro-api.coinmarketcap.com"
    
    func requestUrl(url: String) -> String{
        baseUrl + url + "?limit=10"
    }
    
    
    
    
}
