#import "SectionHeaderView.h"
#import <QuartzCore/QuartzCore.h>

@implementation SectionHeaderView
@synthesize updateLabel = _updateLabel;
@synthesize iconImageView = _iconImageView;
@synthesize titleLabel = _titleLabel;
@synthesize disclosureButton = _disclosureButton;
@synthesize cellLine = _cellLine;
@synthesize cellBottomLine = _cellBottomLine;
@synthesize delegate=_delegate, section=_section;

- (void)setTitle:(NSString*)title icon:(NSString *)iconImageUrl updateNum:(NSInteger)updateNum section:(NSInteger)sectionNumber delegate:(id <SectionHeaderViewDelegate>)delegate
{
    
    self.userInteractionEnabled = YES;
    // Set up the tap gesture recognizer.
    UITapGestureRecognizer *tapGesture = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleOpen:)] autorelease];
    [self addGestureRecognizer:tapGesture];

    _delegate = delegate; 
    _titleLabel.text = title;
    if ([@"博客频道" isEqualToString:title]) {
        [_iconImageView setImage:[UIImage imageNamed:@"blog_icon.png"]];
    }
    else
    {
//        [_iconImageView loadImage:iconImageUrl];
    }
    if (updateNum == 0) {
        _updateLabel.text = @"";
    }
    else
    {
        _updateLabel.text = [NSString stringWithFormat:@"%d", updateNum];
    }
    _section = sectionNumber;
    _cellLine.hidden = NO;
    _cellBottomLine.hidden = YES;
}


-(IBAction)toggleOpen:(UITapGestureRecognizer *)recognizer {
    CGPoint point = [recognizer locationInView:self];
    if (point.x <= 60) {
        
        [self toggleOpenWithUserAction:YES];
    }
    else
    {
        if ([self.delegate respondsToSelector:@selector(sectionHeaderView:sectionSelected:)]) {
            [self.delegate sectionHeaderView:self sectionSelected:self.section];
        }
        
        self.updateLabel.text = @"";
    }
}


-(void)toggleOpenWithUserAction:(BOOL)userAction {
    
    // Toggle the disclosure button state.
    self.disclosureButton.selected = !self.disclosureButton.selected;
    
    // If this was a user action, send the delegate the appropriate message.
    if (userAction) {
        if (self.disclosureButton.selected) {
            if ([self.delegate respondsToSelector:@selector(sectionHeaderView:sectionOpened:)]) {
                [self.delegate sectionHeaderView:self sectionOpened:self.section];
            }
        }
        else {
            if ([self.delegate respondsToSelector:@selector(sectionHeaderView:sectionClosed:)]) {
                [self.delegate sectionHeaderView:self sectionClosed:self.section];
            }
        }
    }
}

- (void)dealloc {
    [_disclosureButton release];
    [_titleLabel release];
    [_iconImageView release];
    [_updateLabel release];
    [_cellLine release];
    [_cellBottomLine release];
    [super dealloc];
}
@end
