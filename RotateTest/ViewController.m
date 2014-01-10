//
//  ViewController.m
//  RotateTest
//
//  Created by John Stewart on 1/10/14.
//  Copyright (c) 2014 John Stewart. All rights reserved.
//

// A quick project to test suggestions from http://stackoverflow.com/questions/20987249/how-do-i-programmatically-set-device-orientation-in-ios7/

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) bool modePortraitOnly;

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.portraitOnlySwitch addTarget:self action:@selector(controlChanged:) forControlEvents:UIControlEventValueChanged];
    [self.portraitOnlySwitch setOn:TRUE];
    self.modePortraitOnly = TRUE;
}

- (void) controlChanged:(id)sender {
    self.modePortraitOnly = self.portraitOnlySwitch.isOn;

    if (self.modePortraitOnly) {
        // We just changed to portrait-only; try to force a rotation into portrait
        
        // Charan Giri suggestion
        [self willRotateToInterfaceOrientation:UIInterfaceOrientationPortrait duration:1.0];
        
        // Sunny shah suggestion (works! Hack, unsupported)
//        objc_msgSend([UIDevice currentDevice], @selector(setOrientation:), UIInterfaceOrientationPortrait );

    }
}

- (NSUInteger) supportedInterfaceOrientations {
    if (self.modePortraitOnly) {
        return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}


- (BOOL) shouldAutorotate {
    return TRUE;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
