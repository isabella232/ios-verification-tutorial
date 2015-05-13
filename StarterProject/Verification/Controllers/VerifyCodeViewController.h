//
//  VerifyCodeViewController.h
//  Verification
//
//  Created by christian jensen on 5/13/15.
//  Copyright (c) 2015 christian jensen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VerifyCodeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *code;


@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
- (IBAction)verifyCode:(id)sender;

@end
