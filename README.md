# SketchKit
[![Build Status](https://app.bitrise.io/app/9a6a28a9adbe78f8/status.svg?token=2bn-vbmKSW3ZbCE9xQnVWg&branch=develop)](https://app.bitrise.io/app/9a6a28a9adbe78f8)
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

TODO: Add images

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

## License

SketchKit is released under the MIT license. See LICENSE for details.
