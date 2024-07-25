//
//  TaskDetailView.swift
//  SwiftUI_Tasks
//
//  Created by Sun Asterisk Philippines on 7/25/24.
//

import SwiftUI

struct TaskDetailView: View {
    var task: Task
    
    var body: some View {
        VStack {
            Text(task.title)
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .navigationTitle("Task Details")
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: Task(id: UUID(), title: "Sample Task"))
    }
}
