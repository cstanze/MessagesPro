#import <Preferences/PSTableCell.h>
#import <Preferences/PSSwitchTableCell.h>
#import <CepheiPrefs/HBPackageNameHeaderCell.h>

@interface MPPSwitchCell : PSSwitchTableCell
@end

@interface MPPLinkCell : PSTableCell
@end

@interface MPPGroupCell : PSTableCell
@end

@interface MPPPackageNameHeaderCell : HBPackageNameHeaderCell
@end

@interface UITableViewCell (MessagesProPrefs)
-(void)_setBackgroundInset:(UIEdgeInsets)arg1;
@end