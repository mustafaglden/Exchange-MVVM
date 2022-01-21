//
//  Exchange.swift
//  Exchange-MVVM
//
//  Created by Mustafa Gülden on 22.01.2022.
//

import Foundation


struct Exchange : Decodable{
    let success : Bool
    let timestamp : Int
    let base, date : String
    let rates : Dictionary<String, Double>
}
