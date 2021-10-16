//
//  CustomCameraRepresentable.swift
//  MedScanner
//
//  Created by Giovanni Palusa on 2021-10-16.
//

import SwiftUI
import AVFoundation

final class CustomCameraRepresentable: UIViewControllerRepresentable {
    //    @Environment(\.presentationMode) var presentationMode

    init(cameraFrame: CGRect, imageCompletion: @escaping ((UIImage) -> Void)) {
        self.cameraFrame = cameraFrame
        self.imageCompletion = imageCompletion
    }

    var cameraFrame: CGRect
    var imageCompletion: ((UIImage) -> Void)

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> CustomCameraController {
        CustomCameraController.shared.configurePreviewLayer(with: cameraFrame)
        CustomCameraController.shared.captureDelegate = context.coordinator
        return CustomCameraController.shared
    }

    func updateUIViewController(_ cameraViewController: CustomCameraController, context: Context) {}

    func takePhoto() {
        CustomCameraController.shared.takePhoto()
    }

    func startRunningCaptureSession() {
        CustomCameraController.shared.startRunningCaptureSession()
    }

    func stopRunningCaptureSession() {
        CustomCameraController.shared.stopRunningCaptureSession()
    }
}

extension CustomCameraRepresentable {
    final class Coordinator: NSObject, AVCapturePhotoCaptureDelegate {
        private let parent: CustomCameraRepresentable

        init(_ parent: CustomCameraRepresentable) {
            self.parent = parent
        }

        func photoOutput(_ output: AVCapturePhotoOutput,
                         didFinishProcessingPhoto photo: AVCapturePhoto,
                         error: Error?) {
            if let imageData = photo.fileDataRepresentation() {
                guard let newImage = UIImage(data: imageData) else { return }
                parent.imageCompletion(newImage)
            }
            //            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
