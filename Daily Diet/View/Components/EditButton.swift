//
//  EditButton.swift
//  Daily Diet
//
//  Created by joao cardoso on 20/12/23.
//

import SwiftUI

struct EditButton: View {
    var buttonText: String
    var buttonAction: () -> Void

    var body: some View {
        Button(action: buttonAction) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color(.gray2))
                    .frame(height: 65)
                HStack(spacing: 20) {
                    Image(systemName: "pencil.line").foregroundStyle(Color(.white)).font(.title2)
                    Text("\(buttonText)").foregroundStyle(Color(.white)).font(.title2).fontWeight(.bold)
                }
            }
        }
    }
}

#Preview {
    EditButton(buttonText: "Label") {}
}
