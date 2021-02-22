//
//  IsPrimeView.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 22/02/2021.
//

import SwiftUI

struct IsPrimeView: View {
    
    @ObservedObject var appState: AppState
    
    var body: some View {
        VStack {
            if isPrime(appState.counterValue) {
                Text("\(appState.counterValue) is prime")
                if appState.isFavourite() {
                    Button(action: { appState.removeFromFavouritePrimes() }) {
                        Text("Remove from favorite primes")
                    }
                } else {
                    Button(action: { appState.addToFavouritePrimes() }) {
                        Text("Save to favorite primes")
                    }
                }
            } else {
                Text("\(appState.counterValue) is not prime :(")
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
        IsPrimeView(appState: AppState())
    }
    
}
