#line 1 "Tweak.xm"
#import "Cephei/HBPreferences.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "libcolorpicker.h"

static BOOL enabled;
static UIColor *firstColor;
static UIColor *secondColor;

@interface CKGradientView : UIView
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
	_logos_orig$_ungrouped$CKGradientView$setColors$(self, _cmd, @[firstColor, secondColor]);
}


static void reloadPrefs() {
	HBPreferences *prefs;
	prefs = [[HBPreferences alloc] initWithIdentifier:@"com.daydream.messagesproprefs"];
	[prefs registerBool:&enabled default:YES forKey:@"isEnabled"];
	NSString *firstColorString = [prefs objectForKey:@"firstColor"];
	NSString *secondColorString = [prefs objectForKey:@"secondColor"];
	firstColor = LCPParseColorString(firstColorString, @"#F70000");
	secondColor = LCPParseColorString(secondColorString, @"#FF0000");
}
static __attribute__((constructor)) void _logosLocalCtor_533cf254(int __unused argc, char __unused **argv, char __unused **envp) {
	reloadPrefs();

	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)reloadPrefs, CFSTR("com.daydream.messagesproprefs/ReloadPrefs"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	
	if(enabled)
		{Class _logos_class$_ungrouped$CKGradientView = objc_getClass("CKGradientView"); { MSHookMessageEx(_logos_class$_ungrouped$CKGradientView, @selector(setColors:), (IMP)&_logos_method$_ungrouped$CKGradientView$setColors$, (IMP*)&_logos_orig$_ungrouped$CKGradientView$setColors$);}}
}
