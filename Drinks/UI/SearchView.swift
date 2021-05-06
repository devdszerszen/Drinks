//
//  SearchView.swift
//  Drinks
//
//  Created by Damian Szerszeń on 03/05/2021.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchInput: String = ""
    @State var validationVisible: Bool = false
    @State var drinksList: [DrinkModel] = []
    @State var navigationActive: Bool = false
    @State var drinkModel: DrinkModel? = nil
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage().fromUrl(url: drinkModel?.strDrinkThumb))
                .resizable()
                .padding(.top)
                .scaledToFill()
                .frame(width: 256, height: 256, alignment: .center)
                .clipped()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            if let drinkDetails = drinkModel {
                HStack{
                    Text("Proposition for today:")
                    NavigationLink(
                        destination: DrinkDetails(drink: drinkDetails),
                        label: {
                            Text(drinkModel?.strDrink ?? "")
                        })
                }.padding(.top)
            }
            TextField("Input drink name...", text: $searchInput)
                .padding(.horizontal)
                .padding(.top, 32)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: searchInput, perform: { value in
                    validationVisible = false
                })
            if validationVisible {
                Text("Check input and try again")
                    .font(.caption)
                    .foregroundColor(.red)
                    .transition(.scale)
            } else {
                Text("")
                    .font(.caption)
                    .hidden()
            }
            NavigationLink(destination: DrinksList(searchInput: searchInput), isActive: $navigationActive) {
                Button(action: {
                    if (searchInput.isEmpty) {
                        validationVisible = true
                    } else {
                        navigationActive = true
                    }
                }, label: {
                    Text("Search")
                }).padding(.top)
            }
            Spacer()
        }
        .navigationBarTitle("Search")
        .onAppear(perform: {
            DrinksRepository().getRandomDrink() {(drink) in
                drinkModel = drink
            }
        })
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(drinkModel: DrinkModel(idDrink: "123", strDrink: "Drink name", strInstructions: "", strDrinkThumb: ""))
    }
}
