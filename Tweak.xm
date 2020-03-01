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
%hook CKGradientView
- (void)setColors:(NSArray *)arg1 {
	if(isEnabled) {
		%orig(@[firstGradient, secondGradient]);
		return;
	}
	%orig((NSArray *)arg1);
}
%end
%ctor {
	preferences = [[NSUserDefaults standardUserDefaults]
	persistentDomainForName:@"com.daydream.messagesproprefs"];
	isEnabled = [[preferences valueForKey:@"isEnabled"] boolValue];
	NSLog(@"[MessagesPro] %@", (NSString *)[preferences valueForKey:@"gradientColor"]);
	NSLog(@"[MessagesPro] %@", (NSString *)[preferences valueForKey:@"gradientColorAlt"]);
	firstGradient = LCPParseColorString([preferences valueForKey:@"gradientColor"], @"#ff0000");
	secondGradient = LCPParseColorString([preferences valueForKey:@"gradientColorAlt"], @"#ff7f00");
}
