#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    NSMutableArray<NSNumber*> *arrayCopy = [[NSMutableArray alloc] init];
    int result = 1;
    
    // deleting everything except numbers
    for (int i = 0; i < [array count]; i++)
        if ([array[i] isKindOfClass:[NSNumber class]])
            [arrayCopy addObject:array[i]];
    
    // If array doesn't have numbers
    if ([arrayCopy count] == 0)
        return 0;
    
    // if N > arrayCopy count
    if (numberOfItems >= [arrayCopy count]) {
        for (int i = 0; i < [arrayCopy count]; i++)
            result *= [arrayCopy[i] intValue];
        return result;
    }
    // sort (absolute values)
    for (int i = 0; i < [arrayCopy count]; i++)
        for (int j = 0; j < [arrayCopy count]-i-1; j++)
            if (abs([arrayCopy[j] intValue])>abs([arrayCopy[j+1] intValue])) {
                NSNumber *temp = arrayCopy[j];
                [arrayCopy replaceObjectAtIndex:j withObject:arrayCopy[j+1]];
                [arrayCopy replaceObjectAtIndex:j+1 withObject:temp];
            }
    
    // product of N largest values (absolute)
    for (unsigned long i = [arrayCopy count]-1; i > [arrayCopy count]-numberOfItems-1; i--)
        result *= [arrayCopy[i] intValue];
    
    if (result > 0) return result;
    else {
        for (unsigned long i = [arrayCopy count]-numberOfItems; i < [arrayCopy count]; i++)
            if ([arrayCopy[i] intValue] < 0) {
                result /= [arrayCopy[i] intValue];
                BOOL isPositiveNumberFound = false;
                for (unsigned long j = [arrayCopy count]-numberOfItems-1; j >= 0; j--) {
                    if ([arrayCopy[j] intValue] > 0) {
                        result *= [arrayCopy[j] intValue];
                        isPositiveNumberFound = true;
                        break;
                    }
                }
                if (isPositiveNumberFound) return result;
                else return [arrayCopy[0] intValue]*result;
            }
        return result;
    }
}


@end
