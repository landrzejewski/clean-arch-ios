//
//  FavouritePrimesViewReucer.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 27/02/2021.
//

import Foundation

func favoritePrimesViewReducer(state: inout FavoritePrimesViewState, action: FavoritePrimesViewAction) -> Void {
    switch action {
    case let .deleteFavoritePrimes(indexSet):
        for index in indexSet {
            state.primes.remove(at: index)
        }
    }
}
