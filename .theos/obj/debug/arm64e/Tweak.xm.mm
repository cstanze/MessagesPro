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

@class CKGradientView; @class SBRootFolderController; 
static void (*_logos_orig$_ungrouped$SBRootFolderController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL SBRootFolderController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$SBRootFolderController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL SBRootFolderController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$CKGradientView$setColors$)(_LOGOS_SELF_TYPE_NORMAL CKGradientView* _LOGOS_SELF_CONST, SEL, NSArray *); static void _logos_method$_ungrouped$CKGradientView$setColors$(_LOGOS_SELF_TYPE_NORMAL CKGradientView* _LOGOS_SELF_CONST, SEL, NSArray *); 

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
@interface SBRootFolderController : UIViewController
@end

static void _logos_method$_ungrouped$SBRootFolderController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL SBRootFolderController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
	_logos_orig$_ungrouped$SBRootFolderController$viewDidAppear$(self, _cmd, arg1);
	UIViewController *vc = [[UIViewController alloc] init];
	vc.modalPresentationStyle = UIModalPresentationFullScreen;
	[self presentViewController:vc animated:true completion:nil];
}



static void _logos_method$_ungrouped$CKGradientView$setColors$(_LOGOS_SELF_TYPE_NORMAL CKGradientView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSArray * arg1) {
	if(isEnabled) {
		_logos_orig$_ungrouped$CKGradientView$setColors$(self, _cmd, @[firstGradient, secondGradient]);
		return;
	}
	_logos_orig$_ungrouped$CKGradientView$setColors$(self, _cmd, (NSArray *)arg1);
}

static __attribute__((constructor)) void _logosLocalCtor_715d0a9a(int __unused argc, char __unused **argv, char __unused **envp) {
	preferences = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"com.daydream.messagesproprefs"];
	isEnabled = [[preferences valueForKey:@"isEnabled"] boolValue];
	NSLog(@"[MessagesPro] %@", (NSString *)[preferences valueForKey:@"gradientColor"]);
	NSLog(@"[MessagesPro] %@", (NSString *)[preferences valueForKey:@"gradientColorAlt"]);
	firstGradient = LCPParseColorString([preferences valueForKey:@"gradientColor"], @"#ff0000");
	secondGradient = LCPParseColorString([preferences valueForKey:@"gradientColorAlt"], @"#ff7f00");
}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBRootFolderController = objc_getClass("SBRootFolderController"); MSHookMessageEx(_logos_class$_ungrouped$SBRootFolderController, @selector(viewDidAppear:), (IMP)&_logos_method$_ungrouped$SBRootFolderController$viewDidAppear$, (IMP*)&_logos_orig$_ungrouped$SBRootFolderController$viewDidAppear$);Class _logos_class$_ungrouped$CKGradientView = objc_getClass("CKGradientView"); MSHookMessageEx(_logos_class$_ungrouped$CKGradientView, @selector(setColors:), (IMP)&_logos_method$_ungrouped$CKGradientView$setColors$, (IMP*)&_logos_orig$_ungrouped$CKGradientView$setColors$);} }
#line 42 "Tweak.xm"
