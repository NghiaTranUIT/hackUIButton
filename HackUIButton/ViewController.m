//
//  ViewController.m
//  HackUIButton
//
//  Created by Nghia Tran on 10/7/15.
//  Copyright © 2015 Fe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *centerBtn;

@property (strong, nonatomic) UIButton *topBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _topBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [_topBtn setTitle:@"Top Button" forState:UIControlStateNormal];
    [_topBtn addTarget:self action:@selector(topBtnTapped) forControlEvents:UIControlEventTouchUpInside];
    _topBtn.titleLabel.textColor = [UIColor blackColor];
    
    [_topBtn sizeToFit];
    _topBtn.center = CGPointMake(self.view.center.x, 200);
    
    [self.view addSubview:_topBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)centerBtnTapped:(id)sender
{
    NSLog(@"Center Btn Tapped");
}
-(void) topBtnTapped
{
    NSLog(@"Top Btn Tapped");
}
@end
