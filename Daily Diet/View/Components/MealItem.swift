//
//  MealItem.swift
//  Daily Diet
//
//  Created by joao cardoso on 23/12/23.
//

import SwiftUI

struct MealItem: View {
    var time: String
    var name: String
    var isOnDiet: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6).frame(height: 60).foregroundStyle(.clear).overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(.gray5, lineWidth: 2)
            )
            HStack {
                Text(time).fontWeight(.bold)
                Divider().frame(height: 25).overlay(.gray1).padding(.horizontal, 5)
                Text(name).lineLimit(1)
                Spacer()
                Circle().frame(width: 20, height: 20).foregroundStyle(isOnDiet ? .greenMid : .redMid)
            }.padding().padding(5)
        }
    }
}

#Preview {
    MealItem(time: "20:00", name: "X-tudo", isOnDiet: false).padding()
}
