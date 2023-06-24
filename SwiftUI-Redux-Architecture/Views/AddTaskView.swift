//
//  AddTaskView.swift
//  SwiftUI-Redux-Architecture
//
//  Created by Koji Torishima on 2023/06/19.
//

import SwiftUI

struct AddTaskView: View {
    
    @EnvironmentObject var store: Store<AppState>
    @State private var name: String = ""
    
    struct Props {
        // props
        let tasks: [Todo]
        // dispatch
        var onTaskAdded: (Todo) -> Void
    }
    
    private func map(state: TaskState) -> Props {
        return Props(
            tasks: state.tasks,
            onTaskAdded: { task in
                store.dispatch(
                    action: AddTaskAction(
                        task: task
                    )
                )
            }
        )
    }
    
    var body: some View {
        let props = map(state: store.state.taskState)
        VStack {
            TextField("Enter task", text: $name)
                .textFieldStyle(.roundedBorder)
            Button("Add") {
                let task = Todo(title: self.name)
                props.onTaskAdded(task)
            }
            List(props.tasks, id: \.id) { task in
                Text(task.title)
            }
            Spacer()
            
        }
        .padding()
    }
}


struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        let store = Store(reducer: taskReducer, state: TaskState())
        AddTaskView()
            .environmentObject(store)
    }
}
