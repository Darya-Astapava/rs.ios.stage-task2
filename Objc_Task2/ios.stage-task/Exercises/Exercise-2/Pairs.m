#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    NSInteger count = 0;
    
    for (NSNumber *a in array){
        for (NSNumber *b in array){
            int result = ([a intValue] - [b intValue]);
            if ([[NSNumber numberWithInt:result] isEqualToNumber:number]) {
                count += 1;
            }
        }
        
    }
    
    return count;
}

@end
