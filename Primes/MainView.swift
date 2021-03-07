//
//  MainView.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 22/02/2021.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var store: Store<AppState, AppAction>
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CounterView(store: store.view(value: { CounterViewState(counterValue: $0.counterValue, favoritePrimes: $0.favoritePrimes) }, action: {
                    switch $0 {
                    case let .counter(action):
                        return .counter(action)
                    case let .isPrime(action):
                        return .isPrime(action)
                    }
                    
                }))) {
                    Text("Counter demo")
                }
                NavigationLink(destination: FavoritePrimesView(store: store.view(value: { $0.primes }, action: { .favoritePrimes($0) }))) {
                    Text("Favourite primes")
                }
            }
            .navigationTitle("State management")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView(store: Store(initialValue: AppState(), reducer: appReducer))
    }
    
}
