//
//  PersistentController.swift
//  Daily Diet
//
//  Created by joao cardoso on 03/01/24.
//

import CoreData
import Foundation

struct PersistenceController {
    static let shared = PersistenceController()

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

    func save() {
        let context = container.viewContext

        guard context.hasChanges else { return }

        do {
            try context.save()
        } catch {
            print("error saving context: \(error)")
        }
    }

    // MARK: - SwiftUI preview helper

    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        let context = controller.container.viewContext

        let meal = CDMeal(name: "Hamburguer", isOnDiet: false, date_eaten: Date(), context: context)
        let meals = CDMeals(date: Date(), meals: [meal], context: context)

        return controller
    }()
}
