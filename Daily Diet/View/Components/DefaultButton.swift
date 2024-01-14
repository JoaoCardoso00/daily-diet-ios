//
//  EditButton.swift
//  Daily Diet
//
//  Created by joao cardoso on 20/12/23.
//

import SwiftUI

struct DefaultButton: View {
    var buttonText: String
    var iconSystemName: String?
    var asLink: Bool?
    var disabled: Bool?
    var buttonAction: () -> Void

    var buttonBackground: Color {
        if disabled == true {
            return Color(.gray5)
        }

        return Color(.gray2)
    }

    var body: some View {
        if asLink != nil {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color(.gray2))
                    .frame(height: 59)
                HStack(spacing: 15) {
                    if let iconSystemName {
                        Image(systemName: iconSystemName).foregroundStyle(Color(.white)).font(.title2)
                    }
                    Text("\(buttonText)").foregroundStyle(Color(.white)).fontWeight(.bold)
                }
            }
        } else {
            Button(action: buttonAction) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(buttonBackground)
                        .frame(height: 59)
                    HStack(spacing: 15) {
                        if let iconSystemName {
                            Image(systemName: iconSystemName).foregroundStyle(Color(.white)).font(.title2)
                        }
                        Text("\(buttonText)").foregroundStyle(Color(.white)).fontWeight(.bold)
                    }
                }
            }.disabled(disabled ?? false)
        }
    }
}

#Preview {
    DefaultButton(buttonText: "Label") {}
}
