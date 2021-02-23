//
//  MainView.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 22/02/2021.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var store: Store<AppState>
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CounterView(store: store)) {
                    Text("Counter demo")
                }
                NavigationLink(destination: FavouritePrimesView(store: store)) {
                    Text("Favourite primes")
                }
            }
            .navigationTitle("State management")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView(store: Store(initialValue: AppState()))
    }
    
}
