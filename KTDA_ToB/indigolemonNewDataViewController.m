//
//  indigolemonNewDataViewController.m
//  KTDA_ToB
//
//  Created by Jim Lai on 2014/5/8.
//  Copyright (c) 2014年 Jim Lai. All rights reserved.
//

#import "indigolemonNewDataViewController.h"

@interface indigolemonNewDataViewController ()
{
    NSString *type;
    NSString *type2;
    NSString *passstring;
    UIAlertView *alertview;
    UIAlertView *alertview2;
    UIAlertView *alertview3;
    NSManagedObjectContext *context;
    NSArray *contextlist;
    NSArray *print;

}
@end

@implementation indigolemonNewDataViewController
@synthesize input_textfield;
@synthesize miles_textfield;
@synthesize summit_btn;
@synthesize pickerView;
@synthesize arrayDay;
@synthesize arrayDay1;
@synthesize arrayDay2;
@synthesize arrayDay3;
@synthesize arrayDay4;
@synthesize arrayDay5;
@synthesize arrayDay6;
@synthesize arrayDay7;
@synthesize arrayDay8;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    indigolemonAppDelegate *appDelegate = (indigolemonAppDelegate *)[[UIApplication sharedApplication]delegate];
    context = [appDelegate managedObjectContext];
    NSEntityDescription *entitydesc = [NSEntityDescription entityForName:@"Input" inManagedObjectContext:context];
    NSFetchRequest *request =[[NSFetchRequest alloc] init];
    [request setEntity:entitydesc];
    NSError *error;
    contextlist = [context executeFetchRequest:request error:&error];
    
    if(contextlist.count>0)
    {
        print = [contextlist objectAtIndex:0];
        input_textfield.text=[print valueForKey:@"name"];
        miles_textfield.text=[print valueForKey:@"miles"];
    }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    input_textfield.delegate = self;
    miles_textfield.delegate = self;
    
    type = @"0";
    type2 = @"1";
    passstring = @"A1";
    
    // picker init start

    arrayDay = [[NSMutableArray alloc] init];
    [arrayDay addObject:@"一般耗材"];
    [arrayDay addObject:@"車架"];
    [arrayDay addObject:@"引擎"];
    [arrayDay addObject:@"傳動"];
    [arrayDay addObject:@"油路"];
    [arrayDay addObject:@"電路"];
    [arrayDay addObject:@"噴射系統"];
    [arrayDay addObject:@"其他"];
    
    arrayDay1 = [[NSMutableArray alloc] init];
    [arrayDay1 addObject:@"機油"];
    [arrayDay1 addObject:@"齒輪油"];
    [arrayDay1 addObject:@"aaaa"];
    [arrayDay1 addObject:@"aaaa"];
    [arrayDay1 addObject:@"aaaa"];
    [arrayDay1 addObject:@"aaaa"];
    [arrayDay1 addObject:@"aaaa"];
    [arrayDay1 addObject:@"aaaa"];
    [arrayDay1 addObject:@"aaaa"];


    
    arrayDay2 = [[NSMutableArray alloc] init];
    [arrayDay2 addObject:@"前剎車皮皮皮"];
    [arrayDay2 addObject:@"後剎車皮"];
    [arrayDay2 addObject:@"aaaa"];
    [arrayDay2 addObject:@"aaaa"];
    [arrayDay2 addObject:@"aaaa"];
    [arrayDay2 addObject:@"aaaa"];
    [arrayDay2 addObject:@"aaaa"];
    [arrayDay2 addObject:@"aaaa"];
    [arrayDay2 addObject:@"aaaa"];
    [arrayDay2 addObject:@"aaaa"];
    [arrayDay2 addObject:@"aaaa"];
    [arrayDay2 addObject:@"aaaa"];
    [arrayDay2 addObject:@"aaaa"];
    [arrayDay2 addObject:@"aaaa"];
    [arrayDay2 addObject:@"aaaa"];
    [arrayDay2 addObject:@"aaaa"];
    [arrayDay2 addObject:@"aaaa"];


    
    arrayDay3 = [[NSMutableArray alloc] init];
    [arrayDay3 addObject:@"汽門進氣"];
    [arrayDay3 addObject:@"汽門排氣"];
    [arrayDay3 addObject:@"aaaa"];
    [arrayDay3 addObject:@"aaaa"];
    [arrayDay3 addObject:@"aaaa"];
    [arrayDay3 addObject:@"aaaa"];
    [arrayDay3 addObject:@"aaaa"];
    [arrayDay3 addObject:@"aaaa"];
    [arrayDay3 addObject:@"aaaa"];
    [arrayDay3 addObject:@"aaaa"];
    
    
    
    arrayDay4 = [[NSMutableArray alloc] init];
    [arrayDay4 addObject:@"驅動皮帶"];
    [arrayDay4 addObject:@"前普利組"];
    [arrayDay4 addObject:@"aaaa"];
    [arrayDay4 addObject:@"aaaa"];
    [arrayDay4 addObject:@"aaaa"];
    [arrayDay4 addObject:@"aaaa"];
    [arrayDay4 addObject:@"aaaa"];
    [arrayDay4 addObject:@"aaaa"];
    [arrayDay4 addObject:@"aaaa"];
    [arrayDay4 addObject:@"aaaa"];
    [arrayDay4 addObject:@"aaaa"];
    [arrayDay4 addObject:@"aaaa"];
    [arrayDay4 addObject:@"aaaa"];
    [arrayDay4 addObject:@"aaaa"];
    [arrayDay4 addObject:@"aaaa"];
    [arrayDay4 addObject:@"aaaa"];
    
    arrayDay5 = [[NSMutableArray alloc] init];
    [arrayDay5 addObject:@"化油器"];
    [arrayDay5 addObject:@"清洗化油器"];
    [arrayDay5 addObject:@"aaaa"];
    [arrayDay5 addObject:@"aaaa"];
    [arrayDay5 addObject:@"aaaa"];
    [arrayDay5 addObject:@"aaaa"];
    [arrayDay5 addObject:@"aaaa"];
    [arrayDay5 addObject:@"aaaa"];
    [arrayDay5 addObject:@"aaaa"];
    [arrayDay5 addObject:@"aaaa"];
    
    arrayDay6 = [[NSMutableArray alloc] init];
    [arrayDay6 addObject:@"CDI點火器"];
    [arrayDay6 addObject:@"高壓線圈"];
    [arrayDay6 addObject:@"aaaa"];
    [arrayDay6 addObject:@"aaaa"];
    [arrayDay6 addObject:@"aaaa"];
    [arrayDay6 addObject:@"aaaa"];
    [arrayDay6 addObject:@"aaaa"];
    [arrayDay6 addObject:@"aaaa"];
    [arrayDay6 addObject:@"aaaa"];
    [arrayDay6 addObject:@"aaaa"];
    [arrayDay6 addObject:@"aaaa"];
    [arrayDay6 addObject:@"aaaa"];
    [arrayDay6 addObject:@"aaaa"];
    [arrayDay6 addObject:@"aaaa"];
    [arrayDay6 addObject:@"aaaa"];
    [arrayDay6 addObject:@"aaaa"];
    
    arrayDay7 = [[NSMutableArray alloc] init];
    [arrayDay7 addObject:@"電腦校正"];
    [arrayDay7 addObject:@"節流閥清洗"];
    [arrayDay7 addObject:@"aaaa"];
    [arrayDay7 addObject:@"aaaa"];
    
    arrayDay8 = [[NSMutableArray alloc] init];
    [arrayDay8 addObject:@"菜籃"];
    [arrayDay8 addObject:@"洗車"];
    [arrayDay8 addObject:@"aaaa"];
    [arrayDay8 addObject:@"aaaa"];
    
    
    
    pickerView.delegate = self;
    pickerView.showsSelectionIndicator = YES;
    pickerView.transform = CGAffineTransformMakeScale(1, 1);
    
    
    
    // picker init end

    
}
-(void)summit_act:(id)sender
{

    input_textfield.text = [input_textfield.text uppercaseString];
    
    if([input_textfield.text isEqualToString:@""])
    {
        alertview = [[UIAlertView alloc] initWithTitle:@"小提示："
                                                message:@"請輸入車牌號碼。"
                                               delegate:self
                                      cancelButtonTitle:@"確定"
                                      otherButtonTitles:nil ];
        alertview.alertViewStyle = UIAlertViewStyleDefault;
        alertview.tag = 1;
        
        [alertview show];
    }
    else if([miles_textfield.text isEqualToString:@""])
    {
        alertview2 = [[UIAlertView alloc] initWithTitle:@"小提示："
                                                message:@"請輸入里程數。"
                                               delegate:self
                                      cancelButtonTitle:@"確定"
                                      otherButtonTitles:nil ];
        alertview2.alertViewStyle = UIAlertViewStyleDefault;
        alertview2.tag = 2;
        
        [alertview2 show];
    }
    else
    {
        [self upload_data];
    }

}
-(void)upload_data
{
    
    // data start
    
    PFQuery *query = [PFQuery queryWithClassName:@"Bike"];
    [query whereKey:@"name" equalTo:[NSString stringWithFormat:@"%@", input_textfield.text]];
   
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error)
        {
            
            for (PFObject *object in objects)
            {
               
                [query getObjectInBackgroundWithId:object.objectId block:^(PFObject *testObject, NSError *error) {
                
                testObject[@"name"] = [NSString stringWithFormat:@"%@", input_textfield.text];
                testObject[@"miles"] = [NSString stringWithFormat:@"%@", miles_textfield.text];
                testObject[passstring] = miles_textfield.text;
                [testObject saveEventually];
                
                }];
            }
        }
        else
        {
            PFObject *testObject = [PFObject objectWithClassName:@"Bike"];
            testObject[@"name"] = [NSString stringWithFormat:@"%@", input_textfield.text];
            testObject[@"miles"] = [NSString stringWithFormat:@"%@", miles_textfield.text];
            testObject[passstring] = miles_textfield.text;
            [testObject saveEventually];
        }
    }];
    
    // data end
    
    // time start

    NSDate *now = [NSDate date];

    
    PFQuery *query2 = [PFQuery queryWithClassName:@"Time"];
    [query2 whereKey:@"name" equalTo:[NSString stringWithFormat:@"%@", input_textfield.text]];
    
    [query2 findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error)
        {
            
            for (PFObject *object in objects)
            {
                
                [query2 getObjectInBackgroundWithId:object.objectId block:^(PFObject *testObject, NSError *error) {
                    
                    testObject[@"name"] = [NSString stringWithFormat:@"%@", input_textfield.text];
                    testObject[passstring] = now;
                    [testObject saveEventually];
                    
                }];
            }
        }
        else
        {
            PFObject *testObject = [PFObject objectWithClassName:@"Time"];
            testObject[@"name"] = [NSString stringWithFormat:@"%@", input_textfield.text];
            testObject[passstring] = now;
            [testObject saveEventually];
        }
    }];
    
    // time end
    
    
    alertview3 = [[UIAlertView alloc] initWithTitle:@"小提示："
                                            message:@"已新增完成。"
                                           delegate:self
                                  cancelButtonTitle:@"確定"
                                  otherButtonTitles:nil ];
    alertview3.alertViewStyle = UIAlertViewStyleDefault;
    alertview3.tag = 3;
    
    [alertview3 show];
    
    [self save_data];

}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    
    return 2;
}

