//
//  ListOtherViewController.h
//  ex
//
//  Created by sang alfred on 9/4/12.
//
//

#import <UIKit/UIKit.h>
#import "SettingsViewController.h"
#import "HistoryViewController.h"
#import "CollectViewController.h"

@interface ListOtherViewController : UIViewController

/**
 * 设置
 */
-(IBAction)showShezhiViewController:(id)sender;


/**
 * 历史记录
 */
-(IBAction)showHistoryViewController:(id)sender;

/**
 * 收藏
 */
-(IBAction)showCollectViewController:(id)sender;


/**
 * 消失
 */
-(IBAction)dismiss:(id)sender;


@end
