//
//  AppStorage.swift
//  MedScanner
//
//  Created by Jacob Ahlberg on 2021-10-15.
//

import Foundation
import SwiftUI

class LocalStorage: ObservableObject {
    // TODO: Set real values
    @AppStorage("emailStorage") var email: String = ""
    @AppStorage("favorites") var favorites: String = ""
}
