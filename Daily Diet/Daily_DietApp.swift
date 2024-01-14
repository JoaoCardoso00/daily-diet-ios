//
//  Daily_DietApp.swift
//  Daily Diet
//
//  Created by joao cardoso on 20/12/23.
//

import SwiftUI

@main
struct Daily_DietApp: App {
    let context = PersistenceController.shared.container.viewContext
    @StateObject private var router = NavigationRouter()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: MealsViewModel(context: context))
                .environmentObject(router)
        }
    }
}
