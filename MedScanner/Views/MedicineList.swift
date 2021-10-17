//
//  MedicineList.swift
//  MedScanner
//
//  Created by Mert Avci on 2021-10-15.
//

import SwiftUI

struct MedicineList: View {
    
    @State private var selection: Set<DopingMed> = []
    var medicineList: [DopingMed]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                LazyVStack {
                    ForEach(medicineList) { medicine in
                        MedicineCell(isExpanded: self.selection.contains(medicine), medicine: medicine)
                            .onTapGesture { selectDeselect(medicine) }
                    }
                }
            }
            .navigationTitle("Min lista")
        }
    }
    
    private func selectDeselect(_ medicine: DopingMed) {
        if selection.contains(medicine) {
            selection.remove(medicine)
        } else {
            selection.insert(medicine)
        }
    }
}

struct MedicineList_Previews: PreviewProvider {
    static var previews: some View {
        MedicineList(medicineList: medicines)
    }
}



var medicines: [DopingMed] {
    [
        .init(title: "Alvedon",
              properties: .init(id: ID(bsonType: ""), name: ID(bsonType: ""))),
        .init(title: "Ipren",
              properties: .init(id: ID(bsonType: ""), name: ID(bsonType: ""))),
        .init(title: "Alvedon",
              properties: .init(id: ID(bsonType: ""), name: ID(bsonType: "")))
    ]
}
