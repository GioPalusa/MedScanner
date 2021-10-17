//
//  ScannerViewModel.swift
//  MedScanner
//
//  Created by Jacob Ahlberg on 2021-10-17.
//

import SwiftUI
import Combine

class ScannerViewModel: ObservableObject {
    @Published var searchedString: String = ""

    var lastSearchedText = ""
    private var subscriptions: Set<AnyCancellable> = []

    init() {
        $searchedString
            .debounce(for: .milliseconds(800), scheduler: RunLoop.main)
            .removeDuplicates()
            .map { $0 }
            .sink { self.search(for: $0) }
            .store(in: &subscriptions)
    }

    private func search(for medicine: String) {

    }

    private func fetch() async {
        
    }
}
