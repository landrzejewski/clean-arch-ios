//
//  CounterViewAction.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 27/02/2021.
//

enum CounterViewAction {
    
    case counter(CounterAction)
    case isPrime(IsPrimeViewAction)
    
}

enum CounterAction {
    
    case increment
    case decrement
    
}
