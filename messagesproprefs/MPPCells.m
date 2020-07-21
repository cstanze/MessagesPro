#import "MPPCells.h"

@implementation MPPSwitchCell
-(void)didMoveToWindow {
    [super didMoveToWindow];
    self.layer.cornerRadius = 13;
    self.layer.masksToBounds = YES; 
    [self setSeparatorInset:UIEdgeInsetsMake(0, 25, 0, 0)];  
    [self _setBackgroundInset:UIEdgeInsetsMake(0, 15, 0, 15)];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
}

- (void)setFrame:(CGRect)frame {
    frame.origin.x += 15;
    frame.size.width -= 2 * 15;
    [super setFrame:frame];
}
@end

@implementation MPPLinkCell
-(void)didMoveToWindow {
    [super didMoveToWindow];
    self.layer.cornerRadius = 13;
    self.layer.masksToBounds = YES; 
    [self setSeparatorInset:UIEdgeInsetsMake(0, 25, 0, 0)];  
    [self _setBackgroundInset:UIEdgeInsetsMake(0, 15, 0, 15)];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
}

- (void)setFrame:(CGRect)frame {
    frame.origin.x += 15;
    frame.size.width -= 2 * 15;
    [super setFrame:frame];
}
@end

@implementation MPPGroupCell
-(void)didMoveToWindow {
    [super didMoveToWindow];
    self.layer.cornerRadius = 13;
    self.layer.masksToBounds = YES; 
    [self setSeparatorInset:UIEdgeInsetsMake(0, 25, 0, 0)];  
    [self _setBackgroundInset:UIEdgeInsetsMake(0, 15, 0, 15)];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
}

- (void)setFrame:(CGRect)frame {
    frame.origin.x += 15;
    frame.size.width -= 2 * 15;
    [super setFrame:frame];
}
@end


// TODO: Custom corner radii to patch the enabled switch and header cell together
@implementation MPPPackageNameHeaderCell
-(void)didMoveToWindow {
    [super didMoveToWindow];
    self.layer.cornerRadius = 13;
    self.layer.masksToBounds = YES; 
    [self setSeparatorInset:UIEdgeInsetsMake(0, 25, 0, 0)];  
    [self _setBackgroundInset:UIEdgeInsetsMake(0, 15, 0, 15)];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
}

- (void)setFrame:(CGRect)frame {
    frame.origin.x += 15;
    frame.size.width -= 2 * 15;
    [super setFrame:frame];
}
@end