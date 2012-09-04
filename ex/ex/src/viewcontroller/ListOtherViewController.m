//
//  ListOtherViewController.m
//  ex
//
//  Created by sang alfred on 9/4/12.
//
//

#import "ListOtherViewController.h"

@interface ListOtherViewController ()

@end

@implementation ListOtherViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - ss
/**
 * 设置
 */
-(IBAction)showShezhiViewController:(id)sender{
    SettingsViewController *setView = [[SettingsViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:setView];
    navController.navigationBarHidden = YES;
    [self presentModalViewController:navController animated:YES];
    [navController release];
}


/**
 * 历史记录
 */
-(IBAction)showHistoryViewController:(id)sender{
    HistoryViewController *setView = [[HistoryViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:setView];
    navController.navigationBarHidden = YES;
    [self presentModalViewController:navController animated:YES];
    [navController release];
}

/**
 * 收藏
 */
-(IBAction)showCollectViewController:(id)sender{
    CollectViewController *setView = [[CollectViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:setView];
    navController.navigationBarHidden = YES;
    [self presentModalViewController:navController animated:YES];
    [navController release];
}


/**
 * 消失
 */
-(IBAction)dismiss:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}

@end
