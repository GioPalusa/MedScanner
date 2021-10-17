//
//  StartPage.swift
//  MedScanner
//
//  Created by Giovanni Palusa on 2021-10-15.
//

import SwiftUI
import UIKit

// MARK: - StartPage

struct StartPage: View {
    @State private var image: UIImage?
    var customCameraRepresentable = CustomCameraRepresentable(
        cameraFrame: .zero,
        imageCompletion: { _ in }
    )

    @FocusState private var isFocused: Bool
    @State private var searchText = String()
    @State private var presentCameraFrame = true

    var videoFrameView: some View {
        CustomCameraView(
            customCameraRepresentable: customCameraRepresentable,
            imageCompletion: { newImage in
                self.image = newImage
            }
        )
        .cornerRadius(26)
        .padding(32)
        .onViewDidLoad {
            customCameraRepresentable.startRunningCaptureSession()
        }
    }

    var searchView: some View {
        SearchBar(text: $searchText, focusedField: $isFocused)
            .onChange(of: searchText) { _ in
                // TODO: Handle new value
            }
            .onChange(of: isFocused) { newValue in
                withAnimation { presentCameraFrame = !newValue }
            }
    }

    var body: some View {
        VStack(spacing: 16) {
            videoFrameView
                .opacity(presentCameraFrame ? 1 : 0)
                .frame(height: presentCameraFrame ? 300 : 0)
            searchView

            Spacer()
            if presentCameraFrame {
                CaptureButtonView()
                    .padding(.bottom, 16)
            }
        }
        .background(Color.custom(.background))
    }
}

// MARK: - StartPage_Previews

struct StartPage_Previews: PreviewProvider {
    static var previews: some View {
        StartPage()
    }
}
