//
//  ShitiViewController.h
//  ex
//
//  Created by alfred sang on 12-8-2.
//  Copyright (c) 2012年 no320.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SummaryViewController.h"
#import "DM_Shiti.h"
#import <QuartzCore/QuartzCore.h>
#import <QuartzCore/QuartzCore.h>
#import "ShitiAnswerTableViewControllerViewController.h"
#import "ListOtherViewController.h"
#import "NoteInfoView.h"
#import "BottomBarView.h"
#import "AnswerHistoryCache.h"

//我的收藏
typedef enum {
    view_model_answer = 1,//答案模式
    view_model_question = 0,//问题模式
} ViewModel;

@interface ShitiViewController : UIViewController <NoteInfoViewDelegate,UITableViewDataSource,UITableViewDelegate>{
    
    AnswerHistoryCache *_history;
    /**
     * 当前id
     */
    int _currentTid;
    DM_Shiti *_shiti;
    MyPatternModel _myPattern;
    /**
     * 当前模式
     * default value = view_model_question
     */
    ViewModel _myViewMode;
    /**
     * 当前数据源的id
     */
    int _dsId;
    
    NSMutableArray *_dsKeyArray;
    
    NoteInfoView* hintView;
    
    UITableView *_tableView;
    NSMutableArray *items;
    BOOL _isAnswered;
    
    BottomBarView *_bottomBarView;
    
    int c;
    
    UIView *_shitiView;
    /**
     * 关闭答案模式按钮
     */
    UIButton *ui_btn_closeAnswerPattern;
}

#pragma mark - properties implemetions

/**
 * 背景图片
 */
@property(nonatomic,retain,readwrite) IBOutlet UIImageView *ui_bgPic;

/**
 * 题号
 */
@property(nonatomic,retain,readwrite) IBOutlet UIButton *ui_btn_tNumber;
/**
 * 题目正文
 */
@property(nonatomic,retain,readwrite) IBOutlet UILabel *ui_tName;
/**
 * 图片
 */
@property(nonatomic,retain,readwrite) IBOutlet UIImageView *ui_tPicAddr;
/**
 * 题号
 */
@property(nonatomic,retain,readwrite) IBOutlet UILabel *ui_ttid;
/**
 * 左翻按钮
 */
@property(nonatomic,retain,readwrite) IBOutlet UIButton *ui_left;
/**
 * 右翻按钮
 */
@property(nonatomic,retain,readwrite) IBOutlet UIButton *ui_right;
/**
 * 左翻按钮
 */
@property(nonatomic,retain,readwrite) IBOutlet UIButton *ui_config;
 
/**
 * 收藏按钮
 */
@property(nonatomic,retain,readwrite) IBOutlet UIButton *ui_btn_shoucang;

/**
 * 翻页控制按钮
 */
@property(nonatomic,retain,readwrite) IBOutlet UIButton *ui_btn_flip;

#pragma mark - methods implemetions

/**
 * 根据MyPatternModel初始化数据
 *      PatternModel_Seq = 0,//顺序练习
 *      PatternModel_Random = 1,//随机练习
 *      PatternModel_Chapter = 2,//章节练习
 */
- (id)initWithPattern:(MyPatternModel)myPattern;

/**
 * 跳转到制定页面，更新对应tPageNumber的试题
 */
-(void)jumpTo:(NSNumber *)tPageNumber;

/**
 * 左翻事件响应
 */
-(IBAction)left:(id)sender;

/**
 * 右翻事件响应
 */
-(IBAction)right:(id)sender;

/**
 * 当点击收藏按钮时，触发的事件
 */
-(IBAction)whenClickShoucangBtn:(UIButton *)sender;

/**
 * 当点击翻页控制按钮按钮时，触发的事件
 */
-(IBAction)whenClickFilpControlBtn:(UIButton *)sender;


/**
 * 查看答案
 */
-(IBAction)viewAnswerBtn:(UIButton *)sender;
 
/**
 * 显示附加功能列表
 */
-(IBAction)showSettingsView:(id)sender;

@end
