//
//  DrinksList.swift
//  Drinks
//
//  Created by Damian Szerszeń on 21/04/2021.
//

import SwiftUI

struct DrinksList: View {
    let repository = DrinksRepository()
    let searchInput: String
    
    @State var drinks: [DrinkModel] = []
    
    var body: some View {
        List(drinks) { drink in
            NavigationLink(destination: DrinkDetails(drink: drink)) {
                DrinkRow(drink: drink)
            }
        }
        .onAppear(perform: {
            repository.getDrinksByName(drinkName: searchInput) {(fetchedDrinks) in
                self.drinks = fetchedDrinks
            }
        })
        .navigationTitle("Drinks")
    }
}

struct DrinksList_Previews: PreviewProvider {
    static var previews: some View {
        DrinksList(searchInput: "")
    }
}
