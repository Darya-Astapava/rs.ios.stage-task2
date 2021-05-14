#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    NSString *result = @"";
    NSMutableString *string = [NSMutableString new];
    NSMutableArray *array = [NSMutableArray new];
    
    if (numbersArray != nil && numbersArray.count > 0) {
        for (NSNumber *i in numbersArray) {
            if ([i intValue] > 0) {
                if ([i intValue] < 255 && array.count <= 7) {
                    [array addObject:[i stringValue]];
                } else {
                    result = @"The numbers in the input array can be in the range from 0 to 255.";
                }
            } else {
                [array removeAllObjects];
                result = @"Negative numbers are not valid for input.";
            }
        }
        
        if ([result isEqualToString:@""]) {
            while (array.count < 4) {
                [array addObject:@"0"];
            }
            
            while (array.count > 4) {
                [array removeLastObject];
            }
            
            result = [array componentsJoinedByString:@"."];
        }
    }
    
    return result;
}

@end
