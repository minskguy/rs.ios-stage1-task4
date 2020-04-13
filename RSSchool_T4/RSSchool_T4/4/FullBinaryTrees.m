#import "FullBinaryTrees.h"

NSMutableArray <NSMutableArray*>* dfs(NSInteger n, NSInteger ind, NSInteger all) {
    
    if(n == 0) {
        NSMutableArray *v = [[NSMutableArray alloc] init];
        for(int i = 1; i <= all; i++) {
            if(i != ind) [v addObject: @0];
            else [v addObject: @1];
        }
        NSMutableArray <NSMutableArray*>* vv = [[NSMutableArray alloc] init];
        [vv addObject: v];
        return vv;
    }
    
    NSMutableArray <NSMutableArray*>* res = [[NSMutableArray alloc] init];
    for(int i = 1; i <= n; i += 2) {
        NSInteger left_size = i - 1;
        NSInteger right_size = n - i - 1;
        NSMutableArray <NSMutableArray*>* left = dfs(left_size, 2 * ind, all);
        NSMutableArray <NSMutableArray*>* right = dfs(right_size, 2 * ind + 1, all);
        for(int x = 0; x < [left count]; x++) {
            for(int y = 0; y < [right count]; y++) {
                NSMutableArray* xy = [[NSMutableArray alloc] init];
                for(int z = 0; z < [left[x] count]; z++) {
                    if([left[x][z] intValue] || [right[y][z] intValue]) [xy addObject: @1];
                    else [xy addObject: @0];
                }
                [res addObject: xy];
            }
        }
    }
    for(int i = 0; i < [res count]; i++) {
        res[i][ind - 1] = @1;
    }
    return res;
}

@implementation FullBinaryTrees
- (NSString *)stringForNodeCount:(NSInteger)count {
    NSMutableString *result = [NSMutableString stringWithString:@"[]"];
    if(count % 2 == 0) return @"[]";

    int x = 1;
    while(x < count) x <<= 1;
    x <<= 1;
    NSMutableArray <NSMutableArray*>* ans = dfs(count - 1, 1, x);
    for(int i = 0; i < [ans count]; i++)
    {
        NSMutableArray* used = [NSMutableArray arrayWithCapacity:[ans[i] count]];
        for(int j = 0; j < [ans[i] count]; j++) used[j] = @0;
        
        for(int j = 0; j < [ans[i] count]; j++) {
            if([ans[i][j] intValue] == 0) {
                int left = (j + 1) * 2;
                int right = (j + 1) * 2 + 1;
                if(left <= [ans[i] count]) {
                    if([ans[i][left - 1] intValue] == 0) used[left - 1] = @1;
                }
                if(right <= [ans[i] count]) {
                    if([ans[i][right - 1] intValue] == 0) used[right - 1] = @1;
                }
            }
        }
        NSMutableArray* vv = [[NSMutableArray alloc] init];
        for(int j = 0; j < [ans[i] count]; j++) {
            if (![used[j] intValue]) [vv addObject: ans[i][j]];
        }
        ans[i] = vv;
        while([[ans[i] lastObject] intValue] == 0) [ans[i] removeLastObject];
        NSMutableString *temp = [NSMutableString stringWithString:@"["];
        for(int j = 0; j < [ans[i] count]; j++)
        {
            if ([ans[i][j] intValue]) {
                if (j != [ans[i] count]-1) [temp appendString:@"0,"];
                else [temp appendString:@"0"];
            }
            else {
                if (j != [ans[i] count]-1) [temp appendString:@"null,"];
                else [temp appendString:@"null"];
            }
        }
        [temp appendString:@"]"];
        [result insertString:temp atIndex:[result length]-1];
    }
    return result;
}
@end
