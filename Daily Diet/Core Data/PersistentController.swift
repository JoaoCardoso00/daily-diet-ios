//
//  PersistentController.swift
//  Daily Diet
//
//  Created by joao cardoso on 03/01/24.
//

import CoreData
import Foundation

struct PersistanceController {
    static let shared = PersistanceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        self.container = NSPersistentContainer(name: "DailyDiet")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Error loading container: \(error), \(error.userInfo)")
            }
        }
    }

    // MARK: - SwiftUI preview helper

    static var preview: PersistanceController = {
        let controller = PersistanceController(inMemory: true)
        let context = controller.container.viewContext

        let meal = CDMeal(name: "Hamburguer", isOnDiet: false, date_eaten: Date(), context: context)

        return controller
    }()
}
