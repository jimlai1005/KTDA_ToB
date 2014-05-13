//
//  indigolemonNewDataViewController.h
//  KTDA_ToB
//
//  Created by Jim Lai on 2014/5/8.
//  Copyright (c) 2014年 Jim Lai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "indigolemonAppDelegate.h"

@interface indigolemonNewDataViewController : UIViewController<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>

@property (strong,nonatomic) IBOutlet UITextField *input_textfield;
@property (strong,nonatomic) IBOutlet UITextField *miles_textfield;
@property (strong,nonatomic) IBOutlet UIButton *summit_btn;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
@property (nonatomic) NSMutableArray *arrayDay;
@property (nonatomic) NSMutableArray *arrayDay1;
@property (nonatomic) NSMutableArray *arrayDay2;
@property (nonatomic) NSMutableArray *arrayDay3;
@property (nonatomic) NSMutableArray *arrayDay4;
@property (nonatomic) NSMutableArray *arrayDay5;
@property (nonatomic) NSMutableArray *arrayDay6;
@property (nonatomic) NSMutableArray *arrayDay7;
@property (nonatomic) NSMutableArray *arrayDay8;



-(IBAction)summit_act:(id)sender;

@end