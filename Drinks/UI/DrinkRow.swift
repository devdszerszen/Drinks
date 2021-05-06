//
//  DrinkRow.swift
//  Drinks
//
//  Created by Damian Szerszeń on 21/04/2021.
//

import SwiftUI

struct DrinkRow: View {
    var drink: DrinkModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(drink.strDrink)
                    .font(.title)
            }
            .padding()
            Spacer()
        }
    }
}

struct OnlineDrinkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DrinkRow(drink: DrinkModel(idDrink: "12", strDrink: "Whisky sour", strInstructions: "Do sth", strDrinkThumb: "url"))
        }
    }
}
