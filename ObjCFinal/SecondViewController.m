//
//  SecondViewController.m
//  ObjCFinal
//
//  Created by Иван  Балабай  on 07.12.2023.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.robot = [[Robot alloc] init];
    NSString *savedPointString = [[NSUserDefaults standardUserDefaults] stringForKey:@"savedPoint"];
    self.robot.coordinates = CGPointFromString(savedPointString);
    self.textView.text = NSStringFromCGPoint(self.robot.coordinates);
}

- (IBAction)saveButtonTapped:(id)sender {
    CGFloat x = [self.xTextField.text floatValue];
    CGFloat y = [self.yTextField.text floatValue];
    self.robot.coordinates = CGPointMake(x, y);
    NSString *pointString = NSStringFromCGPoint(self.robot.coordinates);
    [[NSUserDefaults standardUserDefaults] setObject:pointString forKey:@"savedPoint"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    self.textView.text = NSStringFromCGPoint(self.robot.coordinates);
}
- (IBAction)goToFirstViewController:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
