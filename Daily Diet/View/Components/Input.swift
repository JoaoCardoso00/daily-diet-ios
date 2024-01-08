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
    var maskFormatter: Formatter?

    let defaultFormatter = DateFormatter()

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
                        .foregroundStyle(Color(.gray2))
                        .padding()
                        .frame(height: height ?? 50).autocorrectionDisabled()
                } else {
                    TextField("", value: $text, formatter: maskFormatter ?? defaultFormatter)
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
