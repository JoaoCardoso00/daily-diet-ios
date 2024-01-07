//
//  MealList.swift
//  Daily Diet
//
//  Created by joao cardoso on 23/12/23.
//

import SwiftUI

struct MealList: View {
    var meals: [CDMeals]

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        return formatter
    }

    var body: some View {
        ForEach(meals.reversed(), id: \.self) { mealGroup in
            VStack {
                Text(mealGroup.date, formatter: dateFormatter).frame(maxWidth: .infinity, alignment: .leading).font(.title2).fontWeight(.bold
                )
                if let meals = mealGroup.meals?.array as? [CDMeal] {
                    ForEach(meals, id: \.self) { meal in
                        MealItem(meal: meal)
                    }
                }
            }.padding(.vertical)
        }
    }
}

#Preview {
    ScrollView {
        MealList(meals: [CDMeals(date: Date(), meals: [CDMeal(name: "Hamburguer", isOnDiet: false, date_eaten: Date(), context: PersistenceController.preview.container.viewContext)], context: PersistenceController.preview.container.viewContext)]).padding()
    }
}
