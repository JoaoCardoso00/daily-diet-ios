//
//  CDMeals_helper.swift
//  Daily Diet
//
//  Created by joao cardoso on 03/01/24.
//

import CoreData
import Foundation

extension CDMeals {
    var uuid: UUID {
        #if DEBUG
        uuid_!
        #else
        uuid_ ?? UUID()
        #endif
    }

    var date: Date { date_ ?? Date() }

    convenience init(date: Date, context: NSManagedObjectContext) {
        self.init(context: context)
        self.date_ = date
        self.meals = NSSet(array: [])
    }

    convenience init(date: Date, meals: [CDMeal], context: NSManagedObjectContext) {
        self.init(context: context)
        self.date_ = date
        self.meals = NSSet(array: meals)
    }

    override public func awakeFromInsert() {
        self.uuid_ = UUID()
    }

    static func fetch(_ predicate: NSPredicate = .all) -> NSFetchRequest<CDMeals> {
        let request = CDMeals.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \CDMeals.date_, ascending: true)]

        request.predicate = predicate

        return request
    }

    // MARK: - Preview helpers

    static var example: CDMeals {
        let context = PersistenceController.preview.container.viewContext
        let mealGroup = CDMeals(date: Date(), meals: [CDMeal(name: "Hamburguer", isOnDiet: false, date_eaten: Date(), context: context)], context: context)

        return mealGroup
    }
}
