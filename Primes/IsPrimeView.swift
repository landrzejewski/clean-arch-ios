//
//  IsPrimeView.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 22/02/2021.
//

import SwiftUI

struct IsPrimeView: View {
    
    @ObservedObject var store: Store<AppState>
    
    var body: some View {
        VStack {
            if isPrime(store.value.counterValue) {
                Text("\(store.value.counterValue) is prime")
                if store.value.favouritePrimes.contains(store.value.counterValue) {
                    Button(action: { removeFromFavouritePrimes() }) {
                        Text("Remove from favorite primes")
                    }
                } else {
                    Button(action: { addToFavouritePrimes() }) {
                        Text("Save to favorite primes")
                    }
                }
            } else {
                Text("\(store.value.counterValue) is not prime :(")
            }
        }
        .font(.title)
    }
    
    private func isPrime (_ p: Int) -> Bool {
        if p <= 1 { return false }
        if p <= 3 { return true }
        for i in 2...Int(sqrtf(Float(p))) {
            if p % i == 0 { return false }
        }
        return true
    }
    
    
    func removeFromFavouritePrimes() {
        store.value.favouritePrimes.removeAll(where: { $0 == store.value.counterValue })
        store.value.activityFeed.append(.init(timestamp: Date(), type: .removedFavoritePrime(store.value.counterValue)))
    }
    
    func addToFavouritePrimes() {
        store.value.favouritePrimes.append(store.value.counterValue)
        store.value.activityFeed.append(.init(timestamp: Date(), type: .addedFavoritePrime(store.value.counterValue)))
    }
    
}

struct IsPrimeView_Previews: PreviewProvider {
    
    static var previews: some View {
        IsPrimeView(store: Store(initialValue: AppState()))
    }
    
}
