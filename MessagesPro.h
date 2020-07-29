@interface CKConversationListStandardCell : UITableViewCell
@end

@interface CKColoredBalloonView : UIView
@end

@interface CKBalloonImageView : UIView
@property (nonatomic,retain) UIImage *image;
@end

@interface CKBalloonView : CKBalloonImageView
-(void)setHasTail:(BOOL)arg1;
@end

@interface CKGradientView : UIView
- (void)setColors:(NSArray *)arg1;
@end