<img src="/images/SketchKit-Full.png" alt="" />

![Build Status](https://github.com/dogo/SketchKit/workflows/Testing/badge.svg)
[![codecov](https://codecov.io/gh/dogo/SketchKit/branch/develop/graph/badge.svg)](https://codecov.io/gh/dogo/SketchKit)
[![Cocoapods compatible](https://img.shields.io/cocoapods/v/SketchKit.svg)](https://cocoapods.org/?q=SketchKit)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-brightgreen)](https://swift.org/package-manager)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/github/license/dogo/SketchKit.svg)](https://github.com/dogo/SketchKit/blob/develop/LICENSE)

SketchKit is a lightweight, powerful and pure-Swift auto layout library, you can set up your constraints with a simple and intuitive code without any stringly typing.

In short, it allows you to replace this:

```Swift
newView.translatesAutoresizingMaskIntoConstraints = false

addConstraint(NSLayoutConstraint(
              item: newView,
              attribute: NSLayoutConstraint.Attribute.centerX,
              relatedBy: NSLayoutConstraint.Relation.equal,
              toItem: view,
              attribute: NSLayoutConstraint.Attribute.centerX,
              multiplier: 1,
              constant: 0))
```

or

```Swift
newView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
```

with this

```Swift
// It's NOT necessary: newView.translatesAutoresizingMaskIntoConstraints = false
newView.layout.applyConstraint { view in
    view.centerXAnchor(equalTo: self.view.centerXAnchor)
    view.centerYAnchor(equalTo: self.view.centerYAnchor)
}
```

## Requirements

- iOS 9.0+ / tvOS 9.0+
- Swift 3.2+

## Installation

### [CocoaPods](https://cocoapods.org)

To integrate SketchKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
target '<Your Target Name>' do
  pod 'SketchKit'
end
```

Then, run the following command:

```bash
$ pod install
```

### [Swift Package Manager (SPM)](https://swift.org/package-manager)

To add `SketchKit` as a dependency, you have to add it to the `dependencies` of your `Package.swift` file and refer to that dependency in your `target`.

```swift
import PackageDescription
let package = Package(
    name: "<Your Product Name>",
    dependencies: [
       .package(url: "https://github.com/dogo/SketchKit", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        .target(
            name: "<Your Target Name>",
            dependencies: ["SketchKit"]),
    ]
)
```

After adding the dependency, you can fetch the library with:

```bash
$ swift package resolve
```

### [Carthage](https://github.com/Carthage/Carthage)

```
github "dogo/SketchKit"
```

## Usage

### Quick Start

```swift
import SketchKit

final class MyViewController: UIViewController {

    let myView: UIView = {
        let view = UIView(frame: .zero)
        view.color = .red
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(myView)

        myView.layout.applyConstraint { view in
            view.topAnchor(equalTo: self.view.topAnchor)
            view.leadingAnchor(equalTo: self.view.leadingAnchor)
            view.bottomAnchor(equalTo: self.view.bottomAnchor)
            view.trailingAnchor(equalTo: self.view.trailingAnchor)
        }
    }
}
```

## Documentation
The project documentation can be found ([here](https://dogo.github.io/SketchKit/index.html)) 

## Credits

- Nicholas Babo ([@NickBabo](https://github.com/NickBabo)) thank you for the SketchKit logo,

## License

SketchKit is released under the MIT license. See LICENSE for details.
