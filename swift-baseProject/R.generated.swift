// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift

import Foundation
import Rswift
import UIKit

/// This `R` struct is code generated, and contains references to static resources.
struct R: Rswift.Validatable {
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 color palettes.
  struct color {
    private init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 1 files.
  struct file {
    /// Resource file `Info.plist`.
    static let infoPlist = FileResource(bundle: _R.hostingBundle, name: "Info", pathExtension: "plist")
    
    /// `bundle.URLForResource("Info", withExtension: "plist")`
    static func infoPlist(_: Void) -> NSURL? {
      let fileResource = R.file.infoPlist
      return fileResource.bundle.URLForResource(fileResource)
    }
    
    private init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    private init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 2 images.
  struct image {
    /// Image `Image`.
    static let image = ImageResource(bundle: _R.hostingBundle, name: "Image")
    /// Image `Logo`.
    static let logo = ImageResource(bundle: _R.hostingBundle, name: "Logo")
    
    /// `UIImage(named: "Image", bundle: ..., traitCollection: ...)`
    static func image(compatibleWithTraitCollection traitCollection: UITraitCollection? = nil) -> UIImage? {
      return UIImage(resource: R.image.image, compatibleWithTraitCollection: traitCollection)
    }
    
    /// `UIImage(named: "Logo", bundle: ..., traitCollection: ...)`
    static func logo(compatibleWithTraitCollection traitCollection: UITraitCollection? = nil) -> UIImage? {
      return UIImage(resource: R.image.logo, compatibleWithTraitCollection: traitCollection)
    }
    
    private init() {}
  }
  
  private struct intern: Rswift.Validatable {
    static func validate() throws {
      try _R.validate()
    }
    
    private init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 0 nibs.
  struct nib {
    private init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 2 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `RecentTravelCell`.
    static let recentTravelCell: ReuseIdentifier<RecentTravelCell> = ReuseIdentifier(identifier: "RecentTravelCell")
    /// Reuse identifier `TravelCell`.
    static let travelCell: ReuseIdentifier<TravelCell> = ReuseIdentifier(identifier: "TravelCell")
    
    private init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    private init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 3 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    /// Storyboard `Travel`.
    static let travel = _R.storyboard.travel()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void) -> UIStoryboard {
      return UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void) -> UIStoryboard {
      return UIStoryboard(resource: R.storyboard.main)
    }
    
    /// `UIStoryboard(name: "Travel", bundle: ...)`
    static func travel(_: Void) -> UIStoryboard {
      return UIStoryboard(resource: R.storyboard.travel)
    }
    
    private init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 0 localization tables.
  struct string {
    private init() {}
  }
  
  private init() {}
}

struct _R: Rswift.Validatable {
  static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(NSLocale.init) ?? NSLocale.currentLocale()
  static let hostingBundle = NSBundle(identifier: "com.hmy.smartwpk") ?? NSBundle.mainBundle()
  
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    private init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try travel.validate()
    }
    
    struct launchScreen: StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIViewController
      
      let bundle = _R.hostingBundle
      let name = "LaunchScreen"
      
      private init() {}
    }
    
    struct main: StoryboardResourceWithInitialControllerType {
      typealias InitialController = TravelListViewController
      
      let bundle = _R.hostingBundle
      let name = "Main"
      
      private init() {}
    }
    
    struct travel: StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UINavigationController
      
      let bundle = _R.hostingBundle
      let name = "Travel"
      
      static func validate() throws {
        if UIImage(named: "tick_weather_001") == nil { throw ValidationError(description: "[R.swift] Image named 'tick_weather_001' is used in storyboard 'Travel', but couldn't be loaded.") }
        if UIImage(named: "icon_stay") == nil { throw ValidationError(description: "[R.swift] Image named 'icon_stay' is used in storyboard 'Travel', but couldn't be loaded.") }
        if UIImage(named: "icon_traffic") == nil { throw ValidationError(description: "[R.swift] Image named 'icon_traffic' is used in storyboard 'Travel', but couldn't be loaded.") }
        if UIImage(named: "icon_trunk") == nil { throw ValidationError(description: "[R.swift] Image named 'icon_trunk' is used in storyboard 'Travel', but couldn't be loaded.") }
      }
      
      private init() {}
    }
    
    private init() {}
  }
  
  private init() {}
}