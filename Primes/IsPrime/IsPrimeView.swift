//
//  IsPrimeView.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 22/02/2021.
//

import SwiftUI

struct IsPrimeView: View {
    
    @ObservedObject var store: Store<AppState, AppAction>
    
    var body: some View {
        VStack {
            if isPrime(store.value.counterValue) {
                Text("\(store.value.counterValue) is prime")
                if store.value.favoritePrimes.values.contains(store.value.counterValue) {
                    Button(action: { store.send(.isPrime(.removeFromFavoritePrimes)) }) {
                        Text("Remove from favorite primes")
                    }
                } else {
                    Button(action: { store.send(.isPrime(.saveToFavoritePrimes)) }) {
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
    
}

struct IsPrimeView_Previews: PreviewProvider {
    
    static var previews: some View {
        IsPrimeView(store: Store(initialValue: AppState(), reducer: appReducer))
    }
    
}
