//
//  MedicineCell.swift
//  MedScanner
//
//  Created by Mert Avci on 2021-10-16.
//

import SwiftUI

struct MedicineCell: View {
    var body: some View {
        ZStack(alignment: .trailing) {
            Color.red
            HStack {
                VStack(alignment: .leading) {
                    Text("Name")
                        .font(.headline)
                        .fontWeight(.bold)
                        .lineLimit(2)
                    Text("address")
                    Text("address")
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
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

struct MedicineCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MedicineCell()
            MedicineCell()
        }.frame(width: .infinity, height: 100)
    }
}


