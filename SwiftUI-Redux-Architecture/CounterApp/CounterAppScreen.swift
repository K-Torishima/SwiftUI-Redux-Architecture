//
//  CounterAppScreen.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/18.
//

import SwiftUI

struct CounterAppScreen: View {
    
    @EnvironmentObject var store: CounterStore
    
    struct Props {
        let counter: Int
        let onIncrement: () -> Void
        let onDecrement: () -> Void
        let onAdd: (Int) -> Void
    }
    
    private func map(state: CounterState) -> Props {
        Props(
            counter: state.counter,
            onIncrement: {
                store.dispatch(action: IncrementAction())
            },
            onDecrement: {
                store.dispatch(action: DecrementAction())
            },
            onAdd: {
                store.dispatch(action: AddAction(value: $0))
            }
        )
    }
    
    var body: some View {
        let props = map(state: store.state)
        VStack {
            Text("\(props.counter)")
                .padding()
            Button("Increment") {
                props.onIncrement()
            }
            Button("Decrement") {
                props.onDecrement()
            }
            Button("Add") {
                props.onAdd(100)
            }
        }
    }
}

struct CounterAppScreen_Previews: PreviewProvider {
    static var previews: some View {
        let store = CounterStore(reducer: reducer)
        CounterAppScreen()
            .environmentObject(store)
    }
}
