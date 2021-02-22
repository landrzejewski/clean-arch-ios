//
//  FavouritePrimesView.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 22/02/2021.
//

import SwiftUI

struct FavouritePrimesView: View {
    
    @ObservedObject var appState: AppState
    
    var body: some View {
        List {
            ForEach(appState.favouritePrimes, id: \.self) { prime in
                Text("\(prime)")
            }
            .onDelete { appState.favouritePrimes.remove(atOffsets: $0) }
        }
        .navigationTitle("Favourite primes")
    }
    
}

struct FavouritePrimesView_Previews: PreviewProvider {
    
    static var previews: some View {
        FavouritePrimesView(appState: AppState())
    }
    
}
