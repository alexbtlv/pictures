//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map(Locale.init)
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 4 storyboards.
  struct storyboard {
    /// Storyboard `Auth`.
    static let auth = _R.storyboard.auth()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Load`.
    static let load = _R.storyboard.load()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Auth", bundle: ...)`
    static func auth(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.auth)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Load", bundle: ...)`
    static func load(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.load)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.image` struct is generated, and contains static references to 1 images.
  struct image {
    /// Image `placeholder`.
    static let placeholder = Rswift.ImageResource(bundle: R.hostingBundle, name: "placeholder")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "placeholder", bundle: ..., traitCollection: ...)`
    static func placeholder(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.placeholder, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.nib` struct is generated, and contains static references to 1 nibs.
  struct nib {
    /// Nib `PhotoTableViewCell`.
    static let photoTableViewCell = _R.nib._PhotoTableViewCell()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "PhotoTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.photoTableViewCell) instead")
    static func photoTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.photoTableViewCell)
    }
    #endif

    static func photoTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> PhotoTableViewCell? {
      return R.nib.photoTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? PhotoTableViewCell
    }

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 7 localization keys.
    struct localizable {
      /// Value: Email
      static let emailWord = Rswift.StringResource(key: "Email.Word", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Loading...
      static let loadingTitle = Rswift.StringResource(key: "Loading.Title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Login
      static let loginWord = Rswift.StringResource(key: "Login.Word", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Ok
      static let okWord = Rswift.StringResource(key: "Ok.Word", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Oops, something went wrong.
      static let photosListNetworkingErrorTitle = Rswift.StringResource(key: "Photos.List.Networking.Error.Title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Password
      static let passwordWord = Rswift.StringResource(key: "Password.Word", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Please enter any valid email and passowrd of at least 6 any characters
      static let authTip = Rswift.StringResource(key: "Auth.Tip", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: Email
      static func emailWord(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Email.Word", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Email.Word"
        }

        return NSLocalizedString("Email.Word", bundle: bundle, comment: "")
      }

      /// Value: Loading...
      static func loadingTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Loading.Title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Loading.Title"
        }

        return NSLocalizedString("Loading.Title", bundle: bundle, comment: "")
      }

      /// Value: Login
      static func loginWord(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Login.Word", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Login.Word"
        }

        return NSLocalizedString("Login.Word", bundle: bundle, comment: "")
      }

      /// Value: Ok
      static func okWord(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Ok.Word", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Ok.Word"
        }

        return NSLocalizedString("Ok.Word", bundle: bundle, comment: "")
      }

      /// Value: Oops, something went wrong.
      static func photosListNetworkingErrorTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Photos.List.Networking.Error.Title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Photos.List.Networking.Error.Title"
        }

        return NSLocalizedString("Photos.List.Networking.Error.Title", bundle: bundle, comment: "")
      }

      /// Value: Password
      static func passwordWord(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Password.Word", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Password.Word"
        }

        return NSLocalizedString("Password.Word", bundle: bundle, comment: "")
      }

      /// Value: Please enter any valid email and passowrd of at least 6 any characters
      static func authTip(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Auth.Tip", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Auth.Tip"
        }

        return NSLocalizedString("Auth.Tip", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct nib {
    struct _PhotoTableViewCell: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "PhotoTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> PhotoTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? PhotoTableViewCell
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try auth.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try load.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try main.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct auth: Rswift.StoryboardResourceType, Rswift.Validatable {
      let authorizationViewController = StoryboardViewControllerResource<AuthorizationViewController>(identifier: "AuthorizationViewController")
      let bundle = R.hostingBundle
      let name = "Auth"

      func authorizationViewController(_: Void = ()) -> AuthorizationViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: authorizationViewController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.auth().authorizationViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'authorizationViewController' could not be loaded from storyboard 'Auth' as 'AuthorizationViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct load: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = CustomNavigationController

      let bundle = R.hostingBundle
      let loadingViewController = StoryboardViewControllerResource<LoadingViewController>(identifier: "LoadingViewController")
      let name = "Load"

      func loadingViewController(_: Void = ()) -> LoadingViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: loadingViewController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.load().loadingViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'loadingViewController' could not be loaded from storyboard 'Load' as 'LoadingViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct main: Rswift.StoryboardResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let mainViewController = StoryboardViewControllerResource<MainViewController>(identifier: "MainViewController")
      let name = "Main"

      func mainViewController(_: Void = ()) -> MainViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: mainViewController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.main().mainViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'mainViewController' could not be loaded from storyboard 'Main' as 'MainViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
