#include <UIKit/UIKit.h>
#include <Cephei/HBPreferences.h>
#include <Foundation/Foundation.h>
HBPreferences *preferences;
BOOL isEnabled;
NSString *gradientColor;
NSString *gradientColorAlt;
@interface CKGradientView : UIView {
	NSArray* _colors;
}
- (void)setColors:(NSArray *)arg1;
@end

%hook CKGradientView
- (void)setColors:(NSArray *)arg1 {
	if(isEnabled) {
		NSMutableArray *fullGradient;
		if([gradientColor isEqualToString:@"Red"]) {
			[fullGradient addObject:[UIColor redColor]];
		} else if([gradientColor isEqualToString:@"Orange"]) {
			[fullGradient addObject:[UIColor orangeColor]];
		} else if([gradientColor isEqualToString:@"Green"]) {
			[fullGradient addObject:[UIColor greenColor]];
		} else if([gradientColor isEqualToString:@"Blue"]) {
			[fullGradient addObject:[UIColor greenColor]];
		} else if([gradientColor isEqualToString:@"Yellow"]) {
			[fullGradient addObject:[UIColor blueColor]];
		} else if([gradientColor isEqualToString:@"Black"]) {
			[fullGradient addObject:[UIColor blackColor]];
		} else if([gradientColor isEqualToString:@"White"]) {
			[fullGradient addObject:[UIColor whiteColor]];	
		}
		if([gradientColorAlt isEqualToString:@"Red"]) {
                        [fullGradient addObject:[UIColor redColor]];
                } else if([gradientColorAlt isEqualToString:@"Orange"]) {
                        [fullGradient addObject:[UIColor orangeColor]];
                } else if([gradientColorAlt isEqualToString:@"Green"]) {
                        [fullGradient addObject:[UIColor greenColor]];
		} else if([gradientColorAlt isEqualToString:@"Blue"]) {
			[fullGradient addObject:[UIColor greenColor]];
		} else if([gradientColorAlt isEqualToString:@"Yellow"]) {
			[fullGradient addObject:[UIColor blueColor]];
                } else if([gradientColorAlt isEqualToString:@"Black"]) {
                        [fullGradient addObject:[UIColor blackColor]]; 
                } else if([gradientColorAlt isEqualToString:@"White"]) {
                        [fullGradient addObject:[UIColor whiteColor]];
                }
	}
	%orig((NSArray *)arg1);
}
%end
%ctor {
	preferences = [[HBPreferences alloc] initWithIdentifier:@"com.daydream.messagesproprefs"];
	[preferences registerDefaults:@{
		@"isEnabled": @YES,
		@"gradientColor": @"Red",
		@"gradientColorAlt": @"Orange"
	}];

	[preferences registerBool:&isEnabled default:YES forKey:@"isEnabled"];
	gradientColor = [preferences objectForKey:@"gradientColor"];
	gradientColorAlt = [preferences objectForKey:@"gradientColorAlt"];
}
