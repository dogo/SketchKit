#!/bin/bash

set -eo pipefail

xcodebuild -project SketchKit.xcodeproj \
			-scheme SketchKit-Package \
            -destination platform=iOS\ Simulator,OS=14.4,name=iPhone\ 11 \
            clean test | xcpretty          
