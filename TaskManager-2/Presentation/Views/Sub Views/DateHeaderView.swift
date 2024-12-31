//
//  DateHeaderView.swift
//  TaskManager-2
//
//  Created by Şahin Karahan on 31.12.2024.
//

import SwiftUI

struct DateHeaderView: View {
    
    @ObservedObject var viewModel: TasksHomePageViewModel
    
    var body: some View {
        ZStack {
            VStack {
                nameHeaderTextView()
                DateSliderView(viewModel: viewModel) { week in
                    DateView(viewModel: viewModel, week: week)
                }
                .frame(height: 60, alignment: .top)
                Divider()
                HStack{
                    Spacer()
                    Text(viewModel.selectedDate.toString(format: "EEEE, dd.MM.yyyy"))
                        .font(.system(size: 10, design: .rounded))
                        .foregroundStyle(.gray)
                }
            }
        }
    }
    
    @ViewBuilder
    private func nameHeaderTextView() -> some View {
        HStack {
            VStack(alignment: .listRowSeparatorLeading ,spacing: 0) {
                Text("Hi Şahin")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .padding(4)
                
                Text(viewModel.selectedDate == Calendar.current.startOfDay(for: Date()) ? "What's up for today?" : "Plannig for future")
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundStyle(.black)
                    .padding(4)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(viewModel.getSelectedDate().monthToString())
                    .font(.system(size: 10))
                    .fontWeight(.heavy)
                    .foregroundStyle(.black)
                Button{
                    withAnimation(.linear(duration: 0.1)) {
                        viewModel.selectTheDay(with: Date())
                    }
                } label: {
                    Text("Today")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(4)
                        .background(.black)
                        .clipShape(.rect(cornerRadius: 4))
                }
            }
        }
    }
}

#Preview {
    TasksHomePage(viewModel: TasksHomePageViewModel(dateUseCase: DateUseCase(dateRepository: DateRepository(dateDateProvider: DateDataProvider())), taskUseCase: TaskUseCase(taskRepository: TaskRepository(taskDataProvider: TaskDataProvider()))))
}
