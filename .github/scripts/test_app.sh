#!/bin/bash

set -eo pipefail

xcodebuild -project SketchKit.xcodeproj \
			-scheme SketchKit-Package \
            -destination platform=iOS\ Simulator,OS=14.0,name=iPhone\ 11 \
            clean test | xcpretty
