//
//  FavouritePrimesReucer.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 27/02/2021.
//

import Foundation

func favoritePrimesReducer(state: inout FavoritePrimesState, action: FavoritePrimesAction) -> Void {
    switch action {
    case let .deleteFavoritePrimes(indexSet):
        for index in indexSet {
            let prime = state.values[index]
            state.values.remove(at: index)
            state.activities.append(.init(timestamp: Date(), type: .removedFavoritePrime(prime)))
        }
    }
}
