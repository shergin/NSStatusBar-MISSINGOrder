//
//  NSStatusBar+MISSINGOrder.m
//  NSStatusBar+MISSINGOrder
//
//  Created by Valentin Shergin on 30/04/15.
//  Copyright (c) 2015 Shergin Research. All rights reserved.
//

#import "NSStatusBar+MISSINGOrder.h"

@implementation NSStatusBar (MISSINGOrder)

- (NSStatusItem *)statusItemWithLength:(CGFloat)length positioned:(NSStatusBarItemOrderingMode)orderingMode relativeTo:(NSStatusBarItemPriority)priority
{
	return [self statusItemWithLength:length priority:priority + orderingMode];
}

- (NSStatusItem *)statusItemWithLength:(CGFloat)length priority:(NSStatusBarItemPriority)priority
{
	// @selector(_statusItemWithLength:withPriority:)
	SEL statusItemWithLengthWithPrioritySelector = NSSelectorFromString([@[@"_status", @"Item", @"With", @"Length", @":", @"with", @"Priority", @":"] componentsJoinedByString:@""]);

	// @selector(_insertStatusItem:withPriority:)
	SEL insertStatusItemWithPrioritySelector = NSSelectorFromString([@[@"_insert", @"Status", @"Item", @":", @"with", @"Priority", @":"] componentsJoinedByString:@""]);

	NSStatusItem *statusItem;
	if (
		[self respondsToSelector:statusItemWithLengthWithPrioritySelector] &&
		[self respondsToSelector:insertStatusItemWithPrioritySelector]
	) {
		// Perform `[self _statusItemWithLength:length withPriority:priority]`.
		void *tempResultValuePtr;
		NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:statusItemWithLengthWithPrioritySelector];
		NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
		[invocation setTarget:self];
		[invocation setSelector:statusItemWithLengthWithPrioritySelector];
		[invocation setArgument:&length atIndex:2];
		[invocation setArgument:&priority atIndex:3];
		[invocation invoke];
		[invocation getReturnValue:&tempResultValuePtr];
		statusItem = (__bridge NSStatusItem *)tempResultValuePtr;

		if (statusItem) {
			[self removeStatusItem:statusItem];

			// Perform `[self _insertStatusItem:statusItem withPriority:priority]`.
			NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:insertStatusItemWithPrioritySelector];
			NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
			[invocation setTarget:self];
			[invocation setSelector:insertStatusItemWithPrioritySelector];
			[invocation setArgument:(void *)&statusItem atIndex:2];
			[invocation setArgument:&priority atIndex:3];
			[invocation invoke];
		}
	}

	if (!statusItem) {
		statusItem = [self statusItemWithLength:length];
	}

	return statusItem;
}

@end
