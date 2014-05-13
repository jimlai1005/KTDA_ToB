//
//  indigolemonQueryDataViewController.h
//  KTDA_ToB
//
//  Created by Jim Lai on 2014/5/8.
//  Copyright (c) 2014年 Jim Lai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "indigolemonAppDelegate.h"

@interface indigolemonQueryDataViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate>

@property (strong,nonatomic) IBOutlet UITextField *input_textfield;
@property (strong,nonatomic) IBOutlet UIButton *summit_btn;
@property (strong,nonatomic) IBOutlet UITextView *show_textview;


-(IBAction)summit_act:(id)sender;

@end
