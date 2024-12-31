//
//  NewTaskView.swift
//  TaskManager-2
//
//  Created by Şahin Karahan on 31.12.2024.
//

import SwiftUI

struct NewTaskView: View {
    
    
    var saveTask: (Task) -> ()
    //@EnvironmentObject var items: TasksListManager
    @State private var taskTitle: String = ""
    @State private var taskDate: Date = .init()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Add new task")
                .fontDesign(.rounded)
                .font(.title2)
                .padding(30)
                .frame(maxWidth: .infinity)
                .background {
                    Rectangle()
                        .fill(.gray.opacity(0.2))
                        .clipShape(.rect(bottomLeadingRadius: 30, bottomTrailingRadius: 30))
                }
            VStack(spacing: 30) {
                TextField("Your task title", text: $taskTitle)
                    .padding(.top)
                
                HStack(alignment: .center, spacing: 20) {
                    Text("Timeline")
                        .font(.title3)
                    DatePicker("", selection: $taskDate, displayedComponents: .date)
                        .datePickerStyle(.compact)
                }
            }
            .padding(30)
            
            Button {
                saveTask(Task(title: taskTitle, date: taskDate))
                dismiss()
            } label: {
                Text("Create Task")
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .foregroundStyle(.white)
                    .background(.black)
                    .clipShape(.rect(cornerRadius: 20))
                    .padding(.horizontal, 30)
            }
        }
    }
}

#Preview {
    NewTaskView() { task in
        
    }
}
