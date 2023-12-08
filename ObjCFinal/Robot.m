//
//  Robot.m
//  ObjCFinal
//
//  Created by Иван  Балабай  on 07.12.2023.
//

// Robot.m

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

- (NSString *)filePathForFileName:(NSString *)fileName {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    NSString *applicationSupportDirectory = [paths firstObject];
    NSString *appSupportSubdirectory = [applicationSupportDirectory stringByAppendingPathComponent:@"ObjCFinal"];
    NSError *createDirectoryError;
    if (![fileManager fileExistsAtPath:appSupportSubdirectory]) {
        [fileManager createDirectoryAtPath:appSupportSubdirectory withIntermediateDirectories:YES attributes:nil error:&createDirectoryError];
        if (createDirectoryError) {
            NSLog(@"Ошибка при создании директории: %@", createDirectoryError.localizedDescription);
            return nil;
        }
    }
    return [appSupportSubdirectory stringByAppendingPathComponent:fileName];
}

- (void)saveToFile {
    NSString *fileName = [self.name stringByAppendingString:@".txt"];
    NSString *filePath = [self filePathForFileName:fileName];
    if (!self.name || [self.name isEqualToString:@""]) {
        NSLog(@"Предупреждение: Имя робота отсутствует или пусто.");
        return;
    }
    if (CGPointEqualToPoint(self.coordinates, CGPointZero)) {
        NSLog(@"Предупреждение: Координаты робота равны CGPointZero.");
        return;
    }
    NSDictionary *robotInfo = @{
        @"coordinates": NSStringFromCGPoint(self.coordinates),
        @"name": self.name
    };
    NSError *writeError;
    BOOL success = [robotInfo writeToFile:filePath atomically:YES];
    if (!success) {
        NSLog(@"Ошибка при сохранении файла: %@", writeError.localizedDescription);
    }
}

- (void)loadFromFile {
    NSString *fileName = [self.name stringByAppendingString:@".txt"];
    NSString *filePath = [self filePathForFileName:fileName];
    
    NSLog(@"Attempting to load from file at path: %@", filePath);
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:filePath]) {
        NSLog(@"Error: File does not exist at path %@", filePath);
        return;
    }
    
    NSError *readError;
    NSDictionary *robotInfo = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    if (!robotInfo) {
        NSLog(@"Error loading file: %@", readError.localizedDescription);
        return;
    }
    
    NSString *coordinatesString = robotInfo[@"coordinates"];
    if (coordinatesString) {
        self.coordinates = CGPointFromString(coordinatesString);
    } else {
        NSLog(@"Error: Couldn't get coordinates from file.");
    }
    
    NSString *name = robotInfo[@"name"];
    if (name) {
        self.name = name;
    } else {
        NSLog(@"Error: Couldn't get name from file.");
    }
}



@end
