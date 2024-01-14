//
//  Status.swift
//  Daily Diet
//
//  Created by joao cardoso on 23/12/23.
//

import SwiftUI

struct AddMeal: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: MealsViewModel
    @State private var Name: String = ""
    @State private var Description: String = ""
    @State private var Date: Date = .init()
    @State private var Hour: Date = .init()
    @State private var isOnDiet: Bool? = nil

    private var DateToString: String {
        Date.formatted()
    }

    private var validationPasses: Bool {
        return !Name.isEmpty && Name.count > 3 && isOnDiet != nil
    }

    func createMeal() {
        viewModel.createMeal(name: Name, isOnDiet: isOnDiet ?? false, date_eaten: combineDateAndTime(date: Date, time: Hour))
        dismiss()
    }

    var body: some View {
        GeometryReader { _ in
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
                                Input(text: $Name, label: "Nome").ignoresSafeArea(.keyboard)
                            }.gridCellColumns(2).padding(.bottom)
                                .environment(\.colorScheme, .light)
                                .ignoresSafeArea(.keyboard)
                                .dismissKeyboardOnTap()
                            GridRow {
                                Input(text: $Description, label: "Descrição", height: 125.0).environment(\.colorScheme, .light)
                            }
                            .gridCellColumns(2)
                            .padding(.bottom)
                            .dismissKeyboardOnTap()
                            GridRow {
                                VStack(alignment: .leading) {
                                    Text("Data").foregroundStyle(.black)
                                    StyledDatePicker(Date: $Date, type: .date)
                                }
                                VStack(alignment: .leading) {
                                    Text("Hora").foregroundStyle(.black)
                                    StyledDatePicker(Date: $Hour, type: .hour)
                                }
                            }.padding(.bottom)
                            GridRow {
                                VStack {
                                    Text("Está dentro da dieta?").frame(maxWidth: .infinity, alignment: .leading).font(.title3).foregroundStyle(.black)
                                    HStack {
                                        Select(buttonText: "Sim", type: .yes, active: isOnDiet == true) {
                                            isOnDiet = true
                                        }
                                        Select(buttonText: "Não", type: .no, active: isOnDiet == false) {
                                            isOnDiet = false
                                        }
                                    }
                                }

                            }.gridCellColumns(2).ignoresSafeArea(.keyboard)
                            Spacer()
                            DefaultButton(buttonText: "Cadastrar Refeição", disabled: !validationPasses) {
                                createMeal()
                            }
                        }.padding().padding(.horizontal)
                    }.padding(.top, 30)
                    Spacer()
                }
            }
            .navigationTitle("Nova Refeição")
        }.ignoresSafeArea(.keyboard)
    }
}

#Preview {
    AddMeal(viewModel: MealsViewModel(context: PersistenceController.preview.container.viewContext))
}
