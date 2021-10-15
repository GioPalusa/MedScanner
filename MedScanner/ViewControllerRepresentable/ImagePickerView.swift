//
//  ImagePickerView.swift
//  MedScanner
//
//  Created by Giovanni Palusa on 2021-10-15.
//

import Foundation
import UIKit
import SwiftUI

struct imagePickerView: UIViewControllerRepresentable {

    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented
    var sourceType: UIImagePickerController.SourceType

    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = self.sourceType
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}
