//
//  MealList.swift
//  Daily Diet
//
//  Created by joao cardoso on 23/12/23.
//

import SwiftUI

struct MealList: View {
    @FetchRequest(fetchRequest: CDMeals.fetch())
    var mealGroups: FetchedResults<CDMeals>

    var body: some View {
        ForEach(mealGroups, id: \.self) { mealGroup in
            VStack {
                Text("hello").frame(maxWidth: .infinity, alignment: .leading).font(.title2).fontWeight(.bold
                )
                if let meals = mealGroup.meals?.allObjects as? [CDMeal] {
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
        MealList().padding().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
