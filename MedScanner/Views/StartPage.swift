//
//  StartPage.swift
//  MedScanner
//
//  Created by Giovanni Palusa on 2021-10-15.
//

import SwiftUI
import UIKit

struct StartPage: View {
    @State private var image: UIImage?
    var customCameraRepresentable = CustomCameraRepresentable(
        cameraFrame: .zero,
        imageCompletion: { _ in }
    )

    @FocusState private var isFocused: Bool
    @State private var searchText = String()
    @State private var presentCameraFrame = true

    var body: some View {
        VStack(spacing: 16) {
            if presentCameraFrame {
                CustomCameraView(
                    customCameraRepresentable: customCameraRepresentable,
                    imageCompletion: { newImage in
                        self.image = newImage
                    }
                )
                    .frame(height: 300)
                    .onAppear {
                        customCameraRepresentable.startRunningCaptureSession()
                    }
                    .onDisappear {
                        customCameraRepresentable.stopRunningCaptureSession()
                    }
            }
            SearchBar(text: $searchText, focusedField: $isFocused)
                .onChange(of: searchText) { newValue in
                    // TODO: Handle new value
                }
                .onChange(of: isFocused) { newValue in
                    withAnimation { presentCameraFrame = !newValue }
                }

            Spacer()
        }
    }
}

struct StartPage_Previews: PreviewProvider {
    static var previews: some View {
        StartPage()
    }
}
