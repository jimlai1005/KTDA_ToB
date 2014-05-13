//
//  indigolemonQueryDataViewController.m
//  KTDA_ToB
//
//  Created by Jim Lai on 2014/5/8.
//  Copyright (c) 2014年 Jim Lai. All rights reserved.
//

#import "indigolemonQueryDataViewController.h"

@interface indigolemonQueryDataViewController ()
{
    NSString *show_text;
    NSString *temp_name;
    NSManagedObjectContext *context;
    NSArray *contextlist;
    NSArray *print;
}
@end

@implementation indigolemonQueryDataViewController
@synthesize input_textfield;
@synthesize summit_btn;
@synthesize show_textview;

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
    }
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    show_textview.delegate = self;
    
    // Do any additional setup after loading the view.
}
-(void)summit_act:(id)sender
{
    [self query_data];
}
-(void)query_data
{
    PFQuery *query = [PFQuery queryWithClassName:@"Bike"];
    [query whereKey:@"name" equalTo:input_textfield.text];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            // The find succeeded.
            // NSLog(@"Successfully retrieved %d scores.", objects.count);
            // Do something with the found objects
            show_text=@"";
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
                temp_name = [object objectForKey:@"name"];
                show_text = [NSString stringWithFormat:@"%@ 車牌號碼：%@ 維修項目：%@\n",show_text, temp_name,object.objectId];
                
            }
            show_textview.text = show_text;
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
