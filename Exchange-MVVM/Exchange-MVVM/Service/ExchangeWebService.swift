//
//  ExchangeWebService.swift
//  Exchange-MVVM
//
//  Created by Mustafa Gülden on 22.01.2022.
//

import Foundation


class WebService {
    
    func getCurrencies(url: URL, completion: @escaping (Exchange?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data {
                let exchangeList = try? JSONDecoder().decode(Exchange.self, from: data)
                
                if let exchangeList = exchangeList {
                    completion(exchangeList)
                }
            }
            
        }.resume()
    }
    
}
