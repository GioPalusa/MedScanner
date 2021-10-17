//
//  MedicineList.swift
//  MedScanner
//
//  Created by Mert Avci on 2021-10-15.
//

import SwiftUI

struct MedicineList: View {
    
    @State private var selection: Set<Med> = []
    var medicineList: [Med] = []
    
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
    
    private func selectDeselect(_ medicine: Med) {
        if selection.contains(medicine) {
            selection.remove(medicine)
        } else {
            selection.insert(medicine)
        }
    }
}

//struct MedicineList_Previews: PreviewProvider {
//    static var previews: some View {
//        MedicineList(medicineList: medicines)
//    }
//}


//
//var medicines: [DopingMed] {
//    [
//        .init(title: "-",
//              properties: Properties(id: ID(bsonType: ""),
//                                     medName: ID(bsonType: "Alvedon"),
//                                     substanceName: ID(bsonType: "Paracetamol"))),
//        .init(title: "-",
//              properties: Properties(id: ID(bsonType: ""),
//                                     medName: ID(bsonType: "Ipren"),
//                                     substanceName: ID(bsonType: "Ibuprofen")))
//    ]
//}
