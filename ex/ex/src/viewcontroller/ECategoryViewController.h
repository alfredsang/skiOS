//
//  ECategoryViewController.h
//  ex
//
//  Created by sang alfred on 9/22/12.
//
//

#import <UIKit/UIKit.h>
#import "SectionHeaderView.h"
#import "ECategory.h"


@interface ECategoryViewController : UIViewController <SectionHeaderViewDelegate>{
    NSMutableArray *_dataArray;
    NSMutableArray *_tbArray;
    int _opendSection;
}



@property (retain, nonatomic) IBOutlet UITableView *allTableView;


@end
