//
//  ZMJCellRange.m
//  Pods
//
//  Created by Jason on 2018/1/19.
//

#import "ZMJCellRange.h"
#import "NSIndexPath+column.h"

@interface ZMJCellRange ()
@property (nonatomic, strong) Location *from;
@property (nonatomic, strong) Location *to;

@property (nonatomic, assign) NSInteger columnCount;
@property (nonatomic, assign) NSInteger rowCount;
@end

@implementation ZMJCellRange
- (instancetype)initFromRow:(NSInteger)fromRow fromColumn:(NSInteger)fromColumn toRow:(NSInteger)toRow toColumn:(NSInteger)toColumn {
    return [self initFromLocation:[Location locationWithRow:fromRow column:fromColumn]
                       toLocation:[Location locationWithRow:toRow column:toColumn]];
}
- (instancetype)initFromIndex:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    return [self initFromLocation:[Location locationWithRow:fromIndexPath.row column:fromIndexPath.column]
                       toLocation:[Location locationWithRow:toIndexPath.row column:toIndexPath.column]];
}
- (instancetype)initFromLocation:(Location *)fromLocation toLocation:(Location *)toLocation {
    self = [super init];
    if (self) {
        NSAssert(fromLocation.column <= toLocation.column && fromLocation.row <= toLocation.row, @"the value of `from` must be less than or equal to the value of `to`");
        self.from = fromLocation;
        self.to   = toLocation;
        _columnCount = toLocation.column - fromLocation.column + 1;
        _rowCount    = toLocation.row - fromLocation.row + 1;
    }
    return self;
}

@end
