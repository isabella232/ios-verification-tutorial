//
//  VerifyCodeViewController.m
//  Verification
//
//  Created by christian jensen on 5/13/15.
//  Copyright (c) 2015 christian jensen. All rights reserved.
//

#import "VerifyCodeViewController.h"
#import <SinchVerification/SinchVerification.h>
@interface VerifyCodeViewController ()

@end

@implementation VerifyCodeViewController
@synthesize verification, code, status
;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [code becomeFirstResponder];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [code resignFirstResponder];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)verifyCode:(id)sender {
    
    if ([code.text isEqualToString:@""])
    {
        status.text = @"You must enter a code";
    }
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:_spinner
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeHeight
                              multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:_spinner
                              attribute:NSLayoutAttributeWidth
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeWidth
                              multiplier:1.0 constant:0.0]];
    [_spinner startAnimating];
    [self.verification
     verifyCode:code.text
     completionHandler:^(BOOL success, NSError* error) {
         if (success) {
             [_spinner stopAnimating];
             [self performSegueWithIdentifier:@"confirmedSeg" sender:nil];
             // Phone number was successfully verified
         } else {
             // Ask user to re-attempt verification
             status.text = [error description];
         }
     }];
}
@end
