//
//  ViewDidLoadModifier.swift
//  MedScanner
//
//  Created by Jacob Ahlberg on 2021-10-16.
//

import SwiftUI

struct ViewDidLoadModifier: ViewModifier {
    // MARK: Lifecycle

    init(perform action: (() -> Void)? = nil) {
        self.action = action
    }

    // MARK: Internal

    func body(content: Content) -> some View {
        content.onAppear {
            if didLoad == false {
                didLoad = true
                action?()
            }
        }
    }

    // MARK: Private

    @State private var didLoad = false
    private let action: (() -> Void)?
}
