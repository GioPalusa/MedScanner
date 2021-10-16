//
//  MedicineCell.swift
//  MedScanner
//
//  Created by Mert Avci on 2021-10-16.
//

import SwiftUI

struct MedicineCell: View {
    
    let isExpanded: Bool
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Color.red
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Name")
                            .font(.headline)
                            .fontWeight(.bold)
                            .lineLimit(2)
                        Text("address")
                        Text("address")
                        
                        if isExpanded {
                            Rectangle()
                                .frame(width: .infinity, height: 50)
                        }
                    }
                    .padding(.horizontal, 5)
                    Spacer()
                    Button(action: { }){
                        Image(systemName: "chevron.right").tint(Color.gray)
                            .font(.body)
                    }
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
            MedicineCell(isExpanded: false)
            MedicineCell(isExpanded: false)
        }.frame(width: .infinity, height: 100)
    }
}


