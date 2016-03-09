//
//  ViewController.m
//  maoyan
//
//  Created by zhujieshan on 16/2/24.
//  Copyright © 2016年 zhujieshan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollV;
@property(nonatomic , strong)UISegmentedControl *segmentC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height/10)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    UIButton *righrBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    righrBtn.frame = CGRectMake(self.view.bounds.size.width -50, self.view.bounds.size.height/10/7, 50, 50);
    [righrBtn addTarget:self action:@selector(rightBarButtonItemAction:) forControlEvents:UIControlEventTouchUpInside];
    [righrBtn setImage:[[UIImage imageNamed:@"searchicon"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ]forState:UIControlStateNormal];
    [view addSubview:righrBtn];
    
    NSArray *arr =@[@"1" , @"2" , @"3"];
    self.segmentC = [[UISegmentedControl alloc]initWithItems:arr];
    self.segmentC.backgroundColor = [UIColor colorWithRed:0.56 green:0 blue:0 alpha:1];
    self.segmentC.frame = CGRectMake(view.bounds.size.width/4, view.bounds.size.height/2, view.bounds.size.width/2, 40);
    [self.view addSubview:self.segmentC];
    self.segmentC.tintColor = [UIColor clearColor];
    self.segmentC.layer.cornerRadius = 10 ;
    [self.segmentC addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    self.segmentC.selectedSegmentIndex = 0 ;

    NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor whiteColor]};
    [self.segmentC setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];
    //设置文字属性
    NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor lightTextColor]};
    [self.segmentC setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    
    self.scrollV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height/10+20, self.view.bounds.size.width, self.view.bounds.size.height-self.view.bounds.size.height/10)];
    self.scrollV.contentSize = CGSizeMake(self.view.bounds.size.width*3, self.view.bounds.size.height/10+20);
    self.scrollV.bounces = NO;
    self.scrollV.pagingEnabled = YES;
    self.scrollV.delegate = self;
    [self.view addSubview:self.scrollV];
    
    [self firstV];
    
    UIView *secondV = [[UIView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width, 0 , self.view.bounds.size.width, self.view.bounds.size.height-self.view.bounds.size.height/10)];
    secondV.backgroundColor = [UIColor whiteColor];
    [self.scrollV addSubview:secondV];

    UIView *thildV = [[UIView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width*2, 0, self.view.bounds.size.width, self.view.bounds.size.height-self.view.bounds.size.height/10)];
    thildV.backgroundColor = [UIColor whiteColor];
    [self.scrollV addSubview:thildV];
    NSString *str = @"jieshua SB";
    NSString *str1 = @"我是天才少年";
    
}
-(void)firstV{
    UIView *firstV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-self.view.bounds.size.height/10)];
    firstV.backgroundColor = [UIColor whiteColor];
    [self.scrollV addSubview:firstV];
}

-(void)segmentAction:(UISegmentedControl *)segmentC{
    
    self.scrollV.contentOffset = CGPointMake(self.view.bounds.size.width*segmentC.selectedSegmentIndex, 0);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.segmentC.selectedSegmentIndex = (self.scrollV.contentOffset.x  + self.view.bounds.size.width/2)/ self.view.bounds.size.width;
}

-(void)rightBarButtonItemAction:(UIBarButtonItem *)buttonItem{
    NSLog(@"test");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
