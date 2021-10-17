//
//  View+extensions.swift
//  MedScanner
//
//  Created by Jacob Ahlberg on 2021-10-16.
//

import SwiftUI
import UIKit

extension View {
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    func placeholder<Content: View>(when shouldShow: Bool, alignment: Alignment = .leading,
                                    @ViewBuilder placeholder: () -> Content) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }

    func onViewDidLoad(_ perform: @escaping () -> Void) -> some View {
        modifier(ViewDidLoadModifier(perform: perform))
    }
}
