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

    var expandedView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 12) {
                    Image("approved_icon")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 24, height: 24, alignment: .center)
                    Text("Godkänd")
                }
                .foregroundColor(.custom(.approved))

                Text(medicine.description)

//                HStack(spacing: 20) {
//                    Image("plus_sign_icon")
//                        .foregroundColor(.custom(.error))
//                        .frame(width: 15, height: 15, alignment: .center)
//                        .rotationEffect(.degrees(-45))
//                    Text("Ta bort från Min Lista")
//                        .foregroundColor(.custom(.error))
//                }
//                .contentShape(Rectangle())
//                .onTapGesture {
//                    print("Show details for user")
//                }
            }
            Spacer()
        }
    }
    
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
                            Text(medicine.content)
                            Text(medicine.amount)
                                .fontWeight(.semibold)

                        if isExpanded {
                            expandedView
                        }
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 5)

                    Spacer()
                }
                .padding(15)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding(.horizontal, 16)
        .animation(.easeIn(duration: 0.3))
    }
}

struct MedicineCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MedicineCell(isExpanded: false, medicine: Medicine(name: "Alvedon",
                                                               content: "Paracetamol",
                                                               description: """
Alvedon innehåller paracetamol som är
smärtlindrande oh febernedsättande.

Alvedon används för behandling av tillfälliga
feber- och smärttillständ av lindrig art, t ex feber
vid förkylning, huvudvärk, tandvärk,
menstruationssmärtor, muskel- och ledvärk.

Alvedon kan användas av personer med känslig
mage eller magsär och personer med ökad
blödningsbenägenhet.
""", amount: "500 mg"))
            MedicineCell(isExpanded: false, medicine: Medicine(name: "name",
                                                               content: "Paracetamol",
                                                               description: "description", amount: "400 mg"))
        }.frame(width: .infinity, height: 100)
    }
}
