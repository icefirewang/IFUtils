//
//  CoretextVIewController.m
//  IFUtils
//
//  Created by wangjian on 16/5/13.
//  Copyright © 2016年 wangjian. All rights reserved.
//

#import "CoretextViewController.h"
#import "NSMutableDictionary+IFCoreText.h"
#import "NSMutableAttributedString+IFCoreText.h"

@interface CoretextViewController ()

@end

@implementation CoretextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSMutableDictionary *attribute1 = [[NSMutableDictionary alloc] init];
    attribute1.if_coretextLineHeight(20).if_coretextColor([UIColor blueColor]).if_coretextFont([UIFont boldSystemFontOfSize:20]);
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"123" attributes:attribute1];
    UILabel *lb1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 200,30)];
    [lb1 setAttributedText:string];
    [self.view addSubview:lb1];
  
    
    
    NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:@"哈哈哈，123456790，abcdefghijklmn,opq,rst,uvwxyz,a123123132132132123123123132132132132132132123123123123123123zzz"];
    string1
    .if_setLineHeight(20,NSMakeRange(0, string1.length))
    .if_setTextFont([UIFont systemFontOfSize:12],NSMakeRange(0, 3))
    .if_setTextFont([UIFont systemFontOfSize:15],NSMakeRange(0, string1.length))
    .if_setTextColor([UIColor blackColor],NSMakeRange(0, string1.length))
    .if_setTextColor([UIColor blueColor],NSMakeRange(10, 10))
    .if_setBackgroundColor([UIColor lightGrayColor],NSMakeRange(0, 5));
    
    string1.if_insertImage([UIImage imageNamed:@"4"],CGRectMake(5, 5, 40, 20),10);
    
    CGFloat height =   string1.if_getHeightInWidth(300);
    
    UILabel *lb2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, 300, height)];
    lb2.numberOfLines = 0;
    lb2.backgroundColor = [UIColor brownColor];
    lb2.attributedText = string1;
    lb2.lineBreakMode = NSLineBreakByCharWrapping;
    [self.view addSubview:lb2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    
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
