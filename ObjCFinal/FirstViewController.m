//
//  FirstViewController.m
//  ObjCFinal
//
//  Created by Иван  Балабай  on 07.12.2023.
//

#import "FirstViewController.h"


@interface FirstViewController ()

@end


@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *savedText = [[NSUserDefaults standardUserDefaults] stringForKey:@"savedText"];
    self.textView.text = savedText;
}

- (IBAction)saveButtonTapped:(id)sender {
    NSString *text = self.textField.text;
    [[NSUserDefaults standardUserDefaults] setObject:text forKey:@"savedText"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    self.textView.text = text;
}

@end
