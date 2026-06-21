# ``SketchKit``

A lightweight, powerful and pure-Swift Auto Layout DSL.

## Overview

SketchKit lets you set up your constraints with simple and intuitive code, without
any stringly typing.

In short, it allows you to replace this:

```swift
newView.translatesAutoresizingMaskIntoConstraints = false

addConstraint(NSLayoutConstraint(
    item: newView,
    attribute: .centerX,
    relatedBy: .equal,
    toItem: view,
    attribute: .centerX,
    multiplier: 1,
    constant: 0))
```

with this:

```swift
// No need for: newView.translatesAutoresizingMaskIntoConstraints = false
newView.layout.applyConstraint { view in
    view.centerXAnchor(equalTo: self.view.centerXAnchor)
    view.centerYAnchor(equalTo: self.view.centerYAnchor)
}
```

### Keyboard Layout Guide

The iOS-only keyboard layout guide lets you align your views relative to the
keyboard natively, without observing notifications or computing keyboard heights
manually. Access it through the `keyboardLayout` property on any `View`:

```swift
button.layout.applyConstraint { button in
    button.bottomAnchor(equalTo: view.keyboardLayout.topAnchor)
}
```

## Topics

### Essentials

- ``Constrainable``
- ``SketchKitDSL``

### Platform Abstractions

- ``View``
- ``LayoutGuide``
- ``LayoutPriority``
- ``EdgeInsets``
