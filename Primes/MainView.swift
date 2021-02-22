//
//  MainView.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 22/02/2021.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var appState: AppState
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CounterView(appState: appState)) {
                    Text("Counter demo")
                }
                NavigationLink(destination: FavouritePrimesView(appState: appState)) {
                    Text("Favourite primes")
                }
            }
            .navigationTitle("State management")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView(appState: AppState())
    }
    
}
