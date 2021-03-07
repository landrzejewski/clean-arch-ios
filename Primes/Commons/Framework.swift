//
//  Framework.swift
//  Primes
//
//  Created by Łukasz Andrzejewski on 27/02/2021.
//

import Foundation
import Combine

final class Store<Value, Action>: ObservableObject {
    
    @Published private(set) var value: Value
    
    private let reducer: (inout Value, Action) -> Void
    private var cancellable: Cancellable?
    
    init(initialValue: Value, reducer: @escaping (inout Value, Action) -> Void) {
        value = initialValue
        self.reducer = reducer
    }
    
    func send(_ action: Action) {
        reducer(&value, action)
    }
    
    func view<LocalValue, LocalAction>(value toLocalValue: @escaping (Value) -> LocalValue, action toGlobalAction: @escaping (LocalAction) -> Action) -> Store<LocalValue, LocalAction> {
        let localStore = Store<LocalValue, LocalAction>(initialValue: toLocalValue(value)) { localValue, localAction in
            self.send(toGlobalAction(localAction))
            localValue = toLocalValue(self.value)
        }
        localStore.cancellable = self.$value.sink { [weak localStore] newValue in
            localStore?.value = toLocalValue(newValue)
        }
        return localStore
    }
    
}

func sequence<Value, Action>(_ reducers: (inout Value, Action) -> Void...) -> (inout Value, Action) -> Void {
    return { value, action in
        for reducer in reducers {
            reducer(&value, action)
        }
    }
}

func pullback<GlobalValue, LocalValue, GlobalAction, LocalAction>(_ reducer: @escaping (inout LocalValue, LocalAction) -> Void, value: WritableKeyPath<GlobalValue, LocalValue>, action: WritableKeyPath<GlobalAction, LocalAction?>) -> (inout GlobalValue, GlobalAction) -> Void {
    return { globalValue, globalAction in
        guard let localAction = globalAction[keyPath: action] else { return }
        reducer(&globalValue[keyPath: value], localAction)
    }
}

public func compose<A, B, C>(_ f: @escaping (B) -> C,_ g: @escaping (A) -> B) -> (A) -> C {
    { (a: A) -> C in
        f(g(a))
    }
}

public func with<A, B>(_ a: A, _ f: (A) throws -> B) rethrows -> B {
    try f(a)
}
