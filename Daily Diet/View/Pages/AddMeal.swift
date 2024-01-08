//
//  Status.swift
//  Daily Diet
//
//  Created by joao cardoso on 23/12/23.
//

import SwiftUI

struct AddMeal: View {
    @State private var Name: String = ""
    @State private var Description: String = ""
    @State private var Date: String = ""
    @State private var Hour: String = ""
    @State private var isOnDiet: Bool? = nil

    var body: some View {
        ZStack(alignment: .bottom) {
            Color(.gray5).ignoresSafeArea(edges: .top)
            RoundedRectangle(cornerRadius: 16)
                .ignoresSafeArea(edges: .bottom)
                .foregroundStyle(Color.white)
                .frame(height: 700)
            VStack {
                VStack {
                    Grid(horizontalSpacing: 15, verticalSpacing: 15) {
                        GridRow {
                            Input(text: $Name, label: "Nome")
                        }.gridCellColumns(2).padding(.bottom)
                        GridRow {
                            Input(text: $Description, label: "Descrição", height: 125.0)
                        }.gridCellColumns(2).padding(.bottom)
                        GridRow {
                            Input(text: $Date, label: "Data")
                            Input(text: $Hour, label: "Hora")
                        }.padding(.bottom)
                        GridRow {
                            VStack {
                                Text("Está dentro da dieta?").frame(maxWidth: .infinity, alignment: .leading).font(.title3)
                                HStack {
                                    Select(buttonText: "Sim", type: .yes, active: isOnDiet == true) {
                                        isOnDiet = true
                                    }
                                    Select(buttonText: "Não", type: .no, active: isOnDiet == false) {
                                        isOnDiet = false
                                    }
                                }
                            }

                        }.gridCellColumns(2)
                        Spacer()
                        DefaultButton(buttonText: "Cadastrar Refeição") {}
                    }.padding().padding(.horizontal)
                }.padding(.top, 30)
                Spacer()
            }
        }.navigationTitle("Nova Refeição")
    }
}

#Preview {
    AddMeal()
}
