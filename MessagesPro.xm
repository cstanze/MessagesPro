#import "Cephei/HBPreferences.h"
#import "libcolorpicker.h"
#import "MessagesPro.h"

		//Variables
	static BOOL enabled;

		//Balloon Gradient
	static UIColor *firstColor;
	static UIColor *secondColor;
	static NSInteger gradientStyle;

		//Tail Style
	static BOOL showsTail;

		//Balloon Borders & Corners
	static NSInteger cornerStyle;

%hook CKConversationListStandardCell
-(void)layoutSubviews {
	%orig;
	self.layer.masksToBounds = YES;
	self.layer.cornerRadius = 26;
}
%end

%hook CKColoredBalloonView
-(void)setWantsGradient:(BOOL)arg1 {
	switch(gradientStyle) {
		case 1:
			%orig;
			break;
		case 2:
			%orig(YES);
			break;
		default:
			%orig;
			break;
	}
}
%end

%hook CKBalloonView 
-(void)setHasTail:(BOOL)arg1 {
	%orig(showsTail);
}

-(void)setBalloonCorners:(unsigned long long)arg1 {
	switch(cornerStyle) {
		case 0:
			%orig((UIRectCornerAllCorners));
			break;
		case 1:
			%orig((UIRectCornerBottomLeft | UIRectCornerTopRight));
			break;
		case 2:
			%orig((UIRectCornerTopLeft | UIRectCornerBottomRight));
			break;
		case 3:
			%orig((UIRectCornerTopLeft | UIRectCornerBottomLeft));
			break;
		case 4:
			%orig((UIRectCornerBottomRight | UIRectCornerTopRight));
			break;
		case 5:
			%orig((UIRectCornerTopLeft | UIRectCornerTopRight));
			break;
		case 6:
			%orig((UIRectCornerBottomRight | UIRectCornerBottomLeft));
			break;
		case 7:
			%orig(0);
			break;
	}
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

	[prefs registerBool:&showsTail default:YES forKey:@"showsTail"];
	[prefs registerInteger:&gradientStyle default:1 forKey:@"gradientStyle"];
	[prefs registerInteger:&cornerStyle default:0 forKey:@"cornerStyle"];
}
%ctor {
	reloadPrefs();

	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)reloadPrefs, CFSTR("com.daydream.messagesproprefs/ReloadPrefs"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	
	if(enabled)
		%init();
}