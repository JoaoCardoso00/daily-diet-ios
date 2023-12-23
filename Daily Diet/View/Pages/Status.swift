//
//  Status.swift
//  Daily Diet
//
//  Created by joao cardoso on 23/12/23.
//

import SwiftUI

struct Status: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(.greenLight).ignoresSafeArea(edges: .top)
            RoundedRectangle(cornerRadius: 16)
                .ignoresSafeArea(edges: .bottom)
                .foregroundStyle(Color.white)
                .frame(height: 620)
            VStack {
                VStack {
                    Text("\(25.6, specifier: "%.2f")%")
                        .font(.system(size: 42))
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                    Text("das refeições dentro da dieta").foregroundStyle(.gray2)
                }.padding(.bottom, 75)

                VStack {
                    Text("Estatísticas gerais").fontWeight(.semibold)

                    Grid(horizontalSpacing: 15, verticalSpacing: 15) {
                        GridRow {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 100)
                                    .foregroundStyle(.gray6)
                                VStack {
                                    Text("22").font(.system(size: 25)).padding(4)
                                    Text("melhor sequência de pratos dentro da dieta").font(.footnote).foregroundStyle(.gray2)
                                }
                            }
                        }.gridCellColumns(2)
                        GridRow {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 100)
                                    .foregroundStyle(.gray6)
                                VStack {
                                    Text("109").font(.system(size: 25)).padding(4)
                                    Text("refeições registradas").font(.footnote).foregroundStyle(.gray2)
                                }
                            }
                        }.gridCellColumns(2)
                        GridRow {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 100)
                                    .foregroundStyle(.greenLight)
                                VStack {
                                    Text("99")
                                        .font(.system(size: 25))
                                        .padding(4)
                                    Text("refeições dentro da dieta")
                                        .font(.footnote)
                                        .foregroundStyle(.gray2)
                                        .multilineTextAlignment(.center)
                                }.padding()
                            }
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 100)
                                    .foregroundStyle(.redLight)
                                VStack {
                                    Text("10").font(.system(size: 25)).padding(4)
                                    Text("refeições fora \n da dieta")
                                        .font(.footnote)
                                        .foregroundStyle(.gray2)
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                    }.padding().padding(.horizontal)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    Status()
}
