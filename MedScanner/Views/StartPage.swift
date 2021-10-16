//
//  StartPage.swift
//  MedScanner
//
//  Created by Giovanni Palusa on 2021-10-15.
//

import SwiftUI
import UIKit

struct StartPage: View {
    var body: some View {
        VStack {
            CustomCameraRepresentable(cameraFrame: CGRect(x: 0, y: 0, width: 300, height: 300), imageCompletion: { image in

            })
        }
    }
}

struct StartPage_Previews: PreviewProvider {
    static var previews: some View {
        StartPage()
    }
}
