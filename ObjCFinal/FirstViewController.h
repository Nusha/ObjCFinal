//
//  FirstViewController.h
//  ObjCFinal
//
//  Created by Иван  Балабай  on 07.12.2023.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

- (IBAction)saveButtonTapped:(id)sender;

@end

NS_ASSUME_NONNULL_END
