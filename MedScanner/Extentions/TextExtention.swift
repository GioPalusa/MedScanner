//
//  TextExtention.swift
//  MedScanner
//
//  Created by Mert Avci on 2021-10-16.
//

import SwiftUI

extension Text {

    func titleStyle() -> some View {
        self.fontWeight(.bold)
            .opacity(1.0)
            .font(.body)
            .lineLimit(2)
            .foregroundColor(.black)
    }

    func textStyle() -> some View {
        self.foregroundColor(.secondary)
            .font(.caption)
    }
}
