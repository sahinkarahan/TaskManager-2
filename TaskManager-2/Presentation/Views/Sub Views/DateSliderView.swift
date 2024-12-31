//
//  DateSliderView.swift
//  TaskManager-2
//
//  Created by Şahin Karahan on 31.12.2024.
//

import SwiftUI

struct DateSliderView<DateViewContent: View>: View {
    
    @ObservedObject var viewModel: TasksHomePageViewModel
    @State private var activeTab: Int = 1
    @State private var position = CGSize.zero
    @GestureState private var dragOffset = CGSize.zero
    @State private var direction: SliderTimeDirection = .unknown
    
    
    let dateViewContent: (_ week: WeekModel) -> DateViewContent
    
    init(viewModel: TasksHomePageViewModel, @ViewBuilder dateViewContent: @escaping (_ week: WeekModel) -> DateViewContent) {
        self.viewModel = viewModel
        self.dateViewContent = dateViewContent
    }
    
    var body: some View {
        TabView(selection: $activeTab) {
            dateViewContent(viewModel.weeks[0])
                .frame(maxWidth: .infinity)
                .tag(0)
            
            dateViewContent(viewModel.weeks[1])
                .frame(maxWidth: .infinity)
                .tag(1)
                .onDisappear() {
                    guard direction != .unknown else { return }
                    viewModel.onDateScrolled(to: direction)
                    direction = .unknown
                    activeTab = 1
                }
            
            dateViewContent(viewModel.weeks[2])
                .frame(maxWidth: .infinity)
                .tag(2)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .onChange(of: activeTab) { _, value in
            if value == 0 {
                direction = .past
            } else if value == 2 {
                direction = .future
            }
        }
        
    }
}

#Preview {
    TasksHomePage(viewModel: TasksHomePageViewModel(dateUseCase: DateUseCase(dateRepository: DateRepository(dateDateProvider: DateDataProvider())), taskUseCase: TaskUseCase(taskRepository: TaskRepository(taskDataProvider: TaskDataProvider()))))
}
