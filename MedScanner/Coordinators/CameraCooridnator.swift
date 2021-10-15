//
//  CameraCooridnator.swift
//  MedScanner
//
//  Created by Giovanni Palusa on 2021-10-15.
//

import Foundation
import UIKit

class CameraCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var picker: imagePickerView

    init(picker: imagePickerView) {
        self.picker = picker
    }

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.picker.selectedImage = selectedImage
        self.picker.isPresented.wrappedValue.dismiss()
    }

}
