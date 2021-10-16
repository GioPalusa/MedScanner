//
//  MedicineList.swift
//  MedScanner
//
//  Created by Mert Avci on 2021-10-15.
//

import SwiftUI

struct MedicineList: View {
    
    @State private var selection: Set<Medicine> = []
    
    var medicineList = [
        Medicine(id: UUID(), name: "Alvedon", description: "Alvedon     description"),
        Medicine(id: UUID(), name: "Ipren", description: "Ipren description"),
        Medicine(id: UUID(), name: "Pamol", description: "Pamol description")]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                LazyVStack {
                    ForEach(medicineList) { medicine in
                        MedicineCell(isExpanded: self.selection.contains(medicine))
                            .onTapGesture { selectDeselect(medicine) }
                    }
                }
            }
            .navigationTitle("Min lista")
        }
    }
    
    func selectDeselect(_ medicine: Medicine) {
        if selection.contains(medicine) {
            selection.remove(medicine)
        } else {
            selection.insert(medicine)
        }
    }
}

struct MedicineList_Previews: PreviewProvider {
    static var previews: some View {
        MedicineList()
    }
}
