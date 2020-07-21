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

%hook CKGradientView
- (void)setColors:(NSArray *)arg1 {
	%orig(@[firstColor, secondColor]);
}
%end

static void reloadPrefs() {
	HBPreferences *prefs;
	prefs = [[HBPreferences alloc] initWithIdentifier:@"com.daydream.messagesproprefs"];
	[prefs registerBool:&enabled default:YES forKey:@"isEnabled"];
	NSString *firstColorString = [prefs objectForKey:@"firstColor"];
	NSString *secondColorString = [prefs objectForKey:@"secondColor"];
	firstColor = LCPParseColorString(firstColorString, @"#F70000");
	secondColor = LCPParseColorString(secondColorString, @"#FF0000");
}
%ctor {
	reloadPrefs();

	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)reloadPrefs, CFSTR("com.daydream.messagesproprefs/ReloadPrefs"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	
	if(enabled)
		%init();
}