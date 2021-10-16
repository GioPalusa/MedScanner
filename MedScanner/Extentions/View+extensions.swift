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
}
