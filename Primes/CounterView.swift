//
//  CounterView.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 22/02/2021.
//

import Foundation
import SwiftUI

struct CounterView: View {
    
    @ObservedObject var store: Store<AppState>
    @State var isPrimeViewShown = false
    @State var alertNthPrime: PrimeAlert?
    @State var isNthPrimeButtonDisabled = false
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { store.value.counterValue -= 1 }) {
                    Text("-")
                }
                Text("\(store.value.counterValue)")
                Button(action: { store.value.counterValue += 1 }) {
                    Text("+")
                }
            }
            Button(action: { isPrimeViewShown = true }) {
                Text("Is this prime?")
            }
            Button(action: nthPrimeButtonAction) {
                Text("What is the \(ordinal(store.value.counterValue)) prime?")
            }
            .disabled(isNthPrimeButtonDisabled)
        }
        .font(.title)
        .navigationTitle("Counter demo")
        .sheet(isPresented: $isPrimeViewShown) {
            IsPrimeView(store: store)
                .onDisappear() { isPrimeViewShown = false }
        }
        .alert(item: $alertNthPrime) { alert in
            Alert(title: Text("The \(ordinal(store.value.counterValue)) prime is \(alert.prime)"), dismissButton: .default(Text("Ok")))
        }
    }
    
    private func nthPrimeButtonAction() {
        isNthPrimeButtonDisabled = true
        nthPrime(store.value.counterValue) { prime in
            alertNthPrime = prime.map(PrimeAlert.init(prime:))
            isNthPrimeButtonDisabled = false
        }
    }
    
    private func ordinal(_ n: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        return formatter.string(for: n) ?? ""
    }
    
}

struct PrimeAlert: Identifiable {
    
    let prime: Int
    var id: Int { prime }
    
}

struct CounterView_Previews: PreviewProvider {
    
    static var previews: some View {
        CounterView(store: Store(initialValue: AppState()))
    }
    
}
