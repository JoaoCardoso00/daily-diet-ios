//
//  NSPredicate_helper.swift
//  Daily Diet
//
//  Created by joao cardoso on 03/01/24.
//

import Foundation

extension NSPredicate {
    static let all = NSPredicate(format: "TRUEPREDICATE")
    static let none = NSPredicate(format: "FALSEPREDICATE")
}
