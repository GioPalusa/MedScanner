//
//  MedicineCell.swift
//  MedScanner
//
//  Created by Mert Avci on 2021-10-16.
//

import SwiftUI

struct MedicineCell: View {
    
    let isExpanded: Bool
    let medicine: Med

    var expandedView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 12) {
                    Image("warning_icon")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.custom(.doped))
                        .scaledToFill()
                        .frame(width: 24, height: 24, alignment: .center)
                    Text("Ej godkänd")
                }
                .foregroundColor(.custom(.doped))

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
            }.padding(.top, 2)
            Spacer()
        }
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Color.custom(.secondaryBackground, with: 1.0)
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(medicine.medName)
                            .font(.headline)
                            .fontWeight(.bold)
                            .lineLimit(2)
                        Text(medicine.substanceName)
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

//struct MedicineCell_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack {
//            MedicineCell(isExpanded: false,
//                         medicine: DopingMed(title: "-",
//                                             properties:
//                                                Properties(id: ID(bsonType: ""),
//                                                           medName: ID(bsonType: "Alvedon"),
//                                                           substanceName: ID(bsonType: "Paracetamol")
//                                                          )
//                                            )
//            )
//            MedicineCell(isExpanded: false,
//                         medicine: DopingMed(title: "-",
//                                             properties:
//                                                Properties(id: ID(bsonType: ""),
//                                                           medName: ID(bsonType: "Ipren"),
//                                                           substanceName: ID(bsonType: "Paracetamol")
//                                                          )
//                                            )
//            )
//        }.frame(width: .infinity, height: 100)
//    }
//}
