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
    //    [self.robot loadFromFile]; //пока уберем мы не знаем по какому имени грузить
    NSString *savedPointString = [[NSUserDefaults standardUserDefaults] stringForKey:@"savedPoint"];
    NSString *savedRobotName = [[NSUserDefaults standardUserDefaults] stringForKey:@"savedRobotName"];
    self.robot.coordinates = CGPointFromString(savedPointString);
    self.robot.name = savedRobotName;
    self.textView.text = NSStringFromCGPoint(self.robot.coordinates);
    self.nameTextView.text = self.robot.name; // added
}

// Здесь будем сохранять в UserDefaults
- (IBAction)saveButtonTapped:(id)sender {
    CGFloat x = [self.xTextField.text floatValue];
    CGFloat y = [self.yTextField.text floatValue];
    NSString *name = self.nameTextField.text;
    self.robot.coordinates = CGPointMake(x, y);
    self.robot.name = name;
    NSString *pointString = NSStringFromCGPoint(self.robot.coordinates);
    [[NSUserDefaults standardUserDefaults] setObject:pointString forKey:@"savedPoint"];
    [[NSUserDefaults standardUserDefaults] setObject:self.robot.name forKey:@"savedRobotName"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    self.textView.text = NSStringFromCGPoint(self.robot.coordinates);
    self.nameTextView.text = self.robot.name;
}

// Сохраняем в файл с именем робота
- (IBAction)saveToFileButtonTapped:(id)sender {
    NSString *name = [self.nameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    CGFloat x = [self.xTextField.text floatValue];
    CGFloat y = [self.yTextField.text floatValue];        NSLog(@"Name in text field: %@", name);
    self.robot.name = name; // пишем в файл под именем робота
    self.robot.coordinates = CGPointMake(x, y);
    [self.robot saveToFile];
} // connect button

//Грузим сохраненное состояние робота по введенному имени / можно было бы еще добавить проверку/ есть
// ли такой робот среди сохраненныхю
- (IBAction)loadFromFileButtonTapped:(id)sender {
    self.robot.name = self.nameTextField.text; // необходимо ввести имя робота для загрузки его координат
    [self.robot loadFromFile];
    self.textView.text = NSStringFromCGPoint(self.robot.coordinates);
    self.nameTextView.text = self.robot.name;
} // connect button

- (IBAction)goToFirstViewController:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
