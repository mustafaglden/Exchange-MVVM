//
//  ExchangeViewModel.swift
//  Exchange-MVVM
//
//  Created by Mustafa Gülden on 22.01.2022.
//

import Foundation


struct ExchangeViewModel {
    let exchange : Exchange
    
    var name : String {
        return self.exchange.base
    }
    
    var rates : Dictionary<String, Double> {
        return self.exchange.rates
    }
    
}
