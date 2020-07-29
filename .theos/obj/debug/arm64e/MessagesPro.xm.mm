#line 1 "MessagesPro.xm"
#import "Cephei/HBPreferences.h"
#import "libcolorpicker.h"
#import "MessagesPro.h"

		
	static BOOL enabled;

		
	static UIColor *firstColor;
	static UIColor *secondColor;


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

@class CKColoredBalloonView; @class CKBalloonView; @class CKConversationListStandardCell; @class CKGradientView; 
static void (*_logos_orig$_ungrouped$CKConversationListStandardCell$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL CKConversationListStandardCell* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$CKConversationListStandardCell$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL CKConversationListStandardCell* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$CKColoredBalloonView$setWantsGradient$)(_LOGOS_SELF_TYPE_NORMAL CKColoredBalloonView* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$CKColoredBalloonView$setWantsGradient$(_LOGOS_SELF_TYPE_NORMAL CKColoredBalloonView* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$CKBalloonView$setHasTail$)(_LOGOS_SELF_TYPE_NORMAL CKBalloonView* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$CKBalloonView$setHasTail$(_LOGOS_SELF_TYPE_NORMAL CKBalloonView* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$CKGradientView$setColors$)(_LOGOS_SELF_TYPE_NORMAL CKGradientView* _LOGOS_SELF_CONST, SEL, NSArray *); static void _logos_method$_ungrouped$CKGradientView$setColors$(_LOGOS_SELF_TYPE_NORMAL CKGradientView* _LOGOS_SELF_CONST, SEL, NSArray *); 

#line 12 "MessagesPro.xm"

static void _logos_method$_ungrouped$CKConversationListStandardCell$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL CKConversationListStandardCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$_ungrouped$CKConversationListStandardCell$layoutSubviews(self, _cmd);
	self.layer.masksToBounds = YES;
	self.layer.cornerRadius = 26;
}



static void _logos_method$_ungrouped$CKColoredBalloonView$setWantsGradient$(_LOGOS_SELF_TYPE_NORMAL CKColoredBalloonView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
	_logos_orig$_ungrouped$CKColoredBalloonView$setWantsGradient$(self, _cmd, YES);
}


 
static void _logos_method$_ungrouped$CKBalloonView$setHasTail$(_LOGOS_SELF_TYPE_NORMAL CKBalloonView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
	_logos_orig$_ungrouped$CKBalloonView$setHasTail$(self, _cmd, NO);
}



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
static __attribute__((constructor)) void _logosLocalCtor_a2cc5a99(int __unused argc, char __unused **argv, char __unused **envp) {
	reloadPrefs();

	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)reloadPrefs, CFSTR("com.daydream.messagesproprefs/ReloadPrefs"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	
	if(enabled)
		{Class _logos_class$_ungrouped$CKConversationListStandardCell = objc_getClass("CKConversationListStandardCell"); { MSHookMessageEx(_logos_class$_ungrouped$CKConversationListStandardCell, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$CKConversationListStandardCell$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$CKConversationListStandardCell$layoutSubviews);}Class _logos_class$_ungrouped$CKColoredBalloonView = objc_getClass("CKColoredBalloonView"); { MSHookMessageEx(_logos_class$_ungrouped$CKColoredBalloonView, @selector(setWantsGradient:), (IMP)&_logos_method$_ungrouped$CKColoredBalloonView$setWantsGradient$, (IMP*)&_logos_orig$_ungrouped$CKColoredBalloonView$setWantsGradient$);}Class _logos_class$_ungrouped$CKBalloonView = objc_getClass("CKBalloonView"); { MSHookMessageEx(_logos_class$_ungrouped$CKBalloonView, @selector(setHasTail:), (IMP)&_logos_method$_ungrouped$CKBalloonView$setHasTail$, (IMP*)&_logos_orig$_ungrouped$CKBalloonView$setHasTail$);}Class _logos_class$_ungrouped$CKGradientView = objc_getClass("CKGradientView"); { MSHookMessageEx(_logos_class$_ungrouped$CKGradientView, @selector(setColors:), (IMP)&_logos_method$_ungrouped$CKGradientView$setColors$, (IMP*)&_logos_orig$_ungrouped$CKGradientView$setColors$);}}
}
