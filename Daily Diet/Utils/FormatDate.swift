//
//  FormatDate.swift
//  Daily Diet
//
//  Created by joao cardoso on 03/01/24.
//

import Foundation

func formatDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm" // 24-hour format
    return formatter.string(from: date)
}

// Day and Month formatter
var dayMonthFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMM" // e.g., "15 Jan"
    return formatter
}

// Hour formatter
var hourFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm" // 24-hour format
    // formatter.dateFormat = "h:mm a" // 12-hour format with AM/PM
    return formatter
}
