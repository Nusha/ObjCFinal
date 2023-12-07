//
//  Robot.m
//  ObjCFinal
//
//  Created by Иван  Балабай  on 07.12.2023.
//

// Robot.m

#import "Robot.h"

@implementation Robot

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = [name copy];
    }
    return self;
}

- (void)saveToFile {
    NSString *fileName = [self.name stringByAppendingString:@".txt"];
    NSString *filePath = [self filePathForFileName:fileName];
    NSDictionary *robotInfo = @{
        @"coordinates": NSStringFromCGPoint(self.coordinates),
    };
    

    [robotInfo writeToFile:filePath atomically:YES];
}

- (void)loadFromFile {
    NSString *fileName = [self.name stringByAppendingString:@".txt"];
    NSString *filePath = [self filePathForFileName:fileName];
    

    NSDictionary *robotInfo = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    if (robotInfo) {

        NSString *coordinatesString = robotInfo[@"coordinates"];
        self.coordinates = CGPointFromString(coordinatesString);

    }
}

- (NSString *)filePathForFileName:(NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    

    return [documentsDirectory stringByAppendingPathComponent:fileName];
}

@end
