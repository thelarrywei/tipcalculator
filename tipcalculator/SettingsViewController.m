//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Larry Wei on 10/10/14.
//  Copyright (c) 2014 Larry Wei. All rights reserved.
//

#import "SettingsViewController.h"
#import "TipViewController.h"


@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultControl;
@property (weak, nonatomic) IBOutlet UISwitch *roundUpSwitch;

- (IBAction)setDefaults:(id)sender;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Set the default selector to match the previous default
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger defaultTip = [defaults integerForKey:@"defaultTipIndex"];
    [self.defaultControl setSelectedSegmentIndex:defaultTip];
    [self.roundUpSwitch setOn:[defaults boolForKey:@"roundUpBool"] animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)setDefaults:(id)sender {
     // Set defaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultControl.selectedSegmentIndex forKey:@"defaultTipIndex"];
    [defaults setBool:self.roundUpSwitch.isOn forKey:@"roundUpBool"];
    NSLog(@"Defaults set");
    [defaults synchronize];
}

@end
