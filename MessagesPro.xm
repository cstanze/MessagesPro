#import "Cephei/HBPreferences.h"
#import "libcolorpicker.h"
#import "MessagesPro.h"

		//Variables
	static BOOL enabled;

		//Balloon Gradient
	static UIColor *firstColor;
	static UIColor *secondColor;

%hook CKConversationListStandardCell
-(void)layoutSubviews {
	%orig;
	self.layer.masksToBounds = YES;
	self.layer.cornerRadius = 26;
}
%end

%hook CKColoredBalloonView
-(void)setWantsGradient:(BOOL)arg1 {
	%orig(YES);
}
%end

%hook CKBalloonView 
-(void)setHasTail:(BOOL)arg1 {
	%orig(NO);
}
%end

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