//
//  StartPage.swift
//  MedScanner
//
//  Created by Giovanni Palusa on 2021-10-15.
//

import SwiftUI
import UIKit

// MARK: - StartPage

struct ScannerView: View {
    @StateObject private var scannerViewModel = ScannerViewModel()

    @FocusState private var isFocused: Bool
    @State private var presentCameraFrame = true
    @State private var selection: Set<DopingMed> = []

    var customCameraRepresentable = CustomCameraRepresentable(
        cameraFrame: .zero,
        imageCompletion: { _ in }
    )

    var videoFrameView: some View {
        CustomCameraView(
            customCameraRepresentable: customCameraRepresentable,
            imageCompletion: { newImage in
                // TODO: do something about the captured image
                ()
            }
        )
        .cornerRadius(26)
        .padding(32)
        .onViewDidLoad {
            customCameraRepresentable.startRunningCaptureSession()
        }
    }

    var searchView: some View {
        SearchBar(text: $scannerViewModel.searchedString, focusedField: $isFocused)
            .onChange(of: isFocused) { newValue in
                scannerViewModel.listFocusChanged(focused: newValue)
                withAnimation { presentCameraFrame = !newValue }
            }
            .padding(.horizontal, isFocused ? 0 : 24)
            .animation(.easeIn(duration: 0.2))
    }

    var resultView: some View {
        ScrollView {
            LazyVStack {
                ForEach(scannerViewModel.searchResult, id: \.id) { medicine in
                    MedicineCell(isExpanded: selection.contains(medicine), medicine: medicine)
                        .onTapGesture { selectDeselect(medicine) }
                }
            }
        }
    }

    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 0) {
                HStack {
                    Text("Skanna din medicin")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.leading, 32)
                        .offset(x: 0, y: 20)
                    Spacer()
                }
                .opacity(presentCameraFrame ? 1 : 0)
            videoFrameView
                .opacity(presentCameraFrame ? 1 : 0)
                .frame(height: presentCameraFrame ? 300 : 0)
            }

            VStack(spacing: 16) {
                searchView
                if !presentCameraFrame {
                    resultView
                }
            }

            Spacer()
            if presentCameraFrame {
                CameraControlsView(captureButtonAction: { [weak customCameraRepresentable] in
                    customCameraRepresentable?.takePhoto()
                })
                    .padding(.bottom, 16)
            }
        }
        .background(Color.custom(.background))
        .task {
            try! await MedRepository().getDBCollection()
        }
    }

    private func selectDeselect(_ medicine: DopingMed) {
        if selection.contains(medicine) {
            selection.remove(medicine)
        } else {
            selection.insert(medicine)
        }
    }
}

// MARK: - StartPage_Previews

struct StartPage_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView()
    }
}
