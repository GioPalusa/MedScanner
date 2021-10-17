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
            TextField("", text: $text)
                .placeholder(when: text.isEmpty,
                             placeholder: {
                    Text("Search...")
                        .foregroundColor(.custom(.tint))
                })
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color.custom(.secondaryBackground))
                .foregroundColor(.custom(.tint))
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
                .foregroundColor(.custom(.tint))
                .transition(.move(edge: .trailing))
                .animation(.default, value: !isEditing)
            }
        }
    }
}
