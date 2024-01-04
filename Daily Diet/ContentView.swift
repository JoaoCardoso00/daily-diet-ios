//
//  ContentView.swift
//  Daily Diet
//
//  Created by joao cardoso on 20/12/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    @State var text = ""

    var body: some View {
        NavigationStack {
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
                NavigationLink(destination: EmptyView()) {
                    DefaultButton(buttonText: "Nova refeição", iconSystemName: "plus") {
                        let newMealGroup = CDMeals(date: Date(), meal: CDMeal(name: "Hamburguer", isOnDiet: false, date_eaten: Date(), context: context), context: context)
                    }
                }
                ScrollView {
                    Spacer().frame(height: 10) // Top padding
                    MealList()
                }.scrollIndicators(.hidden).padding(.vertical)
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
