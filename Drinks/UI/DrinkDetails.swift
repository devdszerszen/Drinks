//
//  DrinkDetails.swift
//  Drinks
//
//  Created by Damian Szerszeń on 21/04/2021.
//

import SwiftUI

struct DrinkDetails: View {
    var drink: DrinkModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                Text(drink.strDrink)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer()
                Image(uiImage: UIImage().fromUrl(url: drink.strDrinkThumb))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 128, height: 128, alignment: .center)
                    .clipped()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                
            }
            Text(drink.strInstructions ?? "Nothing to show here")
                .padding(.top)
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct DrinkDetails_Previews: PreviewProvider {
    static var previews: some View {
        DrinkDetails(drink: DrinksRepository().getSampleDrink()!)
    }
}
