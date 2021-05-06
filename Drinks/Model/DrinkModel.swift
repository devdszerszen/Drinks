//
//  DrinkData.swift
//  Drinks
//
//  Created by Damian Szerszeń on 02/05/2021.
//

import Foundation

struct DrinkModel : Decodable, Identifiable {
    let idDrink: String
    let strDrink: String
    let strInstructions: String?
    let strDrinkThumb: String?
    
    var id: String {
        idDrink
    }

}
