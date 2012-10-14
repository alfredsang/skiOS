#import <Foundation/Foundation.h>


@protocol SectionHeaderViewDelegate;


@interface SectionHeaderView : UIView

@property (retain, nonatomic) IBOutlet UILabel *updateLabel;
@property (retain, nonatomic) IBOutlet UIImageView *iconImageView;
@property (retain, nonatomic) IBOutlet UILabel *titleLabel;
@property (retain, nonatomic) IBOutlet UIButton *disclosureButton;
@property (retain, nonatomic) IBOutlet UIImageView *cellLine;
@property (retain, nonatomic) IBOutlet UIImageView *cellBottomLine;



@property (nonatomic, assign) NSInteger section;
@property (nonatomic, assign) id <SectionHeaderViewDelegate> delegate;

- (void)setTitle:(NSString*)title icon:(NSString *)iconImageUrl updateNum:(NSInteger)updateNum section:(NSInteger)sectionNumber delegate:(id <SectionHeaderViewDelegate>)delegate;
-(IBAction)toggleOpen:(id)sender;
-(void)toggleOpenWithUserAction:(BOOL)userAction;

@end



/*
 Protocol to be adopted by the section header's delegate; the section header tells its delegate when the section should be opened and closed.
 */
@protocol SectionHeaderViewDelegate <NSObject>

@optional
-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionOpened:(NSInteger)section;
-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionClosed:(NSInteger)section;

-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionSelected:(NSInteger)section;

@end

