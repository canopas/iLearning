//
//  StringResource+Extension.swift
//  iLearning
//
//  Created by Amisha Italiya on 06/12/22.
//

import Foundation
import Rswift

// MARK: - StringResource extention
public extension StringResource {

    /// Localize the current string to the selected language - returns: The localized string
    func localized(_ language: Languages = appResolve(serviceType: LanguageManager.self).currentLanguage) -> String {
        var baseBundle: Bundle?
        var localizedBundle: Bundle?
        var fallback: String?

        if let basePath = bundle.path(forResource: "Base", ofType: "lproj"),
           let bundle = Bundle(path: basePath) {
            baseBundle = bundle
        }

        if let localizedPath = bundle.path(forResource: language.rawValue, ofType: "lproj"),
           let bundle = Bundle(path: localizedPath) {
            localizedBundle = bundle
        }

        if let baseBundle = baseBundle {
            fallback = baseBundle.localizedString(forKey: key, value: key, table: tableName)
        }

        guard let localizedBundle = localizedBundle
            else {
            return fallback ?? self.key
        }

        return localizedBundle.localizedString(forKey: key, value: fallback, table: tableName)
    }
}
