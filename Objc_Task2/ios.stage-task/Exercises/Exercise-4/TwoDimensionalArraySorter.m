#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    NSMutableArray *resultArray = [NSMutableArray new];
    NSMutableArray *stringArray = [NSMutableArray new];
    NSMutableArray *numberArray = [NSMutableArray new];
    
    BOOL flagNumber = false;
    BOOL flagString = false;
    BOOL resultFlag = false;
    
    for (id a in array) {
        if ([a isKindOfClass:[NSArray class]]) {
            for (id item in a) {
                if ([item isKindOfClass: [NSNumber class]]) {
                    [numberArray addObject:item];
                    flagNumber = true;
                } else if ([item isKindOfClass: [NSString class]]) {
                    [stringArray addObject:item];
                    flagString = true;
                }
                if (flagNumber == true && flagString == true) {
                    resultFlag = true;
                }
            }
            flagNumber = false;
            flagString = false;
        }
    }
    
    // Sort
    [numberArray sortUsingSelector:@selector(compare:)];
    [stringArray sortUsingSelector:@selector(compare:)];
    
    if (numberArray.count > 0 && stringArray.count > 0) {
        [resultArray addObject:numberArray];
        [resultArray addObject:stringArray];
    } else if (stringArray.count > 0) {
        resultArray = stringArray;
    } else if (numberArray.count > 0) {
        resultArray = numberArray;
    }
    
    if (resultFlag == true) {
        [resultArray removeAllObjects];
    }
    
    NSArray *result = [resultArray copy];
    return result;
}

@end
