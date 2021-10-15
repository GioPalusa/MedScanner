//
//  MedScannerApp.swift
//  MedScanner
//
//  Created by Giovanni Palusa on 2021-10-15.
//

import SwiftUI

@main
struct MedScannerApp: App {
    @Environment(\.scenePhase) var scenePhase
    @UIApplicationDelegateAdaptor(MedAppDelegate.self) private var appDelegate

    init() {

    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }.onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
                case .active:
                    return
                case .background:
                    return
                case .inactive:
                    return
                @unknown default:
                    fatalError()
            }
        }
    }
}

class MedAppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}
