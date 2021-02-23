//
//  FavouritePrimesView.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 22/02/2021.
//

import SwiftUI

struct FavouritePrimesView: View {
    
    @ObservedObject var store: Store<AppState>
    
    var body: some View {
        List {
            ForEach(store.value.favouritePrimes, id: \.self) { prime in
                Text("\(prime)")
            }
            .onDelete { store.value.favouritePrimes.remove(atOffsets: $0) }
        }
        .navigationTitle("Favourite primes")
    }
    
}

struct FavouritePrimesView_Previews: PreviewProvider {
    
    static var previews: some View {
        FavouritePrimesView(store: Store(initialValue: AppState()))
    }
    
}