// 0 for 大項目 1-8 for 小項目

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component==0)
    {
        return [arrayDay count];
    }
    else
    {
        if([type isEqualToString:@"0"])
        {
            return [arrayDay1 count];
        }
        else if([type isEqualToString:@"1"])
        {
            return [arrayDay2 count];
        }
        else if([type isEqualToString:@"2"])
        {
            return [arrayDay3 count];
        }
        else if([type isEqualToString:@"3"])
        {
            return [arrayDay4 count];
        }
        else if([type isEqualToString:@"4"])
        {
            return [arrayDay5 count];
        }
        else if([type isEqualToString:@"5"])
        {
            return [arrayDay6 count];
        }
        else if([type isEqualToString:@"6"])
        {
            return [arrayDay7 count];
        }
        else
        {
            return [arrayDay8 count];
        }
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row
          forComponent:(NSInteger)component reusingView:(UIView *)view
{
    if(component==0)
    {
        UILabel *retval = (id)view;
        if (!retval)
        {
            retval= [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 110, 162)];
        }
        
        retval.font = [UIFont systemFontOfSize:24];
        retval.textColor = [UIColor blackColor];
        retval.text =  [arrayDay objectAtIndex:row];
        return retval;
    }
     else
     {
         UILabel *retval = (id)view;
         if (!retval)
         {
             retval= [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 160, 162)];
         }
         
         retval.font = [UIFont systemFontOfSize:24];
         retval.textColor = [UIColor blackColor];
         if([type isEqualToString:@"0"])
         {
             retval.text =  [arrayDay1 objectAtIndex:row];
         }
         else if([type isEqualToString:@"1"])
         {
             retval.text =  [arrayDay2 objectAtIndex:row];
         }
         else if([type isEqualToString:@"2"])
         {
             retval.text =  [arrayDay3 objectAtIndex:row];
         }
         else if([type isEqualToString:@"3"])
         {
             retval.text =  [arrayDay4 objectAtIndex:row];
         }
         else if([type isEqualToString:@"4"])
         {
             retval.text =  [arrayDay5 objectAtIndex:row];
         }
         else if([type isEqualToString:@"5"])
         {
             retval.text =  [arrayDay6 objectAtIndex:row];
         }
         else if([type isEqualToString:@"6"])
         {
             retval.text =  [arrayDay7 objectAtIndex:row];
         }
         else
         {
             retval.text =  [arrayDay8 objectAtIndex:row];
         }
         return retval;
     }
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if(component==0)
    {
        return [arrayDay objectAtIndex:row];
    }
    else
    {
        if([type isEqualToString:@"0"])
        {
            return [arrayDay1 objectAtIndex:row];
        }
        else if([type isEqualToString:@"1"])
        {
            return [arrayDay2 objectAtIndex:row];
        }
        else if([type isEqualToString:@"2"])
        {
            return [arrayDay3 objectAtIndex:row];
        }
        else if([type isEqualToString:@"3"])
        {
            return [arrayDay4 objectAtIndex:row];
        }
        else if([type isEqualToString:@"4"])
        {
            return [arrayDay5 objectAtIndex:row];
        }
        else if([type isEqualToString:@"5"])
        {
            return [arrayDay6 objectAtIndex:row];
        }
        else if([type isEqualToString:@"6"])
        {
            return [arrayDay7 objectAtIndex:row];
        }
        else
        {
            return [arrayDay8 objectAtIndex:row];
        }

    }
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if(component==0)
    {
        type = [NSString stringWithFormat:@"%ld",(long)row];
    }
    else if(component==1)
    {
        type2 = [NSString stringWithFormat:@"%ld",(row+1)];
    }
    
    if([type isEqualToString:@"0"])
    {
        passstring = [NSString stringWithFormat:@"A%@",type2];
    }
    else if([type isEqualToString:@"1"])
    {
        passstring = [NSString stringWithFormat:@"B%@",type2];
    }
    else if([type isEqualToString:@"2"])
    {
        passstring = [NSString stringWithFormat:@"C%@",type2];
    }
    else if([type isEqualToString:@"3"])
    {
        passstring = [NSString stringWithFormat:@"D%@",type2];
    }
    else if([type isEqualToString:@"4"])
    {
        passstring = [NSString stringWithFormat:@"E%@",type2];
    }
    else if([type isEqualToString:@"5"])
    {
        passstring = [NSString stringWithFormat:@"F%@",type2];
    }
    else if([type isEqualToString:@"6"])
    {
        passstring = [NSString stringWithFormat:@"G%@",type2];
    }
    else
    {
        passstring = [NSString stringWithFormat:@"H%@",type2];
    }
    
    [self.pickerView reloadAllComponents];
    
}

