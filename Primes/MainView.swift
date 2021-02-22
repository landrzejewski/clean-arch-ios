//
//  MainView.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 22/02/2021.
//

import SwiftUI

struct MainView: View {
    
    let appState = AppState()
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CounterView(appState: appState)) {
                    Text("Counter demo")
                }
                NavigationLink(destination: EmptyView()) {
                    Text("Favourite primes")
                }
            }
            .navigationTitle("State management")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView()
    }
    
}
