//
//  EditButton.swift
//  Daily Diet
//
//  Created by joao cardoso on 20/12/23.
//

import SwiftUI

enum SelectType {
    case yes
    case no
}

enum colorShades {
    case light
    case mid
    case dark
}

struct Select: View {
    var buttonText: String
    var type: SelectType
    var active: Bool
    var buttonAction: () -> Void

    private func colorForType(_ shade: colorShades) -> Color {
        switch shade {
        case .light:
            switch type {
            case .no:
                return Color(.redLight)
            case .yes:
                return Color(.greenLight)
            }
        case .mid:
            switch type {
            case .no:
                return Color(.redMid)
            case .yes:
                return Color(.greenMid)
            }
        case .dark:
            switch type {
            case .no:
                return Color(.redDark)
            case .yes:
                return Color(.greenDark)
            }
        }
    }

    var body: some View {
        Button(action: buttonAction) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(active ? colorForType(.light) : Color(.gray6))
                    .frame(height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(colorForType(.dark), lineWidth: active ? 2 : 0)
                    )
                HStack(spacing: 20) {
                    Image(systemName: "circle.fill")
                        .foregroundStyle(colorForType(.dark))
                        .font(.system(size: 10))
                    Text(buttonText)
                        .foregroundStyle(Color(.gray2))
                        .fontWeight(.bold)
                }
            }
        }
    }
}

#Preview {
    Select(buttonText: "Label", type: .no, active: true) {}
}