-(void)save_data
{
    indigolemonAppDelegate *appDelegate = (indigolemonAppDelegate *)[[UIApplication sharedApplication]delegate];
    context = [appDelegate managedObjectContext];
    NSEntityDescription *entitydesc = [NSEntityDescription entityForName:@"Input" inManagedObjectContext:context];
    NSFetchRequest *request =[[NSFetchRequest alloc] init];
    [request setEntity:entitydesc];
    NSError *error;
    contextlist = [context executeFetchRequest:request error:&error];
    
    if(contextlist.count==0)
    {
        NSManagedObject *newModel = [[NSManagedObject alloc]initWithEntity:entitydesc insertIntoManagedObjectContext:context];
        [newModel setValue:[NSString stringWithFormat:@"%@", input_textfield.text] forKey:@"name"];
        [newModel setValue:[NSString stringWithFormat:@"%@", miles_textfield.text] forKey:@"miles"];
        [context save:&error];
        
    }
    else
    {
        print = [contextlist objectAtIndex:0];
        [print setValue:[NSString stringWithFormat:@"%@", input_textfield.text] forKey:@"name"];
        [print setValue:[NSString stringWithFormat:@"%@", miles_textfield.text] forKey:@"miles"];
        [context save:&error];
    }

}

//點擊鍵盤上的return後隱藏鍵盤

-(BOOL)textFieldShouldReturn:(UITextField *)theTextField
{
    if (theTextField == input_textfield)
    {
        [input_textfield resignFirstResponder];
        [miles_textfield becomeFirstResponder];
    }
    if (theTextField == miles_textfield)
    {
        [miles_textfield resignFirstResponder];
    }
    
    [self save_data];
    
    return YES;
}
//點擊文字框以外的地方隱藏鍵盤

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [input_textfield resignFirstResponder];
    [super touchesBegan:touches withEvent:event];
    [miles_textfield resignFirstResponder];
    [super touchesBegan:touches withEvent:event];
    
    [self save_data];


}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
