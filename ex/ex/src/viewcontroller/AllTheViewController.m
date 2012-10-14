//
//  AllTheViewController.m
//  CaiXin
//
//  Created by Rainbow Zhang on 11/4/11.
//  Copyright (c) 2011 iTotemStudio. All rights reserved.
//

#import "AllTheViewController.h"
#import "JSONKit.h";


@interface AllTheViewController()
- (void)showUpdatePrompt;
- (void)jumpToWebViewControllerWithUrl:(NSString *)url;
- (void)initActionLoadingView;
- (void)ensurePopoverViewHideWithShowFlag:(BOOL)isHiddenflag;
@end

static BOOL isTapRefreshBt = NO;

@implementation AllTheViewController
@synthesize allTableView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        _categoryArray = [NSMutableArray array];
        
        
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib. 

    
    _categoryArray = [[NSMutableArray alloc] initWithArray:categories];
    _opendSection = NSUIntegerMax;
    [self.allTableView reloadData];
    
     
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewWillAppear:(BOOL)animated
{
   
}

 - (void)viewDidUnload
{
    [self setSettingButton:nil];
    [self setAllTableView:nil];
    [self setSearchBar:nil];
    [self setUpdatePromptView:nil];
    [self setUpdateCountLabel:nil];
    [self setNoSearchResultLabel:nil];
    popOverView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    if (_searchMode) {
        return 1;
    }
    else
    {
       


        return [_categoryArray count];
    }
}

 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
        ECategory *category = [_categoryArray objectAtIndex:section];
        if (category.opened) 
        {
            return [category.subCategorys count];
        }
     
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
        static NSString *CellIdentifier = @"TopicTitleCell";
        TopicTitleCell *cell = (TopicTitleCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = (TopicTitleCell *)[[[NSBundle mainBundle] loadNibNamed:@"TopicTitleCell" owner:self options:nil] objectAtIndex:0];
        }

        ECategory *category = [_categoryArray objectAtIndex:indexPath.section];
        SubCategory *subCategory = [category.subCategorys objectAtIndex:indexPath.row];

        [cell setTitle:subCategory.title updateNum:[subCategory.articleCount intValue]];  
        cell.titleLabel.font = FONT_COMMON_LOADING;
        

    	cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    	if (indexPath.row == [category.subCategorys count] - 1)
    	{
        	cell.cellLine.hidden = YES;
        	cell.cellBottomLine.hidden = NO;
    	}
    	return cell;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  
        ECategory *category = [_categoryArray objectAtIndex:section];
        SectionHeaderView *headerView = (SectionHeaderView *)[[[NSBundle mainBundle] loadNibNamed:@"SectionHeaderView" owner:self options:nil] objectAtIndex:0];
        [headerView setTitle:category.title icon:category.iconUrl updateNum:[category.articleCount intValue] section:section delegate:self];
        
        if (category.opened)
        {
            headerView.cellLine.hidden = YES;
            headerView.cellBottomLine.hidden = NO;
            headerView.disclosureButton.selected = YES;
        }
        headerView.titleLabel.font = FONT_ALL_VIEW_CONTROLLER_TITLE_LABEL;
        
        return headerView;
    
}

#pragma mark -
#pragma mark Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
  
        ECategory *category = [_categoryArray objectAtIndex:indexPath.section];

        if (indexPath.section == [_categoryArray count] - 1) {
            ArticleListViewController *articleListViewController = [[[ArticleListViewController alloc] initWithCategoryId:@"blog"] autorelease];
            articleListViewController.backTitle = category.title;
            [self.navigationController pushViewController:articleListViewController animated:YES];
        }
        else
        {
            //Category *category = [_categoryArray objectAtIndex:indexPath.section];
            SubCategory *subCategory = [category.subCategorys objectAtIndex:indexPath.row];
            ArticleListViewController *articleListViewController = [[[ArticleListViewController alloc] initWithCategoryId:subCategory.categoryId] autorelease];
            articleListViewController.channelId = subCategory.parentChannelId;
            articleListViewController.backTitle = category.title;
            [self.navigationController pushViewController:articleListViewController animated:YES];
        }
        
        SubCategory *subCategory = [category.subCategorys objectAtIndex:indexPath.row];
        subCategory.articleCount = 0;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    return 44;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 54;
}
 
 
 
#pragma mark Section header delegate
-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionOpened:(NSInteger)sectionOpened { 
//    Category *category = [_categoryArray objectAtIndex:sectionOpened]; 
//    category.opened = YES;
//    [self.allTableView reloadSections:[NSIndexSet indexSetWithIndex:sectionOpened] withRowAnimation:UITableViewRowAnimationFade];
    if (_opendSection != NSUIntegerMax) {
        ECategory *category = [_categoryArray objectAtIndex:_opendSection]; 
        category.opened = NO;
        
        [self.allTableView reloadSections:[NSIndexSet indexSetWithIndex:_opendSection] withRowAnimation:UITableViewRowAnimationFade];
    }
    
    ECategory *category = [_categoryArray objectAtIndex:sectionOpened]; 
    category.opened = YES;
    [self.allTableView reloadSections:[NSIndexSet indexSetWithIndex:sectionOpened] withRowAnimation:UITableViewRowAnimationFade];
    [self.allTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:sectionOpened] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    _opendSection = sectionOpened;
}

-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionClosed:(NSInteger)sectionClosed {
    ECategory *category = [_categoryArray objectAtIndex:sectionClosed]; 
    category.opened = NO;
    
    [self.allTableView reloadSections:[NSIndexSet indexSetWithIndex:sectionClosed] withRowAnimation:UITableViewRowAnimationFade];

    _opendSection = NSUIntegerMax;
}

-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionSelected:(NSInteger)section
{
    ECategory *category = [_categoryArray objectAtIndex:section];
    if (section == [_categoryArray count] - 1) {
//        ArticleListViewController *articleListViewController = [[[ArticleListViewController alloc] initWithCategoryId:@"blog"] autorelease];
//        articleListViewController.backTitle = category.title;
//        
//        [self.navigationController pushViewController:articleListViewController animated:YES];
    }
    else
    {
        //Category *category = [_categoryArray objectAtIndex:section];
//        ArticleListViewController *articleListViewController = [[[ArticleListViewController alloc] initWithCategoryId:category.categoryId] autorelease];
//        articleListViewController.isChannel = YES;
//        articleListViewController.channelId = category.channelId;
//        articleListViewController.backTitle = category.title;
//        [self.navigationController pushViewController:articleListViewController animated:YES];
    }
    
    category.articleCount = 0;
}


- (void)dealloc {


    [allTableView release];
  
    [super dealloc];
}
 

@end
