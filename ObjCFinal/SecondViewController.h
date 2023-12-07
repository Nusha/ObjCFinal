//
//  SecondViewController.h
//  ObjCFinal
//
//  Created by Иван  Балабай  on 07.12.2023.
//

#import <UIKit/UIKit.h>
#import "Robot.h"

@interface SecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *xTextField;
@property (weak, nonatomic) IBOutlet UITextField *yTextField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (strong, nonatomic) Robot *robot;

- (IBAction)saveButtonTapped:(id)sender;

@end
