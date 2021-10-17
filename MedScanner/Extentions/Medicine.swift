//
//  Medicine.swift
//  MedScanner
//
//  Created by Mert Avci on 2021-10-16.
//

import Foundation


struct Medicine: Identifiable, Hashable {
    let id: UUID
    let name: String
    let description: String
}
