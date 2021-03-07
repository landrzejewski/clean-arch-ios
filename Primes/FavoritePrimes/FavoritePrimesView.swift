//
//  FavouritePrimesView.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 22/02/2021.
//

import SwiftUI

struct FavoritePrimesView: View {
    
    @ObservedObject var store: Store<FavoritePrimesViewState, FavoritePrimesViewAction>
    
    var body: some View {
        List {
            ForEach(store.value.primes, id: \.self) { prime in
                Text("\(prime)")
            }
            .onDelete { store.send(.deleteFavoritePrimes($0)) }
        }
        .navigationTitle("Favourite primes")
    }
    
}
