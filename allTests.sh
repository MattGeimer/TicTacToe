#!/bin/sh

echo Starting Unit Tests

declare -a devices=('platform=iOS Simulator,OS=13.4.1,name=iPhone 8', 'platform=iOS Simulator,OS=13.4.1,name=iPhone 11 Pro')

xcodebuild clean build-for-testing -scheme "EZ Tic Tac Toe" \
-destination 'platform=iOS Simulator,name=iPhone 11' \
-destination 'platform=iOS Simulator,name=iPhone 11 Pro' \
-destination 'platform=iOS Simulator,name=iPhone 11 Pro Max' \
-destination 'platform=iOS Simulator,name=iPhone 8' \
-destination 'platform=iOS Simulator,name=iPhone 8 Plus' \
-destination 'platform=iOS Simulator,name=iPhone SE (2nd generation)' \
-destination 'platform=iOS Simulator,name=iPad Air (3rd generation)' \
-destination 'platform=iOS Simulator,name=iPad Pro (11-inch)' \
-destination 'platform=iOS Simulator,name=iPad Pro (11-inch) (2nd generation)' \
-destination 'platform=iOS Simulator,name=iPad Pro (12.9-inch) (3rd generation)' \
-destination 'platform=iOS Simulator,name=iPad Pro (12.9-inch) (4th generation)' \
-destination 'platform=iOS Simulator,name=iPad Pro (9.7-inch)'
xcodebuild test-without-building -scheme "EZ Tic Tac Toe" \
-destination 'platform=iOS Simulator,name=iPhone 11' \
-destination 'platform=iOS Simulator,name=iPhone 11 Pro' \
-destination 'platform=iOS Simulator,name=iPhone 11 Pro Max' \
-destination 'platform=iOS Simulator,name=iPhone 8' \
-destination 'platform=iOS Simulator,name=iPhone 8 Plus' \
-destination 'platform=iOS Simulator,name=iPhone SE (2nd generation)' \
-destination 'platform=iOS Simulator,name=iPad Air (3rd generation)' \
-destination 'platform=iOS Simulator,name=iPad Pro (11-inch)' \
-destination 'platform=iOS Simulator,name=iPad Pro (11-inch) (2nd generation)' \
-destination 'platform=iOS Simulator,name=iPad Pro (12.9-inch) (3rd generation)' \
-destination 'platform=iOS Simulator,name=iPad Pro (12.9-inch) (4th generation)' \
-destination 'platform=iOS Simulator,name=iPad Pro (9.7-inch)'
