#include <UIKit/UIKit.h>
@interface CKBalloonImageView : UIView
@end
@interface CKBalloonView : CKBalloonImageView {
	BOOL _hasTail;
}
@end

%hook CKBalloonView
-(void)viewDidAppear {
	MSHookIvar<BOOL>(self, "_hasTail") = NO;
}
%end


