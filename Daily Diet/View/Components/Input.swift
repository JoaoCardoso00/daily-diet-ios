//
//  EditButton.swift
//  Daily Diet
//
//  Created by joao cardoso on 20/12/23.
//

import SwiftUI

struct Input: View {
    @Binding var text: String
    var label: String?
    var height: CGFloat?

    @FocusState private var isFocused: Bool

    var body: some View {
        VStack(alignment: .leading) {
            if let label {
                Text(label)
            }
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(isFocused ? .gray2 : .gray5, lineWidth: 1)
                    )
                if height != nil {
                    TextEditor(text: $text)
                        .focused($isFocused)
                        .foregroundColor(Color(.gray2))
                        .background(Color.white)
                        .padding()
                        .frame(height: height ?? 50).autocorrectionDisabled()
                        .toolbar {
                            ToolbarItem(placement: .confirmationAction) {
                                VStack(alignment: .trailing) {
                                    Button("Confirmar") {
                                        isFocused = false
                                    }.disabled(!isFocused)
                                }
                            }
                        }
                } else {
                    TextField("", text: $text)
                        .focused($isFocused)
                        .foregroundStyle(Color(.gray2))
                        .padding()
                        .autocorrectionDisabled()
                }
            }.frame(height: height ?? 50)
        }
    }
}

struct InputPreview: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper("") {
            Input(text: $0)
        }
    }
}
