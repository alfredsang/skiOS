//
//  AllTheViewController.h
//  CaiXin
//
//  Created by Rainbow Zhang on 11/4/11.
//  Copyright (c) 2011 iTotemStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionHeaderView.h"
#import "ECategory.h"

@interface AllTheViewController : UIViewController<SectionHeaderViewDelegate>
{

    BOOL _reloading;
    NSMutableArray *_categoryArray;
    NSUInteger _opendSection;
    NSMutableArray *_searchArray;
    NSInteger searchCount;
    BOOL _searchMode;
    BOOL _hasMore;
    BOOL _loadingMore;
    NSInteger _selectedIndex;
    NSString *scanningUrl;

}


@property (retain, nonatomic) IBOutlet UITableView *allTableView;

  
@end
