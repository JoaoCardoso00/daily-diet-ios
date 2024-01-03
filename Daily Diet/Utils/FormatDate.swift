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
