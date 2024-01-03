//
//  MealItem.swift
//  Daily Diet
//
//  Created by joao cardoso on 23/12/23.
//

import SwiftUI

struct MealItem: View {
    @ObservedObject var meal: CDMeal
    var dateFormatter = DateFormatter()

    var mealDate: String {
        dateFormatter.string(from: meal.date)
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6).frame(height: 60).foregroundStyle(.clear).overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(.gray5, lineWidth: 2)
            )
            HStack {
                Text("\(formatDate(meal.date))")
                Text(mealDate).fontWeight(.bold)
                Divider().frame(height: 25).overlay(.gray1).padding(.horizontal, 5)
                Text(meal.name).lineLimit(1)
                Spacer()
                Circle().frame(width: 20, height: 20).foregroundStyle(meal.isOnDiet ? .greenMid : .redMid)
            }.padding().padding(5)
        }
    }
}

#Preview {
    MealItem(meal: CDMeal.example).padding()
}
