//
//  FavoritePrimesViewState.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 07/03/2021.
//

struct FavoritePrimesViewState {
    
    var primes: [Int]
    
}

extension AppState {
    
    var primes: FavoritePrimesViewState {
        get {
            FavoritePrimesViewState(primes: favoritePrimes)
        }
        set {
            favoritePrimes = newValue.primes
        }
    }
    
}
