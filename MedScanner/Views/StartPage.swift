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

    var body: some View {
        CustomCameraView(
            customCameraRepresentable: customCameraRepresentable,
            imageCompletion: { newImage in
                self.image = newImage
            }
        )
            .frame(width: 200, height: 300)
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
                .frame(width: 20, height: 20)
        }
    }
}

struct StartPage_Previews: PreviewProvider {
    static var previews: some View {
        StartPage()
    }
}
