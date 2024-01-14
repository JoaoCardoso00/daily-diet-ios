//
//  Success.swift
//  Daily Diet
//
//  Created by joao cardoso on 14/01/24.
//

import SwiftUI

struct Fail: View {
    @EnvironmentObject var router: NavigationRouter
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Text("Que pena!")
            .font(.title)
            .foregroundStyle(Color.redDark)
            .padding()
        (Text("Você ")
            + Text("saiu da dieta ").bold()
            + Text("dessa vez, mas continue se esforçando e não desista!"))
            .padding(.horizontal, 25)
            .multilineTextAlignment(.center)
        Image(.fail)
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
    Fail().environmentObject(NavigationRouter())
}
