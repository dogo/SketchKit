# SketchKit
[![Build Status](https://travis-ci.org/dogo/SketchKit.svg?branch=master)](https://travis-ci.org/dogo/SketchKit)
[![Cocoapods compatible](https://img.shields.io/cocoapods/v/SketchKit.svg)](https://cocoapods.org/?q=SketchKit)
[![SPM compatible](https://img.shields.io/badge/SketchKit.svg?style=flat)](https://swift.org/package-manager)
[![License](https://img.shields.io/cocoapods/l/SketchKit.svg)](https://github.com/dogo/SketchKit/blob/master/LICENSE)

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
newView.layout.applyConstraint { view in
    view.centerXAnchor(equalTo: self.centerXAnchor)
    view.centerYAnchor(equalTo: self.centerYAnchor)
}
```

## Installation

### CocoaPods

To integrate SketchKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
target '<Your Target Name>' do
  pod 'SketchKit', '~> 1.0,0'
end
```

Then, run the following command:

```bash
$ pod install
```

### Swift Package Manager (SPM)

TODO: Add images

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
