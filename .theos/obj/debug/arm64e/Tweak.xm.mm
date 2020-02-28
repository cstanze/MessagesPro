#line 1 "Tweak.xm"
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


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class CKGradientView; 
static void (*_logos_orig$_ungrouped$CKGradientView$setColors$)(_LOGOS_SELF_TYPE_NORMAL CKGradientView* _LOGOS_SELF_CONST, SEL, NSArray *); static void _logos_method$_ungrouped$CKGradientView$setColors$(_LOGOS_SELF_TYPE_NORMAL CKGradientView* _LOGOS_SELF_CONST, SEL, NSArray *); 

#line 14 "Tweak.xm"

static void _logos_method$_ungrouped$CKGradientView$setColors$(_LOGOS_SELF_TYPE_NORMAL CKGradientView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSArray * arg1) {
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
	_logos_orig$_ungrouped$CKGradientView$setColors$(self, _cmd, (NSArray *)arg1);
}

static __attribute__((constructor)) void _logosLocalCtor_da6b7450(int __unused argc, char __unused **argv, char __unused **envp) {
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
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$CKGradientView = objc_getClass("CKGradientView"); MSHookMessageEx(_logos_class$_ungrouped$CKGradientView, @selector(setColors:), (IMP)&_logos_method$_ungrouped$CKGradientView$setColors$, (IMP*)&_logos_orig$_ungrouped$CKGradientView$setColors$);} }
#line 64 "Tweak.xm"
