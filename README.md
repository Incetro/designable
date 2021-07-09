![](designable.png)

<h1 align="center" style="margin-top: 0px;">Designable</h1>

<div align = "center">
  <a href="https://cocoapods.org/pods/incetro-designable">
    <img src="https://img.shields.io/cocoapods/v/incetro-designable.svg?style=flat" />
  </a>
  <a href="https://github.com/Incetro/Designable">
    <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" />
  </a>
  <a href="https://github.com/Incetro/incetro-designable#installation">
    <img src="https://img.shields.io/badge/compatible-swift%205.3-orange.svg" />
  </a>
</div>

<div align = "center">
  <a href="https://cocoapods.org/pods/incetro-designable" target="blank">
    <img src="https://img.shields.io/cocoapods/p/incetro-designable.svg?style=flat" />
  </a>
  <a href="https://cocoapods.org/pods/incetro-designable" target="blank">
    <img src="https://img.shields.io/cocoapods/l/incetro-designable.svg?style=flat" />
  </a>
  <br>
  <br>
</div>

An implementation of our vision of dealing with colors, fonts and other styles in a straightforward, scalable and elegant way.

- [Features](#features)
- [Usage](#usage)
- [How it works](#how-it-works)
- [Requirements](#requirements)
- [Communication](#communication)
- [Installation](#installation)
- [Author](#author)
- [License](#license)


## Features
- [x] Manipulate with unlimited themes in your apps
- [x] Describe every certain view with custom appearance that will be automatically updated when necessary
- [x] Get a strict guideline of styling your views and a unified approach for whole app

## Usage

```swift
// MARK: - Designable

extension ViewController: Designable {

    func design(appearance: ViewControllerAppearance) {
        view.backgroundColor = appearance.backgroundColor
    }
}

...

/// in the ViewController class
override func viewDidLoad() {
    super.viewDidLoad()
    designer.add(designable: self, for: \.viewControllerAppearance)
}
```

That's it. Every time you need to change an appearance every designable observer will get a new appearance and update its style.

## How it works

Choose a way how you update your app's global appearance. For example:

```swift
override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    if traitCollection.userInterfaceStyle == .dark {
        designer.set(appearance: .dark)
    } else {
        designer.set(appearance: .light)
    }
}
```

Define your local appearance types:

```swift
// MARK: - CustomViewAppearance

struct CustomViewAppearance {
    let backgroundColor: UIColor
}

// MARK: - ViewControllerAppearance

struct ViewControllerAppearance {
    let backgroundColor: UIColor
}
```

And global appearance types:

```swift
// MARK: - Appearance

protocol Appearance: AnyAppearance {

    /// ViewControllerAppearance instance
    var viewControllerAppearance: ViewControllerAppearance { get }

    /// CustomViewAppearance instance
    var customViewAppearance: CustomViewAppearance { get }
}

// MARK: - Light

struct Light {
}

// MARK: - Appearance

extension Light: Appearance {

    var type: AnyAppearanceType {
        AppAppearanceType.light
    }

    var viewControllerAppearance: ViewControllerAppearance {
        ViewControllerAppearance(backgroundColor: .init(rgb: 0xF8F5F1))
    }

    var customViewAppearance: CustomViewAppearance {
        CustomViewAppearance(backgroundColor: .init(rgb: 0x387C6D))
    }
}

// MARK: - Dark

struct Dark {

    // MARK: - Properties

    let backgroundColor: UIColor
}

// MARK: - Appearance

extension Dark: Appearance {

    var type: AnyAppearanceType {
        AppAppearanceType.dark
    }

    var viewControllerAppearance: ViewControllerAppearance {
        ViewControllerAppearance(backgroundColor: backgroundColor)
    }

    var customViewAppearance: CustomViewAppearance {
        CustomViewAppearance(backgroundColor: .init(rgb: 0xFFC947))
    }
}
```


And all Designable observers will be redesigned after `designer.set(appearance:)`. 

You can see more in the [example folder](https://github.com/Incetro/designable/tree/main/Example)

## Requirements
- iOS 12.1+ / macOS 10.12+ / tvOS 12.1+ / watchOS 3.1+
- Xcode 12.0
- Swift 5

## Communication

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate DAO into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
use_frameworks!

target "<Your Target Name>" do
    pod "incetro-designable"
end
```

Then, run the following command:

```bash
$ pod install
```

### Manually

If you prefer not to use any dependency managers, you can integrate `Designable` into your project manually.

#### Embedded Framework

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

  ```bash
  $ git init
  ```

- Add `Designable` as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

  ```bash
  $ git submodule add https://github.com/Incetro/designable.git
  ```

- Open the new `Designable` folder, and drag the `Designable.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `Designable.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `Designable.xcodeproj` folders each with two different versions of the `Designable.framework` nested inside a `Products` folder.

    > It does not matter which `Products` folder you choose from, but it does matter whether you choose the top or bottom `Designable.framework`.

- Select the top `Designable.framework` for iOS and the bottom one for OS X.

    > You can verify which one you selected by inspecting the build log for your project. The build target for `Designable` will be listed as either `Designable iOS`, `Designable macOS`, `Designable tvOS` or `Designable watchOS`.

- And that's it!

  > The `Designable.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.
  
## Author

incetro, incetro@ya.ru

## License

DAO is available under the MIT license. See the LICENSE file for more info.
