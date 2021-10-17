//
//  MedicineList.swift
//  MedScanner
//
//  Created by Mert Avci on 2021-10-15.
//

import SwiftUI

struct MedicineList: View {
    
    @State private var selection: Set<Medicine> = []
    var medicineList: [Medicine]
    
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
        MedicineList(medicineList: medicines)
    }
}



var medicines: [Medicine] {
    [
        Medicine(name: "Alvedon",
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
""",
                 amount: "500 mg"),
        Medicine(name: "Ipren",
                 content: "Ibuprofen",
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
""",
                 amount: "500 mg"),
        Medicine(name: "Pamol",
                 content: "Lorem ipsum",
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
""",
                 amount: "500 mg")
    ]
}
