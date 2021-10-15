//
//  UserDefaultExtention.swift
//  MedScanner
//
//  Created by Mert Avci on 2021-10-15.
//

import Foundation

enum UserDefaultsKeys: String {
    case medicine = "medicine"
}


protocol UserDefaultsProtocol {
    func object(forKey defaultName: String) -> Any?
    func bool(forKey defaultName: String) -> Bool
    func set(_ value: Any?, forKey defaultName: String)
    func removeAll()

    subscript<T>(key: UserDefaultsKeys) -> T? { get set }
}

extension UserDefaults: UserDefaultsProtocol {
    // Example of use:
    // UserDefault.standard[.key] as Type?
    // Where "Type" is what kind of type you're expecting to get
    subscript<T>(key: UserDefaultsKeys) -> T? {
        get {
            guard let value = value(forKey: key.rawValue) as? T else {
                return nil
            }
            return value
        }
        set {
            set(newValue, forKey: key.rawValue)
        }
    }
    
    func removeAll() {
        guard let domain = Bundle.main.bundleIdentifier else { return }
        self.removePersistentDomain(forName: domain)
    }
}
