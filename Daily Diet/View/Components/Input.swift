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

    @FocusState private var isFocused: Bool

    var body: some View {
        VStack(alignment: .leading) {
            if let label {
                Text(label)
            }
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(Color("Gray-500"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(isFocused ? .gray2 : .gray5, lineWidth: 1)
                    )
                TextField("", text: $text, prompt: Text(""))
                    .focused($isFocused)
                    .foregroundStyle(Color(.gray2))
                    .padding()
                    .autocorrectionDisabled()
            }.frame(height: 50)
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
