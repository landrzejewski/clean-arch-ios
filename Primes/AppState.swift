//
//  AppState.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 22/02/2021.
//

import Foundation
import Combine

final class AppState: ObservableObject {
    
    @Published var counterValue = 0
    @Published var favouritePrimes: [Int] = []
    
    func isFavourite() -> Bool {
        favouritePrimes.contains(counterValue)
    }
    
    func removeFromFavouritePrimes() {
        favouritePrimes.removeAll(where: { $0 == counterValue })
    }
    
    func addToFavouritePrimes() {
        favouritePrimes.append(counterValue)
    }
    
}
