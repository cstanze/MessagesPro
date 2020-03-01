#line 1 "Tweak.xm"

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

#line 1 "Tweak.xm"
#include <libcolorpicker.h>
#include <UIKit/UIKit.h>
#include <Foundation/Foundation.h>
NSDictionary *preferences;
BOOL isEnabled;
UIColor *firstGradient;
UIColor *secondGradient;
@interface CKGradientView : UIView {
	NSArray* _colors;
}
- (void)setColors:(NSArray *)arg1;
@end

static void _logos_method$_ungrouped$CKGradientView$setColors$(_LOGOS_SELF_TYPE_NORMAL CKGradientView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSArray * arg1) {
	NSDictionary *colorPrefs = [[NSDictionary alloc] initWithContentsOfURL:[NSURL fileURLWithPath:@"/var/mobile/Library/Preferences/com.daydream.messagesprocolorprefs"]];
	firstGradient = LCPParseColorString([colorPrefs objectForKey:@"gradientColor"], @"#ff0000");
	secondGradient = LCPParseColorString([colorPrefs objectForKey:@"gradientColorAlt"], @"#ff7f00");
	if(isEnabled) {
		_logos_orig$_ungrouped$CKGradientView$setColors$(self, _cmd, @[firstGradient, secondGradient]);
		return;
	}
	_logos_orig$_ungrouped$CKGradientView$setColors$(self, _cmd, (NSArray *)arg1);
}

static __attribute__((constructor)) void _logosLocalCtor_b82363af(int __unused argc, char __unused **argv, char __unused **envp) {
	preferences = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"com.daydream.messagesproprefs"];
	isEnabled = [[preferences valueForKey:@"isEnabled"] boolValue];
	NSDictionary *colorPrefs = [[NSDictionary alloc] initWithContentsOfURL:[NSURL fileURLWithPath:@"/var/mobile/Library/Preferences/com.daydream.messagesprocolorprefs"]];
	NSLog(@"[MessagesPro] %@", (NSString *)[colorPrefs objectForKey:@"gradientColor"]);
	NSLog(@"[MessagesPro] %@", (NSString *)[colorPrefs objectForKey:@"gradientColorAlt"]);
	firstGradient = LCPParseColorString([colorPrefs objectForKey:@"gradientColor"], @"#ff0000");
	secondGradient = LCPParseColorString([colorPrefs objectForKey:@"gradientColorAlt"], @"#ff7f00");
}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$CKGradientView = objc_getClass("CKGradientView"); MSHookMessageEx(_logos_class$_ungrouped$CKGradientView, @selector(setColors:), (IMP)&_logos_method$_ungrouped$CKGradientView$setColors$, (IMP*)&_logos_orig$_ungrouped$CKGradientView$setColors$);} }
#line 35 "Tweak.xm"
