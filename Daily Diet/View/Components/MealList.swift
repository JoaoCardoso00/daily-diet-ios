//
//  MealList.swift
//  Daily Diet
//
//  Created by joao cardoso on 23/12/23.
//

import SwiftUI

struct MealList: View {
    var body: some View {
        VStack {
            Text("12.08.22").frame(maxWidth: .infinity, alignment: .leading).font(.title2).fontWeight(.bold
            )
            ForEach(1 ... 4, id: \.self) { _ in
                MealItem(meal: CDMeal.example)
            }
        }
    }
}

#Preview {
    MealList().padding()
}
