//
//  CounterViewReducer.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 27/02/2021.
//

func counterViewReducer(state: inout Int, action: CounterAction) -> Void {
    switch action {
    case .increment:
        state += 1
    case .decrement:
        state -= 1
    }
}
