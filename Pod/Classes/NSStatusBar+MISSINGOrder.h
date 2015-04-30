//
//  NSStatusBar+MISSINGOrder.h
//  NSStatusBar+MISSINGOrder
//
//  Created by Valentin Shergin on 30/04/15.
//  Copyright (c) 2015 Shergin Research. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef NS_ENUM(NSInteger, NSStatusBarItemPriority) {
	NSStatusBarItemPriorityDefault = 1000,
	NSStatusBarItemPrioritySystem = 2147483645,
	NSStatusBarItemPrioritySpotlight = 2147483646,
	NSStatusBarItemPriorityNotificationCenter = 2147483647,
};

typedef NS_ENUM(NSInteger, NSStatusBarItemOrderingMode) {
	NSStatusBarItemOrderingModeBefore = 0,
	NSStatusBarItemOrderingModeAfter = 1,
};


@interface NSStatusBar (MISSINGOrder)

- (NSStatusItem *)statusItemWithLength:(CGFloat)length positioned:(NSStatusBarItemOrderingMode)orderingMode relativeTo:(NSStatusBarItemPriority)priority;
- (NSStatusItem *)statusItemWithLength:(CGFloat)length priority:(NSStatusBarItemPriority)priority;

@end
