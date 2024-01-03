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
    }

    override public func awakeFromInsert() {
        self.uuid_ = UUID()
    }
}
