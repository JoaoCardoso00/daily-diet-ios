//
//  MealsViewModel.swift
//  Daily Diet
//
//  Created by joao cardoso on 04/01/24.
//

import CoreData
import Foundation

class MealsViewModel: ObservableObject {
    @Published var refreshID = UUID()
    @Published var mealGroups: [CDMeals] = []
    
    private var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        fetchMeals()
    }
    
    func fetchMeals() {
        let request: NSFetchRequest = CDMeals.fetch()
        
        do {
            mealGroups = try context.fetch(request)
        } catch {
            print("Error fetching meals: \(error)")
        }
    }
    
    func createMeal(name: String, isOnDiet: Bool, date_eaten: Date) {
        let newMeal = CDMeal(name: name, isOnDiet: isOnDiet, date_eaten: date_eaten, context: context)
        
        var updatedMealGroups = mealGroups
        var isGroupUpdated = false
        
        for (index, mealGroup) in updatedMealGroups.enumerated() {
            let normalizedMealGroupDate = Calendar.current.startOfDay(for: mealGroup.date)
            let normalizedDateEaten = Calendar.current.startOfDay(for: date_eaten)
            
            if normalizedMealGroupDate == normalizedDateEaten {
                let updatedMeals = NSMutableOrderedSet(orderedSet: mealGroup.meals!)
                updatedMeals.insert(newMeal, at: 0) // Insert at the start
                updatedMealGroups[index].meals = updatedMeals
                isGroupUpdated = true
                break
            }
        }
        
        if !isGroupUpdated {
            updatedMealGroups.insert(CDMeals(date: Date(), meals: [newMeal], context: context), at: 0)
        }
        
        mealGroups = updatedMealGroups
        saveContext()
        refreshID = UUID()
    }

    func createMealGroup(date: Date, meals: [CDMeal]) {
        let _ = CDMeals(date: date, meals: meals, context: context)

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
