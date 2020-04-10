#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    if (recursion([NSNumber numberWithLongLong:[number longLongValue]*[number longLongValue]],
              number,
              result,
              number) == TRUE) {
        result = [[[result reverseObjectEnumerator] allObjects] mutableCopy];
        return result;
    };
    return nil;
}

bool recursion(NSNumber* value,
               NSNumber* previous,
               NSMutableArray<NSNumber*>* result,
               NSNumber* start) {
    if([previous longLongValue] == 1 && [value longLongValue] != 0) return FALSE;
    if([value longLongValue] == 0) return TRUE;
    long long maximumSquare = sqrt([value longLongValue]);
    if(maximumSquare*maximumSquare == [value longLongValue]
       && [previous longLongValue] == [start longLongValue]) maximumSquare--;
    for(long long i = maximumSquare; i >= 1; i--)
    {
        if(i < [previous longLongValue])
        {
            [result addObject:[NSNumber numberWithLongLong:i]];
            if(recursion([NSNumber numberWithLongLong:[value longLongValue] - i * i],
                         [NSNumber numberWithLongLong:i],
                         result,
                         start) == TRUE) return TRUE;
            [result removeLastObject];
        }
    }
    return FALSE;
}
@end
