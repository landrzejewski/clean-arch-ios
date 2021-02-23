//
//  State.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 22/02/2021.
//

import Foundation
import Combine

struct Activity {
    
    let timestamp: Date
    let type: ActivityType
    
    enum ActivityType {
        case addedFavoritePrime(Int)
        case removedFavoritePrime(Int)
    }
    
}

struct User {
    
    let id: Int
    let name: String
    let bio: String
    
}

struct AppState {
    
    var counterValue = 0
    var favouritePrimes: [Int] = []
    var loggedInUser: User?
    var activityFeed: [Activity] = []
    
}

final class Store<Value, Action>: ObservableObject {
    
    let reducer: (inout Value, Action) -> Void
    
    @Published var value: Value
    
    init(initialValue: Value, reducer: @escaping (inout Value, Action) -> Void) {
        value = initialValue
        self.reducer = reducer
    }
    
    func send(_ action: Action) {
        reducer(&value, action)
    }
    
}

enum CounterAction {
    
    case increment
    case decrement
    
}

func counterReducer(state: inout AppState, action: CounterAction) {
    switch action {
    case .increment:
        state.counterValue += 1
    case .decrement:
        state.counterValue -= 1
    }
}



