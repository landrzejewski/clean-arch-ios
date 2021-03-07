//
//  IsPrimeViewState.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 06/03/2021.
//

struct IsPrimeViewState {
    
    var counterValue: Int
    var favoritePrimes: [Int]
    
}

extension AppState {
    
    var isPrime: IsPrimeViewState {
        get {
            IsPrimeViewState(counterValue: counterValue,favoritePrimes: favoritePrimes)
        }
        set {
            counterValue = newValue.counterValue
            favoritePrimes = newValue.favoritePrimes
        }
    }
    
}
