#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    NSMutableArray *binArray = [NSMutableArray new];
    
    while (n > 0) {
        NSNumber *x = [NSNumber numberWithInt:n % 2];
        [binArray addObject:x];
        n = n / 2;
    }
    
    while (binArray.count < 8) {
        [binArray addObject: @0];
    }
    
    NSArray *reversedArray = [[binArray reverseObjectEnumerator] allObjects];
    NSMutableArray *sumArray = [NSMutableArray new];
    int power = 1;
   
    for (NSUInteger i = 0; i < 8; i++) {
        int item = [[reversedArray objectAtIndex:i] intValue];
        int multiply = item * power;
        [sumArray addObject: [NSNumber numberWithInt:multiply]];
        power *= 2;
    }
    
    int result = 0;
    
    for (NSNumber *i in sumArray) {
        result += [i intValue];
    }
    
    return result;
}
