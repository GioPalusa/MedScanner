//
//  Color+extensions.swift
//  MedScanner
//
//  Created by Jacob Ahlberg on 2021-10-16.
//

import UIKit
import SwiftUI

extension Color {
    enum Custom {
        case background
        case secondaryBackground
        case tabMenu
        case tint
        case doped
        case approved
        case error

        var color: Color {
            switch self {
            case .background: return Color(uiColor: UIColor(hexString: "191B1C"))
            case .secondaryBackground: return Color(uiColor: UIColor(hexString: "232A31"))
            case .tabMenu: return Color(uiColor: UIColor(hexString: "18171C"))
            case .tint: return Color(uiColor: UIColor(hexString: "49999CC"))
            case .doped: return Color(uiColor: UIColor(hexString: "FF1717"))
            case .approved: return Color(uiColor: UIColor(hexString: "2CB039"))
            case .error: return Color(uiColor: UIColor(hexString: "FF4949"))
            }
        }
    }

    static func custom(_ color: Custom, with opacity: Double = 1.0) -> Color {
        color.color.opacity(opacity)
    }
}
