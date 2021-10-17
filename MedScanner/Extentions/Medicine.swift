//
//  Medicine.swift
//  MedScanner
//
//  Created by Mert Avci on 2021-10-16.
//

import Foundation

struct Medicine: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let content: String
    let description: String
    let amount: String
}
