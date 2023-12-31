//
//  ContentView.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/18.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented = false
    @EnvironmentObject var store: Store<AppState>
    
    struct Props {
        let counter: Int
        let onIncrement: () -> Void
        let onDecrement: () -> Void
        let onAdd: (Int) -> Void
        let onIncrementAsync: () -> Void
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
            },
            onIncrementAsync: {
                store.dispatch(action: IncrementActionAsync())
            }
        )
    }
    
    var body: some View {
        let props = map(state: store.state.counterState)
        VStack {
            Spacer()
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
            Button("Increment async") {
                props.onIncrementAsync()
            }
            
            Spacer()
         
            Button("Add Todo") {
                isPresented = true
            }
            Spacer()
        }
        .sheet(isPresented: $isPresented) {
            AddTaskView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store(reducer: counterReducer, state: CounterState())
        ContentView()
            .environmentObject(store)
    }
}
