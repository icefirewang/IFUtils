//
//  UITableView+IFIndexPosition.m
//  JJUtils
//
//  Created by icefire_wang on 16/5/16.
//  Copyright © 2016年 icefire_wang. All rights reserved.
//

#import "UITableView+IFIndexPosition.h"

@implementation UITableView (IFIndexPosition)



-(CGFloat)topOfSection:(NSInteger)tarSection
{
    CGFloat headerViewHeight = 0;
    if (self.tableHeaderView != nil) {
        headerViewHeight = self.tableHeaderView.height;
    }
    
    NSInteger totalSection = [self.dataSource numberOfSectionsInTableView:self];
    if (totalSection <= tarSection) {
        NSAssert(FALSE, @"tarSection too big");
        return 0;
    }
    
    NSInteger section = 0;
    CGFloat ret = headerViewHeight;
    
    
    BOOL responseSelectorCellHeight     =   [self.delegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)];
    BOOL responseSelectorHeaderHeight   =   [self.delegate respondsToSelector:@selector(tableView:heightForHeaderInSection:)];
    BOOL responseSelectorFooterHeight   =   [self.delegate respondsToSelector:@selector(tableView:heightForFooterInSection:)];
    
    
    if (responseSelectorCellHeight == NO ||
        responseSelectorFooterHeight == NO ||
        responseSelectorHeaderHeight == NO) {
        NSAssert(FALSE, @"");
    }
    
    while (section < tarSection) {
        NSInteger rowCount = [self.dataSource tableView:self numberOfRowsInSection:section];
        CGFloat sectionHeight = 0;
        CGFloat rowTotalHeight = 0;
        for (NSInteger row = 0; row < rowCount; row++) {
            
            CGFloat rowHeight = 0;
            rowHeight = [self.delegate tableView:self heightForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
            rowTotalHeight += rowHeight;
        }
        CGFloat headerHeight = [self.delegate tableView:self heightForHeaderInSection:section];
        CGFloat footerHeight = [self.delegate tableView:self heightForFooterInSection:section];
        sectionHeight += rowTotalHeight;
        sectionHeight += headerHeight;
        sectionHeight += footerHeight;
        ret += sectionHeight;
        section++;
    }
    
    return ret;}

-(CGFloat)bottomOfSection:(NSInteger)tarSection
{
    NSInteger totalSection = [self.dataSource numberOfSectionsInTableView:self];
    if (totalSection <= tarSection) {
        NSAssert(FALSE, @"tarSection too big");
        return 0;
    }
    CGFloat top = [self topOfSection:tarSection];
    
    CGFloat rowTotalHeight = 0;
    NSInteger rowCount = [self.dataSource tableView:self numberOfRowsInSection:tarSection];
    for (NSInteger row = 0; row < rowCount; row++) {
        CGFloat rowHeight = [self.delegate tableView:self heightForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:tarSection]];
        rowTotalHeight += rowHeight;
    }
    
    CGFloat header = [self.delegate tableView:self heightForHeaderInSection:tarSection];
    CGFloat footer = [self.delegate tableView:self heightForFooterInSection:tarSection];
    CGFloat ret = top + header +footer + rowTotalHeight;
    return ret;
    
}

-(CGFloat)topOfIndexPath:(NSIndexPath*)indexPath
{
    NSInteger tarSection = indexPath.section;
    NSInteger tarRow = indexPath.row;
    
    NSInteger totalSection = [self.dataSource numberOfSectionsInTableView:self];
    if (totalSection <= tarSection) {
        NSAssert(FALSE, @"tarSection too big");
        return 0;
    }
    NSInteger totalRow =[self.dataSource tableView:self numberOfRowsInSection:tarSection];
    if (totalRow <= tarRow) {
        NSAssert(FALSE, @"tarRow too big");
        return 0;
    }
    
    NSInteger section = 0;
    CGFloat ret = 0;
    while (section < tarSection) {
        NSInteger rowCount = [self.dataSource tableView:self numberOfRowsInSection:section];
        CGFloat sectionHeight = 0;
        CGFloat rowTotalHeight = 0;
        for (NSInteger row = 0; row < rowCount; row++) {
            
            CGFloat rowHeight = [self.delegate tableView:self heightForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section]];
            rowTotalHeight += rowHeight;
        }
        CGFloat headerHeight = [self.delegate tableView:self heightForHeaderInSection:section];
        CGFloat footerHeight = [self.delegate tableView:self heightForFooterInSection:section];
        sectionHeight += rowTotalHeight;
        sectionHeight += headerHeight;
        sectionHeight += footerHeight;
        ret += sectionHeight;
        section++;
    }
    
    CGFloat tarSectionHeader = [self.delegate tableView:self heightForHeaderInSection:tarSection];
    ret += tarSectionHeader;
    
    CGFloat comSectionRowHeight = 0;
    for (NSInteger row = 0; row < tarRow; row++) {
        CGFloat rowHeight = [self.delegate tableView:self heightForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:tarSection]];
        comSectionRowHeight += rowHeight;
    }
    ret+=comSectionRowHeight;
    return ret;
    
    
}

-(CGFloat)bottomOfIndexPath:(NSIndexPath*)indexPath
{
    CGFloat ret = [self topOfIndexPath:indexPath];
    CGFloat rowHeight = [self.delegate tableView:self heightForRowAtIndexPath:indexPath];
    ret+= rowHeight;
    return ret;
    
}


@end
