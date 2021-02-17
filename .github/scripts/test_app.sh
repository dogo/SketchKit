#!/bin/bash

set -eo pipefail

xcodebuild -project SketchKit.xcodeproj \
			-scheme SketchKit-Package \
            -destination platform=iOS\ Simulator,OS=14.0,name=iPhone\ 11 \
            #-destination platform=iOS\ Simulator,OS=10.3.1,name=iPhone\ 6s \
            clean test | xcpretty          
