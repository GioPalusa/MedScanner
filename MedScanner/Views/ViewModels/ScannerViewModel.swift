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
    @Published var searchResult: [DopingMed] = []

    private var lastSearchedText = ""
    private var lastSearchedResult: [DopingMed] = []
    private var subscriptions: Set<AnyCancellable> = []

    init() {
        $searchedString
            .debounce(for: .milliseconds(800), scheduler: RunLoop.main)
            .removeDuplicates()
            .compactMap {
                guard $0.count >= 3 else {
                    self.lastSearchedResult = []
                    self.searchResult = []
                    return nil
                }
                return $0
            }
            .sink { self.search(for: $0) }
            .store(in: &subscriptions)
    }

    func listFocusChanged(focused: Bool) {
        if focused {
            searchedString = lastSearchedText
            searchResult = lastSearchedResult
        } else  {
            lastSearchedText = searchedString
            lastSearchedResult = searchResult
            searchedString = ""
        }
    }

    private func search(for medicine: String) {
        searchResult = medicines
    }

    private func fetch() async {
        
    }
}
