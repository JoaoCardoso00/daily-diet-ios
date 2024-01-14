//
//  ContentView.swift
//  Daily Diet
//
//  Created by joao cardoso on 20/12/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var router: NavigationRouter
    @StateObject var viewModel: MealsViewModel
    @State var text = ""

    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            ZStack {
                Color.white.ignoresSafeArea(.all, edges: [.top, .bottom])
                VStack {
                    HStack {
                        Image(.logo)
                        Spacer()
                        Image(.avatar).resizable().frame(width: 50, height: 50)
                    }.padding(.vertical, 15)
                    NavigationLink(destination: Status()) {
                        PercentagePanel(percentage: 90.86).padding(.bottom, 15)
                    }
                    Text("Refeições").frame(maxWidth: .infinity, alignment: .leading).font(.title3)
                    DefaultButton(buttonText: "Nova refeição", iconSystemName: "plus") {
                        router.navigate(to: .addMeal)
                    }
                    .environment(\.colorScheme, .light)
                    ScrollView {
                        Spacer().frame(height: 10) // Top padding
                        MealList(meals: viewModel.mealGroups.reversed()).id(viewModel.refreshID)
                    }.scrollIndicators(.hidden).padding(.vertical)
                }
                .padding()
                Spacer()
            }
            .navigationDestination(for: DestinationID.self) { destinationID in
                switch destinationID.viewType {
                case .addMeal:
                    AddMeal(viewModel: viewModel)
                case .stats:
                    Status()
                case .success:
                    Success()
                case .fail:
                    Fail()
                }
            }
        }
    }
}

#Preview {
    ContentView(viewModel: MealsViewModel(context: PersistenceController.preview.container.viewContext)).environmentObject(NavigationRouter())
}
