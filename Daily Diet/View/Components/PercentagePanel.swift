//
//  PercentagePanel.swift
//  Daily Diet
//
//  Created by joao cardoso on 23/12/23.
//

import SwiftUI

struct PercentagePanel: View {
    var percentage: Double

    var aboveFiftyPercent: Bool {
        percentage > 50
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 16).frame(height: 125).foregroundStyle(aboveFiftyPercent ? .greenLight : .redLight)
                VStack {
                    Text("\(percentage, specifier: "%.2f")%").font(.system(size: 42)).fontWeight(.bold).foregroundStyle(.black)
                    Text("das refeições dentro da dieta").foregroundStyle(.gray2)
                }
                Image(systemName: "arrow.up.right")
                    .position(x: geometry.size.width / 2 + 152, y: geometry.size.height / 2 - 35)
                    .foregroundStyle(aboveFiftyPercent ? .greenDark : .redDark).font(.title2)
            }
        }
        .frame(height: 145)
    }
}

#Preview {
    PercentagePanel(percentage: 49.24).padding()
}
