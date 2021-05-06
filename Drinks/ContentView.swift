//
//  ContentView.swift
//  Drinks
//
//  Created by Damian Szerszeń on 21/04/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView() {
            SearchView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
