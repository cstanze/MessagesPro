#line 1 "MessagesPro.xm"
#import "Cephei/HBPreferences.h"
#import "libcolorpicker.h"
#import "MessagesPro.h"

		
	static BOOL enabled;

		
	static UIColor *firstColor;
	static UIColor *secondColor;
	static NSInteger gradientStyle;

		
	static BOOL showsTail;

		
	static NSInteger cornerStyle;


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

@class CKGradientView; @class CKColoredBalloonView; @class CKBalloonView; @class CKConversationListStandardCell; 
static void (*_logos_orig$_ungrouped$CKConversationListStandardCell$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL CKConversationListStandardCell* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$CKConversationListStandardCell$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL CKConversationListStandardCell* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$CKColoredBalloonView$setWantsGradient$)(_LOGOS_SELF_TYPE_NORMAL CKColoredBalloonView* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$CKColoredBalloonView$setWantsGradient$(_LOGOS_SELF_TYPE_NORMAL CKColoredBalloonView* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$CKBalloonView$setHasTail$)(_LOGOS_SELF_TYPE_NORMAL CKBalloonView* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$CKBalloonView$setHasTail$(_LOGOS_SELF_TYPE_NORMAL CKBalloonView* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$CKBalloonView$setBalloonCorners$)(_LOGOS_SELF_TYPE_NORMAL CKBalloonView* _LOGOS_SELF_CONST, SEL, unsigned long long); static void _logos_method$_ungrouped$CKBalloonView$setBalloonCorners$(_LOGOS_SELF_TYPE_NORMAL CKBalloonView* _LOGOS_SELF_CONST, SEL, unsigned long long); static void (*_logos_orig$_ungrouped$CKGradientView$setColors$)(_LOGOS_SELF_TYPE_NORMAL CKGradientView* _LOGOS_SELF_CONST, SEL, NSArray *); static void _logos_method$_ungrouped$CKGradientView$setColors$(_LOGOS_SELF_TYPE_NORMAL CKGradientView* _LOGOS_SELF_CONST, SEL, NSArray *); 

#line 19 "MessagesPro.xm"

static void _logos_method$_ungrouped$CKConversationListStandardCell$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL CKConversationListStandardCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$_ungrouped$CKConversationListStandardCell$layoutSubviews(self, _cmd);
	self.layer.masksToBounds = YES;
	self.layer.cornerRadius = 26;
}



static void _logos_method$_ungrouped$CKColoredBalloonView$setWantsGradient$(_LOGOS_SELF_TYPE_NORMAL CKColoredBalloonView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
	switch(gradientStyle) {
		case 1:
			_logos_orig$_ungrouped$CKColoredBalloonView$setWantsGradient$(self, _cmd, arg1);
			break;
		case 2:
			_logos_orig$_ungrouped$CKColoredBalloonView$setWantsGradient$(self, _cmd, YES);
			break;
		default:
			_logos_orig$_ungrouped$CKColoredBalloonView$setWantsGradient$(self, _cmd, arg1);
			break;
	}
}


 
static void _logos_method$_ungrouped$CKBalloonView$setHasTail$(_LOGOS_SELF_TYPE_NORMAL CKBalloonView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
	_logos_orig$_ungrouped$CKBalloonView$setHasTail$(self, _cmd, showsTail);
}

static void _logos_method$_ungrouped$CKBalloonView$setBalloonCorners$(_LOGOS_SELF_TYPE_NORMAL CKBalloonView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, unsigned long long arg1) {
	switch(cornerStyle) {
		case 0:
			_logos_orig$_ungrouped$CKBalloonView$setBalloonCorners$(self, _cmd, (UIRectCornerAllCorners));
			break;
		case 1:
			_logos_orig$_ungrouped$CKBalloonView$setBalloonCorners$(self, _cmd, (UIRectCornerBottomLeft | UIRectCornerTopRight));
			break;
		case 2:
			_logos_orig$_ungrouped$CKBalloonView$setBalloonCorners$(self, _cmd, (UIRectCornerTopLeft | UIRectCornerBottomRight));
			break;
		case 3:
			_logos_orig$_ungrouped$CKBalloonView$setBalloonCorners$(self, _cmd, (UIRectCornerTopLeft | UIRectCornerBottomLeft));
			break;
		case 4:
			_logos_orig$_ungrouped$CKBalloonView$setBalloonCorners$(self, _cmd, (UIRectCornerBottomRight | UIRectCornerTopRight));
			break;
		case 5:
			_logos_orig$_ungrouped$CKBalloonView$setBalloonCorners$(self, _cmd, (UIRectCornerTopLeft | UIRectCornerTopRight));
			break;
		case 6:
			_logos_orig$_ungrouped$CKBalloonView$setBalloonCorners$(self, _cmd, (UIRectCornerBottomRight | UIRectCornerBottomLeft));
			break;
		case 7:
			_logos_orig$_ungrouped$CKBalloonView$setBalloonCorners$(self, _cmd, 0);
			break;
	}
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

	[prefs registerBool:&showsTail default:YES forKey:@"showsTail"];
	[prefs registerInteger:&gradientStyle default:1 forKey:@"gradientStyle"];
	[prefs registerInteger:&cornerStyle default:0 forKey:@"cornerStyle"];
}
static __attribute__((constructor)) void _logosLocalCtor_7c9ec809(int __unused argc, char __unused **argv, char __unused **envp) {
	reloadPrefs();

	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)reloadPrefs, CFSTR("com.daydream.messagesproprefs/ReloadPrefs"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	
	if(enabled)
		{Class _logos_class$_ungrouped$CKConversationListStandardCell = objc_getClass("CKConversationListStandardCell"); { MSHookMessageEx(_logos_class$_ungrouped$CKConversationListStandardCell, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$CKConversationListStandardCell$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$CKConversationListStandardCell$layoutSubviews);}Class _logos_class$_ungrouped$CKColoredBalloonView = objc_getClass("CKColoredBalloonView"); { MSHookMessageEx(_logos_class$_ungrouped$CKColoredBalloonView, @selector(setWantsGradient:), (IMP)&_logos_method$_ungrouped$CKColoredBalloonView$setWantsGradient$, (IMP*)&_logos_orig$_ungrouped$CKColoredBalloonView$setWantsGradient$);}Class _logos_class$_ungrouped$CKBalloonView = objc_getClass("CKBalloonView"); { MSHookMessageEx(_logos_class$_ungrouped$CKBalloonView, @selector(setHasTail:), (IMP)&_logos_method$_ungrouped$CKBalloonView$setHasTail$, (IMP*)&_logos_orig$_ungrouped$CKBalloonView$setHasTail$);}{ MSHookMessageEx(_logos_class$_ungrouped$CKBalloonView, @selector(setBalloonCorners:), (IMP)&_logos_method$_ungrouped$CKBalloonView$setBalloonCorners$, (IMP*)&_logos_orig$_ungrouped$CKBalloonView$setBalloonCorners$);}Class _logos_class$_ungrouped$CKGradientView = objc_getClass("CKGradientView"); { MSHookMessageEx(_logos_class$_ungrouped$CKGradientView, @selector(setColors:), (IMP)&_logos_method$_ungrouped$CKGradientView$setColors$, (IMP*)&_logos_orig$_ungrouped$CKGradientView$setColors$);}}
}
