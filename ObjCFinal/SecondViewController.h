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
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextView *nameTextView;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *saveToFileButton;
@property (weak, nonatomic) IBOutlet UIButton *loadFromFileButton;
@property (strong, nonatomic) Robot *robot;

- (IBAction)saveButtonTapped:(id)sender;
- (IBAction)saveToFileButtonTapped:(id)sender;
- (IBAction)loadFromFileButtonTapped:(id)sender;

@end
