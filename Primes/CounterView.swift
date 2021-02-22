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
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("What is the \(ordinal(appState.counterValue)) prime?")
            }
        }
        .font(.title)
        .navigationTitle("Counter demo")
        .sheet(isPresented: $isPrimeViewShown) {
            IsPrimeView(appState: appState)
                .onDisappear() { isPrimeViewShown = false }
        }
    }
    
    private func ordinal(_ n: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        return formatter.string(for: n) ?? ""
    }
    
}

struct CounterView_Previews: PreviewProvider {
    
    static var previews: some View {
        CounterView(appState: AppState())
    }
    
}
