//
//  IsPrimeView.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 22/02/2021.
//

import SwiftUI

struct IsPrimeView: View {
    
    @Binding var counterValue: Int
    
    var body: some View {
        VStack {
            if isPrime(counterValue) {
                Text("\(counterValue) is prime")
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Save/remove to/from favourites")
                }
            } else {
                Text("\(counterValue) is not prime :(")
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
        IsPrimeView(counterValue: .constant(1))
    }
    
}
