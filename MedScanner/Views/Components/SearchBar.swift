//
//  SearchBar.swift
//  MedScanner
//
//  Created by Jacob Ahlberg on 2021-10-16.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var focusedField: FocusState<Bool>.Binding

    @State private var isEditing = false

    var body: some View {
        HStack {
            TextField("Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    withAnimation { self.isEditing = true }
                }
                .focused(focusedField)

            if isEditing {
                Button(action: {
                    self.isEditing = false
                    dismissKeyboard()
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default, value: !isEditing)
            }
        }
    }
}
