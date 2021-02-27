//
//  Configuration.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 22/02/2021.
//

import Foundation
import Combine

struct FavoritePrimesState {
    
    var values: [Int]
    var activities: [Activity]
    
}

struct AppState {
    
    var counterValue = 0
    var favoritePrimes = FavoritePrimesState(values: [], activities: [])
    var user: User?
    
}

enum AppAction {
    
    case counter(CounterAction)
    case isPrime(IsPrimeAction)
    case favoritePrimes(FavoritePrimesAction)
    
    var counter: CounterAction? {
        get {
            guard case let .counter(value) = self else { return nil }
            return value
        }
        set {
            guard case .counter = self, let newValue = newValue else { return }
            self = .counter(newValue)
        }
    }
    
    var isPrime: IsPrimeAction? {
        get {
            guard case let .isPrime(value) = self else { return nil }
            return value
        }
        set {
            guard case .isPrime = self, let newValue = newValue else { return }
            self = .isPrime(newValue)
        }
    }
    
    var favoritePrimes: FavoritePrimesAction? {
        get {
            guard case let .favoritePrimes(value) = self else { return nil }
            return value
        }
        set {
            guard case .favoritePrimes = self, let newValue = newValue else { return }
            self = .favoritePrimes(newValue)
        }
    }
    
}

let appReducer: (inout AppState, AppAction) -> Void = combine(
    pullback(counterReducer, value: \.counterValue, action: \.counter),
    pullback(isPrimeReducer, value: \.self, action: \.isPrime),
    pullback(favoritePrimesReducer, value: \.favoritePrimes, action: \.favoritePrimes)
)
