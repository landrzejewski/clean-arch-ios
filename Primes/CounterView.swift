//
//  CounterView.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 22/02/2021.
//

import Foundation
import SwiftUI

struct CounterView: View {
    
    @State var counterValue = 0
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { counterValue -= 1 }) {
                    Text("-")
                }
                Text("\(counterValue)")
                Button(action: { counterValue += 1 }) {
                    Text("+")
                }
            }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Is this prime?")
            }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("What is the \(ordinal(counterValue)) prime?")
            }
        }
        .font(.title)
        .navigationTitle("Counter demo")
    }
    
    private func ordinal(_ n: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        return formatter.string(for: n) ?? ""
    }
    
}

struct CounterView_Previews: PreviewProvider {
    
    static var previews: some View {
        CounterView()
    }
    
}
