//
//  ViewController.m
//  IFUtils
//
//  Created by wangjian on 16/5/10.
//  Copyright © 2016年 wangjian. All rights reserved.
//

#import "ViewController.h"
#import "CoretextViewController.h"
#import "ShapedViewController.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *sections;
@property (nonatomic,strong) NSArray *section_0;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    NSArray *section_0 = @[
                           @{@"Coretext":@"onCoretext"},
                           @{@"Paths..":@"onPaths"},
                           @{@"AppInfo":@"onAppInfo"},
                           @{@"DeviceInfo":@"onDeviceInfo"},
                           @{@"Md5":@"onMd5"},
                           @{@"IFDate":@"onIFDate"},
                           @{@"ShapedView":@"onShapedView"}
                           ];
    
    self.sections = @[section_0];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView setFrame:self.view.bounds];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI
-(UITableView*)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

#pragma mark - tableview delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dict = [self.sections objectAtIndex:section];
    return dict.count;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"default"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"default"];
    }
    
    NSArray *section = [self.sections objectAtIndex:indexPath.section];
    NSDictionary *kv = [section objectAtIndex:indexPath.row];
    
    [kv enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        cell.textLabel.text = key;
        *stop = YES;
    }];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSArray *section = [self.sections objectAtIndex:indexPath.section];
    NSDictionary *kv = [section objectAtIndex:indexPath.row];
    
    [kv enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [self performSelector:NSSelectorFromString(obj)];
        *stop = YES;
    }];
}

#pragma mark - Action


-(void)onCoretext
{
    CoretextViewController *ctrler = [[CoretextViewController alloc] init];
    [self.navigationController pushViewController:ctrler animated:YES];
}

-(void)onPaths
{
    NSLog(@"doc path :>%@",if_documentPath());
    NSLog(@"lib path :>%@",if_libraryPath());
    NSLog(@"cache path :>%@",if_cachePath());
}


-(void)onAppInfo
{
    NSString *version = if_appVersion();
    NSUInteger build = if_appBuild();
    NSLog(@"app version %@, build %@",version,@(build));
}

-(void)onDeviceInfo
{
    NSString *deviceMode = if_deviceMode();
    CGFloat iosVersion =  if_iOSVersion();
    NSLog(@"device mode %@,iosVersion %@",deviceMode,@(iosVersion));
}


-(void)onMd5
{
    NSString *org1 = @"123456";
    NSString *org2 = @"111111";
    NSString *org3 = @"abcdefg";
    NSLog(@"org1 %@ => md5_1 %@",org1,[IFMD5 md5:org1]);
    NSLog(@"org2 %@ => md5_1 %@",org2,[IFMD5 md5:org2]);
    NSLog(@"org3 %@ => md5_1 %@",org3,[IFMD5 md5:org3]);
}

-(void)onIFDate
{
    double disSec = random();
    long long now = [[NSDate date] timeIntervalSince1970]*1000;
    for (NSInteger i = 0; i<100; i++) {
        IFDate *date = [[IFDate alloc] initWithTs:now + disSec*i];
        [date selfTest];
    }
    
    
}

-(void)onShapedView
{
    ShapedViewController *ctrler = [[ShapedViewController alloc] init];
    [self.navigationController pushViewController:ctrler animated:YES];
}




@end
