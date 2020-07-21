#import "NSTask.h"
#import "MPPRootListController.h"
#import <UIKit/UIKit.h>

@implementation MPPRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

- (id)init {
	self = [super init];
	UIBarButtonItem *respringButton = [[UIBarButtonItem alloc] initWithTitle:@"Apply"
												style:UIBarButtonItemStylePlain
												target:self
												action:@selector(respringDevice)];
	self.navigationItem.rightBarButtonItem = respringButton;
	return self;
}

-(void)firstcolorpicker {
	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.daydream.messagesproprefs"];
	NSString *firstColor = [prefs objectForKey:@"firstColor"];

	UIColor *startColor = LCPParseColorString(firstColor, @"#F70000");
	PFColorAlert *alert = [PFColorAlert colorAlertWithStartColor:startColor showAlpha:NO];
	[alert displayWithCompletion:^void (UIColor *pickedColor) {
		NSString *hexColor = [UIColor hexFromColor:pickedColor];
		// hexColor = [hexColor stringByAppendingFormat:@":%f", pickedColor.alpha];
		[prefs setObject:hexColor forKey:@"firstColor"];
		CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("com.daydream.aprilprefs/ReloadPrefs"), nil, nil, true);
	}];
}

-(void)secondcolorpicker {
	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.daydream.messagesproprefs"];
	NSString *secondColor = [prefs objectForKey:@"secondColor"];

	UIColor *startColor = LCPParseColorString(secondColor, @"#FF0000");
	PFColorAlert *alert = [PFColorAlert colorAlertWithStartColor:startColor showAlpha:NO];
	[alert displayWithCompletion:^void (UIColor *pickedColor) {
		NSString *hexColor = [UIColor hexFromColor:pickedColor];
		// hexColor = [hexColor stringByAppendingFormat:@":%f", pickedColor.alpha];
		[prefs setObject:hexColor forKey:@"secondColor"];
		CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("com.daydream.aprilprefs/ReloadPrefs"), nil, nil, true);
	}];
}

- (void)respringDevice {
	NSTask *task = [[NSTask alloc] init];
	task.launchPath = @"/usr/bin/killall";
	task.arguments = @[@"-9", @"MobileSMS"];
	[task launch];
}

@end
