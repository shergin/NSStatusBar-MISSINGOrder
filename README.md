# NSStatusBar+MISSINGOrder

[![Version](https://img.shields.io/cocoapods/v/NSStatusBar+MISSINGOrder.svg?style=flat)](http://cocoadocs.org/docsets/NSStatusBar+MISSINGOrder)
[![License](https://img.shields.io/cocoapods/l/NSStatusBar+MISSINGOrder.svg?style=flat)](http://cocoadocs.org/docsets/NSStatusBar+MISSINGOrder)
[![Platform](https://img.shields.io/cocoapods/p/NSStatusBar+MISSINGOrder.svg?style=flat)](http://cocoadocs.org/docsets/NSStatusBar+MISSINGOrder)

A very tiny library that allows define position for `NSStatusBarItem` inside `NSStatusBar`.

## Usage

    #import "NSStatusBar+MISSINGOrder.h"

    // Let's create new status item at the end of menu bar!
    NSStatusItem *statusItem = [systemStatusBar statusItemWithLength:NSVariableStatusItemLength positioned:NSStatusBarItemOrderingModeBefore relativeTo:NSStatusBarItemPriorityNotificationCenter];

    // Voilà!

## Installation

NSStatusBar+MISSINGOrder is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "NSStatusBar+MISSINGOrder"

## Author

Valentin Shergin, valentin@shergin.com

## License

NSStatusBar+MISSINGOrder is available under the MIT license. See the LICENSE file for more info.
