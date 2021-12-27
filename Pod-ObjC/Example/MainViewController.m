//
//  MainViewController.m
//  Example
//
//  Created by Zhiming Ma on 2021/12/16.
//

#import "MainViewController.h"
#import <XooReality/XooReality.h>


#pragma mark - Item

@interface Item: NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *token;

@end

@implementation Item

@end

#pragma mark - MainViewController

@interface MainViewController () {
    NSArray<Item *> *items;
}
@end

@interface MainViewController (TableView) <UITableViewDataSource, UITableViewDelegate>
@end

@interface MainViewController (XooRealityView) <XooRealityViewControllerDelegate>
@end

@implementation MainViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        Item *example = [Item new];
        example.title = @"Example";
        example.token = @"eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZXEiOjUsImdpZCI6InpHWjUxRVo1Iiwic3ViIjoiNWd4eFVHS2ciLCJpYXQiOjE2Mzk1NjAzMTUsImV4cCI6MjAzOTgxOTUxNX0.pVzesl_gfr3Y3CDXlPQtzh0F-388Wfe4qlaLuuSFKM6l2cCQmyA6xCp_xYPUcCwiOFd_CI5DOG__3bg-Ao_kMJ_TSFkwoPmRLTyQXXOSYA3j5q60rXFbLglb1DVj0nkokv3ow5G8VWyTYDN_TEGye4It3G1tvYGXksmjVFR-64PRCr66PrkCwrNQQQvMgUmsosyKXpqPpGFjZhjEnijeBiP7qU2d7IinNdtlivOQEjetQFmJR0SAxMQOSDGez5dllYDIK83orWHoK5KJcaQKHxQR3njLZC0pTH-hk6iTlGrJOLmtLQcC45UhqdnJ8v4fBlHQjCVIEswGCEUN_MCVVg";
        items = @[example];
    }
    return self;
}

- (void)loadView {
    self.view = [UITableView new];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView* tableView = (UITableView*) self.view;
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier: @"Cell"];
}

#pragma mark - TableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier: @"Cell" forIndexPath: indexPath];
    cell.textLabel.text = items[indexPath.item].title;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return items.count;
}

#pragma mark - TableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    XooRealityViewController* xooReality = [XooRealityViewController new];
    xooReality.delegate = self;
    [xooReality setup:@{ @"token": items[indexPath.item].token }];
}

#pragma mark - XooRealityViewControllerDelegate

- (void)viewControllerSetupProgressing:(XooRealityViewController *)viewController progress:(float)progress {
    NSLog(@"Setup progress: %f", progress);
}

- (void)viewControllerSetupFinished:(XooRealityViewController *)viewController error:(NSError *)error {
    if (error == nil) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:viewController animated:true completion:nil];
        });
    } else {
        NSLog(@"Setup error: %ld", (long)error.code);
    }
}

- (void)viewControllerWillDismiss:(XooRealityViewController *)viewController {
    [self dismissViewControllerAnimated:true completion: nil];
}

@end
