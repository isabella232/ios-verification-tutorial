//
//  EnterPhoneNumberViewController.m
//  Verification
//
//  Created by christian jensen on 5/13/15.
//  Copyright (c) 2015 christian jensen. All rights reserved.
//

#import "EnterPhoneNumberViewController.h"

@interface EnterPhoneNumberViewController ()

@end

@implementation EnterPhoneNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_phoneNumber becomeFirstResponder];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [_phoneNumber resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)requestCode:(id)sender {
    _spinner.frame = self.view.frame;
    [_spinner startAnimating];
    [self performSegueWithIdentifier:@"verifyCodeSeg" sender:nil];
}
@end
