//
//  MedicineList.swift
//  MedScanner
//
//  Created by Mert Avci on 2021-10-15.
//

import SwiftUI

struct MedicineList: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                LazyVStack {
                    ForEach(1...100, id: \.self) { value in
                        Text("Row \(value)")
                    }.frame(width: .infinity, height: 200)
                }
            }
            .navigationTitle("Min lista")
        }
    }
}

struct MedicineList_Previews: PreviewProvider {
    static var previews: some View {
        MedicineList()
    }
}
