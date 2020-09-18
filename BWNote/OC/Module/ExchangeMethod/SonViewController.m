//
//  SonViewController.m
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/24.
//  Copyright © 2020 apple. All rights reserved.
//

#import "SonViewController.h"

@interface SonViewController ()

@end

@implementation SonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super aboutSuper];
    // Do any additional setup after loading the view.
}
//- (void)hello {
//    
//}
//-(void)hello {
//    NSLog(@"son say hello");
//}
/*
#pragma mark - Navigation
 
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)openFather {
    [super aboutSuper];
}
-(void)aboutSuper {
    [super aboutSuper];
    NSLog(@"我是子类about=======super");
}
@end
