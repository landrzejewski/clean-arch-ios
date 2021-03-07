//
//  Configuration.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 22/02/2021.
//

import Foundation
import Combine

struct AppState {
    
    var counterValue = 0
    var favoritePrimes: [Int] = []
    var user: User?
    var activities: [Activity] = []
    
}

enum AppAction {
    
    case counter(CounterAction)
    case isPrime(IsPrimeViewAction)
    case favoritePrimes(FavoritePrimesViewAction)
    
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
    
    var isPrime: IsPrimeViewAction? {
        get {
            guard case let .isPrime(value) = self else { return nil }
            return value
        }
        set {
            guard case .isPrime = self, let newValue = newValue else { return }
            self = .isPrime(newValue)
        }
    }
    
    var favoritePrimes: FavoritePrimesViewAction? {
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

// Higher-order reducers

func activityFeedReducer(_ reducer: @escaping (inout AppState, AppAction) -> Void) -> (inout AppState, AppAction) -> Void {
    return { state, action in
        switch action {
        case .counter:
            break
        case .isPrime(.saveToFavoritePrimes):
            state.activities.append(.init(timestamp: Date(), type: .addedFavoritePrime(state.counterValue)))
        case .isPrime(.removeFromFavoritePrimes):
            state.activities.append(.init(timestamp: Date(), type: .removedFavoritePrime(state.counterValue)))
        case let .favoritePrimes(.deleteFavoritePrimes(indexSet)):
            for index in indexSet {
                let prime = state.favoritePrimes[index]
                state.activities.append(.init(timestamp: Date(), type: .removedFavoritePrime(prime)))
            }
        }
        reducer(&state, action)
    }
}

func loggingReducer<Value, Action>(_ reducer: @escaping (inout Value, Action) -> Void) -> (inout Value, Action) -> Void {
    return { value, action in
        reducer(&value, action)
        print("Action: \(action)")
        print("State:")
        dump(value)
        print("---")
    }
}

let mainReducer: (inout AppState, AppAction) -> Void = sequence(
    pullback(counterViewReducer, value: \.counterValue, action: \.counter),
    pullback(isPrimeViewReducer, value: \.isPrime, action: \.isPrime),
    pullback(favoritePrimesViewReducer, value: \.primes, action: \.favoritePrimes)
)

let appReducer = with(mainReducer, compose(loggingReducer, activityFeedReducer))
