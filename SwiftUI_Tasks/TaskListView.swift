//
//  TaskListView.swift
//  SwiftUI_Tasks
//
//  Created by Sun Asterisk Philippines on 7/25/24.
//

import SwiftUI

struct TaskListView: View {
    @StateObject private var viewModel = TaskViewModel()
    @State private var newTaskTitle = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New Task", text: $newTaskTitle).textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        guard !newTaskTitle.isEmpty else { return }
                        viewModel.addTask(title: newTaskTitle)
                        newTaskTitle = ""
                    }) {
                        Image(systemName: "plus")
                    }
                }.padding()
                
                List {
                    ForEach(viewModel.tasks) { task in
                        NavigationLink(destination: TaskDetailView(task: task)) {
                            Text(task.title)
                        }
                    }.onDelete(perform: viewModel.deleteTask)
                }
            }
            .navigationTitle("Tasks")
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
