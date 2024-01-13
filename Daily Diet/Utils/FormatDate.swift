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
    formatter.timeZone = TimeZone.current // use current timezone
    return formatter.string(from: date)
}

// Day and Month formatter
var dayMonthFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMM" // e.g., "15 Jan"
    formatter.timeZone = TimeZone.current // use current timezone
    return formatter
}

// Hour formatter
var hourFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm" // 24-hour format
    formatter.timeZone = TimeZone.current // use current timezone
    // formatter.dateFormat = "h:mm a" // 12-hour format with AM/PM
    return formatter
}

func combineDateAndTime(date: Date, time: Date) -> Date {
    let calendar = Calendar.current
    let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
    let timeComponents = calendar.dateComponents([.hour, .minute], from: time)

    var combinedComponents = DateComponents()
    combinedComponents.year = dateComponents.year
    combinedComponents.month = dateComponents.month
    combinedComponents.day = dateComponents.day
    combinedComponents.hour = timeComponents.hour
    combinedComponents.minute = timeComponents.minute
    combinedComponents.timeZone = TimeZone.current // Use the current time zone

    return calendar.date(from: combinedComponents) ?? Date()
}
