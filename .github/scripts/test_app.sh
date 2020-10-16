#!/bin/bash

set -eo pipefail

if [ "$1" = "latest" ]
then
xcodebuild -project SketchKit.xcodeproj \
			-scheme SketchKit-Package \
            -destination platform=iOS\ Simulator,OS=14.0,name=iPhone\ 11 \
            clean test | xcpretty
elif [ "$2" = "ios9" ]
then
xcodebuild -project SketchKit.xcodeproj \
			-scheme SketchKit-Package \
            -destination platform=iOS\ Simulator,OS=9.0,name=iPhone\ 6s \
            clean test | xcpretty    
fi               
