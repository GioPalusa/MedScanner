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
                        ZStack(alignment: .leading) {
                                    
                                    Color.red
                                    HStack {
                        
                                        
                                        VStack(alignment: .leading) {
                                            Text("Name")
                                                .font(.headline)
                                                .fontWeight(.bold)
                                                .lineLimit(2)
                                            
                                            Text("address")
                                                .padding(.bottom, 5)
                                            
                                            
                                       
                                            
                                    
                                            .padding(.bottom, 5)
                                            
                                
                                            
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
                    }.frame(width: .infinity, height: 100)
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
