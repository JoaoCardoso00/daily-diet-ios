//
//  CDMeal_helper.swift
//  Daily Diet
//
//  Created by joao cardoso on 03/01/24.
//

import CoreData
import Foundation

extension CDMeal {
    var name: String {
        get { name_ ?? "" }
        set { name_ = newValue }
    }

    var uuid: UUID {
        #if DEBUG
        uuid_!
        #else
        uuid_ ?? UUID()
        #endif
    }

    var date: Date { date_eaten_ ?? Date() }

    var isOnDiet: Bool {
        get { is_on_diet }
        set { is_on_diet = newValue }
    }

    convenience init(name: String, isOnDiet: Bool, date_eaten: Date, context: NSManagedObjectContext) {
        self.init(context: context)
        self.name = name
        self.is_on_diet = isOnDiet
        self.date_eaten_ = date_eaten
    }

    override public func awakeFromInsert() {
        self.uuid_ = UUID()
    }

    static func delete(meal: CDMeal) {
        guard let context = meal.managedObjectContext else { return }

        context.delete(meal)
    }

    static func fetch(_ predicate: NSPredicate = .all) -> NSFetchRequest<CDMeal> {
        let request = CDMeal.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \CDMeal.date_eaten_, ascending: true)]

        request.predicate = predicate

        return request
    }

    // MARK: - Preview helpers

    static var example: CDMeal {
        let context = PersistenceController.preview.container.viewContext
        let meal = CDMeal(name: "Hamburguer", isOnDiet: false, date_eaten: Date(), context: context)

        return meal
    }
}
