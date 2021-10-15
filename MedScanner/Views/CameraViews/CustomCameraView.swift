//
//  CustomCameraView.swift
//  MedScanner
//
//  Created by Giovanni Palusa on 2021-10-15.
//

import SwiftUI

struct CustomCameraView: View {
    var captureButtonAction: (() -> Void)

    var body: some View {
        CaptureButtonView()
            .onTapGesture {
                captureButtonAction()
            }
    }
}

struct CustomCameraView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCameraView(captureButtonAction: {})
    }
}
