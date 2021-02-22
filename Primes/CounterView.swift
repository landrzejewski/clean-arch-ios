//
//  CounterView.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 22/02/2021.
//

import Foundation
import SwiftUI

struct CounterView: View {
    
    @ObservedObject var appState: AppState
    @State var isPrimeViewShown = false
    @State var alertNthPrime: PrimeAlert?
    @State var isNthPrimeButtonDisabled = false
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { appState.counterValue -= 1 }) {
                    Text("-")
                }
                Text("\(appState.counterValue)")
                Button(action: { appState.counterValue += 1 }) {
                    Text("+")
                }
            }
            Button(action: { isPrimeViewShown = true }) {
                Text("Is this prime?")
            }
            Button(action: nthPrimeButtonAction) {
                Text("What is the \(ordinal(appState.counterValue)) prime?")
            }
            .disabled(isNthPrimeButtonDisabled)
        }
        .font(.title)
        .navigationTitle("Counter demo")
        .sheet(isPresented: $isPrimeViewShown) {
            IsPrimeView(appState: appState)
                .onDisappear() { isPrimeViewShown = false }
        }
        .alert(item: $alertNthPrime) { alert in
            Alert(title: Text("The \(ordinal(appState.counterValue)) prime is \(alert.prime)"), dismissButton: .default(Text("Ok")))
        }
    }
    
    private func nthPrimeButtonAction() {
        isNthPrimeButtonDisabled = true
        nthPrime(appState.counterValue) { prime in
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
        CounterView(appState: AppState())
    }
    
}
