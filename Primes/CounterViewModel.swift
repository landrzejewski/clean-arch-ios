//
//  CounterViewModel.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 22/02/2021.
//

import Foundation
import Combine

final class CounterViewModel: ObservableObject {
    
    @Published var counterValue = 0
    
}
