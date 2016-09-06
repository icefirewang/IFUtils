//
//  ShapedViewController.m
//  JJUtils
//
//  Created by icefire_wang on 16/5/16.
//  Copyright © 2016年 icefire_wang. All rights reserved.
//

#import "ShapedViewController.h"

@interface ShapedViewController ()

@end

@implementation ShapedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    [view if_setMaskImage:[UIImage imageNamed:@"Mask1"]];
    [view if_setContentsCenter:CGRectMake(0.4, 0.4, 0.01, 0.01)];
    [view if_setContentImage:[UIImage imageNamed:@"Animal.jpg"]];
    [self.view addSubview:view];
    
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 40 ,100)];
    [view2 if_setMaskImage:[UIImage imageNamed:@"Mask2"]];
    [view2 if_setContentsCenter:CGRectMake(0.4, 0.4, 0.01, 0.01)];
    [view2 if_setContentImage:[UIImage imageNamed:@"Animal.jpg"]];
    [self.view addSubview:view2];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 320, 50, 50)];
    [btn if_setMaskImage:[UIImage imageNamed:@"Mask1"]];
    [btn if_setContentsCenter:CGRectMake(0.4, 0.4, 0.01, 0.01)];
    [btn if_setContentImage:[UIImage imageNamed:@"Animal.jpg"]];
    [btn addTarget:self action:@selector(onButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(100, 450, 50, 50)];
    [iv if_setMaskImage:[UIImage imageNamed:@"Mask1"]];
    [iv if_setContentsCenter:CGRectMake(0.4, 0.4, 0.01, 0.01)];
    [iv if_setContentImage:[UIImage imageNamed:@"Animal.jpg"]];
    [iv setUserInteractionEnabled:YES];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapImage:)];
    [iv addGestureRecognizer:tap];
    tap = nil;
    
    [self.view addSubview:iv];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


-(IBAction)onButton:(UIButton*)sender
{
    [sender if_setMaskImage:[UIImage imageNamed:@"Mask2"]];
}

-(IBAction)onTapImage:(UITapGestureRecognizer*)sender
{
    UIView *iv = sender.view;
    [iv setSize:CGSizeMake(100, 100)];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
