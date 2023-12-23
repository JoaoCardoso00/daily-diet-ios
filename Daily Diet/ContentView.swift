//
//  ContentView.swift
//  Daily Diet
//
//  Created by joao cardoso on 20/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    @State private var navigateToCreateMeal = false

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image(.logo)
                    Spacer()
                    Image(.avatar).resizable().frame(width: 50, height: 50)
                }.padding(.vertical, 15)
                NavigationLink(destination: EmptyView()) {
                    PercentagePanel(percentage: 90.86).padding(.bottom, 30)
                }
                Text("Refeições").frame(maxWidth: .infinity, alignment: .leading).font(.title3)
                NavigationLink(destination: EmptyView()) {
                    DefaultButton(buttonText: "Nova refeição", iconSystemName: "plus", asLink: true) {}
                }
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
