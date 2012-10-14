//
//  ECategoryViewController.m
//  ex
//
//  Created by sang alfred on 9/22/12.
//
//

#import "ECategoryViewController.h"
#import "TopicTitleCell.h"
#import "JSONKit.h"

@interface ECategoryViewController ()

@end

@implementation ECategoryViewController

@synthesize allTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _tbArray = [NSMutableArray array];
        _dataArray = [NSMutableArray array];
        
        [allTableView  setBackgroundColor:[UIColor grayColor]];
        
         
        NSString *s =[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"section_config" ofType:@"json"] encoding:NSUTF8StringEncoding error:nil];
        NSDictionary *_dataDic = (NSDictionary *)[s objectFromJSONString];
        
        
        for (int i = 1;i<20;i++) {
            NSString *cid = [NSString  stringWithFormat:@"c%d",i];
            NSDictionary *c = [_dataDic objectForKey:cid];
            ECategory *ec = [[ECategory alloc] init];
            ec.cid = [c objectForKey:@"cid"];
            ec.name = [c objectForKey:@"chapter_name"];
            ec.count = [c objectForKey:@"shiti_count"];
            ec.subs = [c objectForKey:@"subs"];
            [_dataArray addObject:ec];
            [ec release];
        }
        
        _tbArray = [_dataArray copy];
        
        
        NSLog(@"%@",_tbArray);
    }
    return self;
}

- (void)dealloc{
    [super dealloc];
    [_dataArray dealloc];
    [_tbArray dealloc];
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

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
    return [_tbArray count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    ECategory *category = [_categoryArray objectAtIndex:section];
//    if (category.opened)
//    {
//        return [category.subCategorys count];
//    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 44;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 54;
}


#pragma mark -
#pragma mark Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    ECategory *category = [_categoryArray objectAtIndex:indexPath.section];
//    
//    if (indexPath.section == [_categoryArray count] - 1) {
//        ArticleListViewController *articleListViewController = [[[ArticleListViewController alloc] initWithCategoryId:@"blog"] autorelease];
//        articleListViewController.backTitle = category.title;
//        [self.navigationController pushViewController:articleListViewController animated:YES];
//    }
//    else
//    {
//        //Category *category = [_categoryArray objectAtIndex:indexPath.section];
//        SubCategory *subCategory = [category.subCategorys objectAtIndex:indexPath.row];
//        ArticleListViewController *articleListViewController = [[[ArticleListViewController alloc] initWithCategoryId:subCategory.categoryId] autorelease];
//        articleListViewController.channelId = subCategory.parentChannelId;
//        articleListViewController.backTitle = category.title;
//        [self.navigationController pushViewController:articleListViewController animated:YES];
//    }
//    
//    SubCategory *subCategory = [category.subCategorys objectAtIndex:indexPath.row];
//    subCategory.articleCount = 0;
    
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TopicTitleCell";
    TopicTitleCell *cell = (TopicTitleCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = (TopicTitleCell *)[[[NSBundle mainBundle] loadNibNamed:@"TopicTitleCell" owner:self options:nil] objectAtIndex:0];
    }
    
    ECategory *category = [_tbArray objectAtIndex:indexPath.section];
    ECategoryBase *subCategory = [category.subs objectAtIndex:indexPath.row];
    
    [cell setTitle:subCategory.name updateNum:[category.count intValue]];
//    cell.titleLabel.font = FONT_COMMON_LOADING;
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row == [category.subs count] - 1)
    {
        cell.cellLine.hidden = YES;
        cell.cellBottomLine.hidden = NO;
    }
    return cell;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    // ECategory *category = [_categoryArray objectAtIndex:section];
    SectionHeaderView *headerView = (SectionHeaderView *)[[[NSBundle mainBundle] loadNibNamed:@"SectionHeaderView" owner:self options:nil] objectAtIndex:0];
//    [headerView setTitle:category.title icon:category.iconUrl updateNum:[category.articleCount intValue] section:section delegate:self];
    
    ECategory *ec = [_tbArray objectAtIndex:section];
    [headerView setTitle:ec.name icon:@"url" updateNum:[ec.count intValue] section:section delegate:self];
    
    if (ec.opened)
    {
        headerView.cellLine.hidden = YES;
        headerView.cellBottomLine.hidden = NO;
        headerView.disclosureButton.selected = YES;
    }
//    headerView.titleLabel.font = FONT_ALL_VIEW_CONTROLLER_TITLE_LABEL;
//    
    return headerView;
    
}

#pragma mark Section header delegate
-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionOpened:(NSInteger)sectionOpened {
    //    Category *category = [_categoryArray objectAtIndex:sectionOpened];
    //    category.opened = YES;
    //    [self.allTableView reloadSections:[NSIndexSet indexSetWithIndex:sectionOpened] withRowAnimation:UITableViewRowAnimationFade];
    if (_opendSection != NSUIntegerMax) {
        ECategory *category = [_tbArray objectAtIndex:_opendSection];
        category.opened = NO;
        
        [self.allTableView reloadSections:[NSIndexSet indexSetWithIndex:_opendSection] withRowAnimation:UITableViewRowAnimationFade];
    }
    
    ECategory *category = [_tbArray objectAtIndex:sectionOpened];
    category.opened = YES;
    [self.allTableView reloadSections:[NSIndexSet indexSetWithIndex:sectionOpened] withRowAnimation:UITableViewRowAnimationFade];
//    [self.allTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:sectionOpened] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    _opendSection = sectionOpened;
}

-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionClosed:(NSInteger)sectionClosed {
    ECategory *category = [_tbArray objectAtIndex:sectionClosed];
    category.opened = NO;
    
    [self.allTableView reloadSections:[NSIndexSet indexSetWithIndex:sectionClosed] withRowAnimation:UITableViewRowAnimationFade];
    
    _opendSection = NSUIntegerMax;
}

-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionSelected:(NSInteger)section
{
    ECategory *category = [_tbArray objectAtIndex:section];
    if (section == [_tbArray count] - 1) {
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
    
    //category.articleCount = 0;
}


@end
