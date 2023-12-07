//
//  Robot.h
//  ObjCFinal
//
//  Created by Иван  Балабай  on 07.12.2023.
//

// Robot.h

#ifndef Robot_h
#define Robot_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Robot : NSObject

@property (nonatomic) CGPoint coordinates;
@property (nonatomic, copy) NSString *name;

- (instancetype)initWithName:(NSString *)name;

- (void)saveToFile;
- (void)loadFromFile;

@end

#endif /* Robot_h */
