//
//  MealsViewModel.swift
//  Daily Diet
//
//  Created by joao cardoso on 04/01/24.
//

import CoreData
import Foundation

class MealsViewModel: ObservableObject {
    @Published var meals: [CDMeals] = []
    
    private var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        fetchMeals()
    }
    
    func fetchMeals() {
        let request: NSFetchRequest = CDMeals.fetch()
        
        do {
            meals = try context.fetch(request)
        } catch {
            print("Error fetching meals: \(error)")
        }
    }
    
    func createMeal(name: String, isOnDiet: Bool, date_eaten: Date) -> CDMeal {
        let newMeal = CDMeal(name: name, isOnDiet: isOnDiet, date_eaten: date_eaten, context: context)
        
        return newMeal
    }

    func createMealGroup(date: Date, meals: [CDMeal]) {
        let newMealGroup = CDMeals(date: date, meals: meals, context: context)

        saveContext()
    }
    
    func saveContext() {
        do {
            try context.save()
            fetchMeals()
        } catch {
            print("error saving context: \(error)")
        }
    }
}
