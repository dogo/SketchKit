#!/bin/bash

set -eo pipefail

xcodebuild -project SketchKit.xcodeproj \
			-scheme SketchKit-Package \
            -destination platform=iOS\ Simulator,OS=16.2,name=iPhone\ 11 \
            -enableCodeCoverage YES \
            build test
