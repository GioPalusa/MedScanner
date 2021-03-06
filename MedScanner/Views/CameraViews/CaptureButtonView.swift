//
//  CaptureButtonView.swift
//  MedScanner
//
//  Created by Giovanni Palusa on 2021-10-15.
//

import SwiftUI

struct CaptureButtonView: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var animationAmount: CGFloat = 1

    var body: some View {
        Image(systemName: "camera.fill")
            .font(.largeTitle)
            .padding(20)
            .background(.white)
            .foregroundColor(.black)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(colorScheme == .dark ? Color.white : Color.black)
                    .scaleEffect(animationAmount)
                    .opacity(Double(2 - animationAmount))
                )
            .onAppear {
                animationAmount = 2
            }
    }
}

struct CaptureButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CaptureButtonView()
    }
}
