//
//  InputDateMaskFormatter.swift
//  Daily Diet
//
//  Created by joao cardoso on 08/01/24.
//

import Foundation

class InputDateMaskFormatter: Formatter {
    override func string(for obj: Any?) -> String? {
        if let string = obj as? String {
            return formattedDate(date: string)
        }
        return nil
    }

    override func getObjectValue(_ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?, for string: String, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>?) -> Bool {
        obj?.pointee = string as AnyObject?
        return true
    }

    func formattedDate(date: String?) -> String? {
        guard let number = date else { return nil }
        let mask = "##/##/##"
        var result = ""
        var index = number.startIndex
        for ch in mask where index < number.endIndex {
            if ch == "#" {
                result.append(number[index])
                index = number.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
}
