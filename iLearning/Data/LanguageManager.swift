//
//  LanguageManager.swift
//  iLearning
//
//  Created by Amisha Italiya on 06/12/22.
//

import UIKit
import SwiftUI

public class LanguageManger {
    
    public static let shared = LanguageManger()

    public init() { }
    
    /// Returns the currnet language
    public var currentLanguage: Languages {
        get {
            guard let currentLang = UserDefaults.standard.string(forKey: "selectedLanguage") else {
                return defaultLanguage
            }
            return Languages(rawValue: currentLang)!
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "selectedLanguage")
        }
    }

    /// Returns the default language that the app will run first time
    public var defaultLanguage: Languages {
        get {
            guard let defaultLanguage = UserDefaults.standard.string(forKey: "defaultLanguage") else {
                return Languages(rawValue: Locale.current.identifier) ?? Languages.en
            }
            return Languages(rawValue: defaultLanguage)!
        }
        set {
            let defaultLanguage = UserDefaults.standard.string(forKey: "defaultLanguage")
            guard defaultLanguage == nil else {
                return
            }
            UserDefaults.standard.set(newValue.rawValue, forKey: "defaultLanguage")
            UserDefaults.standard.set(newValue.rawValue, forKey: "selectedLanguage")
            setLanguage(language: newValue)
        }
    }

    /// Returns the direction of the language
    public var isRightToLeft: Bool {
        let lang = currentLanguage.rawValue
        return lang.contains("ar") || lang.contains("he") || lang.contains("ur") || lang.contains("fa")
    }

    /// Returns the app locale for use it in dates and currency
    public var appLocale: Locale {
        return Locale(identifier: currentLanguage.rawValue)
    }

    /// Returns list of the supported languages
    public var supportedLanguages: [Languages] {
        return self.availableLanguages()
    }

    /// Set the current language for the app
    /// - parameter language: The language that you need from the app to run with
    public func setLanguage(language: Languages) {

        // change the dircation of the views
        let semanticContentAttribute: UISemanticContentAttribute = isRightToLeft ? .forceRightToLeft : .forceLeftToRight
        UIView.appearance().semanticContentAttribute = semanticContentAttribute
        UINavigationBar.appearance().semanticContentAttribute = semanticContentAttribute
        UITextField.appearance().semanticContentAttribute = semanticContentAttribute
        UITextView.appearance().semanticContentAttribute = semanticContentAttribute

        // change app language
        UserDefaults.standard.set([language.rawValue], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()

        // set current language
        currentLanguage = language
        NotificationDispatcher.sharedInstance.dispatch(.languageChanged)
    }

    /**
     List available languages
     - Returns: Array of available languages.
     */
    private func availableLanguages(_ excludeBase: Bool = true) -> [Languages] {
        var availableLanguages = Bundle.main.localizations
        // If excludeBase = true, don't include "Base" in available languages
        if let indexOfBase = availableLanguages.firstIndex(of: "Base"), excludeBase == true {
            availableLanguages.remove(at: indexOfBase)
        }

        var languages: [Languages] = []
        availableLanguages.forEach { lang in
            if let language = Languages(rawValue: lang) {
                languages.append(language)
            }
        }
        return languages
    }
}

public enum Languages: String, CaseIterable {
    case en

    public var languageText: String? {
        switch self {
        case .en:
            return "English"
        }
    }

    public var isSelected: Bool {
        return self == LanguageManger.shared.currentLanguage
    }
}
