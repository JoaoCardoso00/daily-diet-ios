//
//  Success.swift
//  Daily Diet
//
//  Created by joao cardoso on 14/01/24.
//

import SwiftUI

struct Success: View {
    @EnvironmentObject var router: NavigationRouter
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Text("Continue assim!")
            .font(.title)
            .foregroundStyle(Color.greenDark)
            .padding()
        Text("Você continua ")
            + Text("dentro da dieta").bold()
            + Text(". Muito bem!")
        Image(.success)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 275)
            .padding(50)
        DefaultButton(buttonText: "Ir para a página inicial") {
            router.goToRoot()
        }
        .padding(.horizontal, 75)
    }
}

#Preview {
    Success().environmentObject(NavigationRouter())
}
