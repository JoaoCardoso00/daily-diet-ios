//
//  StyledDatePicker.swift
//  Daily Diet
//
//  Created by joao cardoso on 13/01/24.
//

import SwiftUI

enum DatePickerTypes {
    case hour
    case date
}

struct StyledDatePicker: View {
    @Binding var Date: Date
    var type: DatePickerTypes

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray5, lineWidth: 1)
                )
            Text("\(Date, formatter: type == .date ? dayMonthFormatter : hourFormatter)")
                .foregroundStyle(Color(.gray2))
                .padding()
                .autocorrectionDisabled()
        }.frame(height: 50).overlay {
            DatePicker("", selection: $Date, displayedComponents: type == .date ? .date : .hourAndMinute)
                .datePickerStyle(CompactDatePickerStyle()) // Use compact style
                .labelsHidden()
                .opacity(0.011)
        }
    }
}

struct StyledDatePickerPreview: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper(Date()) {
            StyledDatePicker(Date: $0, type: .date)
        }
    }
}
