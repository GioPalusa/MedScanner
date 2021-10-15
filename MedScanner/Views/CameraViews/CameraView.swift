//
//  CameraView.swift
//  MedScanner
//
//  Created by Giovanni Palusa on 2021-10-15.
//

import SwiftUI

struct CameraView: View {
    @State private var image: UIImage?

    var customCameraRepresentable = CustomCameraRepresentable(
        cameraFrame: .zero,
        imageCompletion: { _ in }
    )

    var body: some View {
        CustomCameraView(captureButtonAction: {})
            .onAppear {
                customCameraRepresentable.startRunningCaptureSession()
            }
            .onDisappear {
                customCameraRepresentable.stopRunningCaptureSession()
            }

        if let image = image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}


struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
