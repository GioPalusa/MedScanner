//
//  CustomCameraView.swift
//  MedScanner
//
//  Created by Giovanni Palusa on 2021-10-15.
//

import SwiftUI

struct CustomCameraView: View {
    var customCameraRepresentable: CustomCameraRepresentable
    var imageCompletion: ((UIImage) -> Void)

    var body: some View {
        GeometryReader { geometry in
            VStack {
                let frame = CGRect(x: 0, y: 0, width: geometry.size.width, height: geometry.size.height - 100)
                cameraView(frame: frame)

                HStack {
                    CameraControlsView(captureButtonAction: { [weak customCameraRepresentable] in
                        customCameraRepresentable?.takePhoto()
                    })
                }
            }
        }
    }

    private func cameraView(frame: CGRect) -> CustomCameraRepresentable {
        customCameraRepresentable.cameraFrame = frame
        customCameraRepresentable.imageCompletion = imageCompletion
        return customCameraRepresentable
    }
}

struct CameraControlsView: View {
    var captureButtonAction: (() -> Void)

    var body: some View {
        CaptureButtonView()
            .onTapGesture {
                captureButtonAction()
            }
    }
}
