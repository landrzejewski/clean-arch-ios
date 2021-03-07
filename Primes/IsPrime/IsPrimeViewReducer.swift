//
//  IsPrimeViewReducer.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 27/02/2021.
//

import Foundation

func isPrimeViewReducer(state: inout IsPrimeViewState, action: IsPrimeViewAction) -> Void {
    switch action {
    case .saveToFavoritePrimes:
        state.favoritePrimes.append(state.counterValue)
    case .removeFromFavoritePrimes:
        state.favoritePrimes.removeAll(where: { $0 == state.counterValue })
    }
}
