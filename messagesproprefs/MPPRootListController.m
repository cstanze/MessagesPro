#import "NSTask.h"
#include "MPPRootListController.h"

@implementation MPPRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

- (void)respringDevice:(id)sender {
	NSTask *task = [[NSTask alloc] init];
	task.launchPath = @"/usr/bin/sbreload";
	[task launch];
}

-(NSArray*)validTitles {
	return @[@"Red", @"Orange", @"Green", @"Blue", @"Yellow", @"Black", @"White"];
}

-(NSArray*)validValues {
        return @[@"Red", @"Orange", @"Green", @"Blue", @"Yellow", @"Black", @"White"];
}


@end
