//
//  IsPrimeReducer.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 27/02/2021.
//

import Foundation

func isPrimeReducer(state: inout AppState, action: IsPrimeAction) -> Void {
    switch action {
    case .saveToFavoritePrimes:
        state.favoritePrimes.values.append(state.counterValue)
        state.favoritePrimes.activities.append(.init(timestamp: Date(), type: .addedFavoritePrime(state.counterValue)))
    case .removeFromFavoritePrimes:
        state.favoritePrimes.values.removeAll(where: { $0 == state.counterValue })
        state.favoritePrimes.activities.append(.init(timestamp: Date(), type: .removedFavoritePrime(state.counterValue)))
    }
}
