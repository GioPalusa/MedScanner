//
//  CustomCameraController.swift
//  MedScanner
//
//  Created by Giovanni Palusa on 2021-10-15.
//

import SwiftUI
import AVFoundation

final class CustomCameraController: UIViewController {
    static let shared = CustomCameraController()

    private var captureSession = AVCaptureSession()
    private var backCamera: AVCaptureDevice?
    private var frontCamera: AVCaptureDevice?
    private var currentCamera: AVCaptureDevice?
    private var photoOutput: AVCapturePhotoOutput?
    private var cameraPreviewLayer: AVCaptureVideoPreviewLayer?

    weak var captureDelegate: AVCapturePhotoCaptureDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func configurePreviewLayer(with frame: CGRect) {
        let cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)

        cameraPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        cameraPreviewLayer.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        cameraPreviewLayer.frame = frame

        view.layer.insertSublayer(cameraPreviewLayer, at: 0)
    }

    func startRunningCaptureSession() {
        captureSession.startRunning()
    }

    func stopRunningCaptureSession() {
        captureSession.stopRunning()

    }

    func takePhoto() {
        let settings = AVCapturePhotoSettings()

        guard let delegate = captureDelegate else {
            print("delegate nil")
            return
        }
        photoOutput?.capturePhoto(with: settings, delegate: delegate)
    }

    // MARK: Private

    private func setup() {
        setupCaptureSession()
        setupDevice()
        setupInputOutput()
    }

    private func setupCaptureSession() {
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
    }

    private func setupDevice() {
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(
            deviceTypes: [.builtInWideAngleCamera],
            mediaType: .video,
            position: .unspecified
        )

        for device in deviceDiscoverySession.devices {
            switch device.position {
                case AVCaptureDevice.Position.front:
                    frontCamera = device
                case AVCaptureDevice.Position.back:
                    backCamera = device
                default:
                    break
            }
        }

        self.currentCamera = self.backCamera
    }

    private func setupInputOutput() {
        do {
            guard let currentCamera = currentCamera else { return }
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera)

            captureSession.addInput(captureDeviceInput)

            photoOutput = AVCapturePhotoOutput()
            photoOutput?.setPreparedPhotoSettingsArray(
                [AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.hevc])],
                completionHandler: nil
            )

            guard let photoOutput = photoOutput else { return }
            captureSession.addOutput(photoOutput)
        } catch {
            print(error)
        }
    }
}

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
