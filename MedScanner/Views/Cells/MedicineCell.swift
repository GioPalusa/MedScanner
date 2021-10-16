//
//  MedicineCell.swift
//  MedScanner
//
//  Created by Mert Avci on 2021-10-16.
//

import SwiftUI

struct MedicineCell: View {
    
    let isExpanded: Bool
    let medicine: Medicine
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Color.custom(.secondaryBackground, with: 1.0)
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(medicine.name)
                            .font(.headline)
                            .fontWeight(.bold)
                            .lineLimit(2)
                        Text("address")
                        Text("address")
                        
                        if isExpanded {
                            VStack(alignment: .leading, spacing: 20) {
                                HStack(spacing: 20) {
                                    Image("approved_icon")
                                        .foregroundColor(.custom(.approved))
                                        .frame(width: 15, height: 15, alignment: .center)
                                    Text("Godkänd")
                                        .foregroundColor(.custom(.approved))
                                    }
                                Text(medicine.description)
                                Text("Läs mer")
                                    .foregroundColor(.custom(.tint))
                                HStack(spacing: 20) {
                                    Image("plus_sign_icon")
                                        .foregroundColor(.custom(.error))
                                        .frame(width: 15, height: 15, alignment: .center)
                                        .rotationEffect(.degrees(-45))
                                    Text("Ta bort från Min Lista")
                                        .foregroundColor(.custom(.error))
                                    }
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    print("Show details for user")
                                }
                            }.frame(
                                maxWidth: .infinity,
                                maxHeight: 370
                              )
                        }
                    }
                    .padding(.horizontal, 5)
                    Spacer()
                }
                .padding(15)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .animation(.easeIn(duration: 0.12))
    }
}

struct MedicineCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MedicineCell(isExpanded: false, medicine: Medicine(id: UUID(), name: "name", description: "description"))
            MedicineCell(isExpanded: false, medicine: Medicine(id: UUID(), name: "name", description: "description"))
        }.frame(width: .infinity, height: 100)
    }
}


