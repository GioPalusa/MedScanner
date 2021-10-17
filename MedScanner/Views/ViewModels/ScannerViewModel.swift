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
    @Published var searchResult: [Med] = []

    private var allMeds: [Med] = []

    private var lastSearchedText = ""
    private var lastSearchedResult: [Med] = []
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
            .sink {
                self.search(for: $0) }
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

    func parseJSON() {
        guard let url = Bundle.main.url(forResource: "Untitled", withExtension: "json") else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        do {
            let dopingMeds = try JSONDecoder().decode(DopingMed.self, from: data)
            allMeds = dopingMeds.meds
        } catch {
            print("Failed to decode: \(error)")
        }
    }

    private func search(for medicine: String) {
       let filteredResult = self.allMeds.filter {
           $0.medName.range(of: medicine, options: .caseInsensitive) != nil ||
           $0.substanceName.range(of: medicine, options: .caseInsensitive) != nil
        }

        self.searchResult = filteredResult
    }

    private func fetch() async {
        
    }
}
