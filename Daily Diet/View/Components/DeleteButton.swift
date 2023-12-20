//
//  EditButton.swift
//  Daily Diet
//
//  Created by joao cardoso on 20/12/23.
//

import SwiftUI

struct DeleteButton: View {
    var buttonText: String
    var buttonAction: () -> Void

    var body: some View {
        Button(action: buttonAction) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color(.white))
                    .frame(height: 65)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray2, lineWidth: 2)
                    )
                HStack(spacing: 20) {
                    Image(systemName: "trash").foregroundStyle(Color(.gray2)).font(.title2)
                    Text("\(buttonText)").foregroundStyle(Color(.gray2)).font(.title2).fontWeight(.bold)
                }
            }
        }
    }
}

#Preview {
    DeleteButton(buttonText: "Label") {}
}
