#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    if ([number intValue] < 0) return nil;
    NSMutableArray<NSMutableString*>* result = [[NSMutableArray alloc] init];
    for (int i = 0; i < [number length]; i++) {
        int digit = [number characterAtIndex:i] - '0';
      switch (digit) {
          case 0: {
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"8"];
              break;
              
          }
          case 1: {
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"2"];
              
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"4"];
              break;
          }
          case 2: {
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"1"];
              
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"3"];
              
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"5"];
              break;
          }
          case 3: {
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"2"];
              
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"6"];
              break;
          }
          case 4: {
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"1"];
              
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"5"];
              
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"7"];
              break;
          }
          case 5: {
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"2"];
              
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"4"];
              
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"6"];
              
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"8"];
              break;
          }
          case 6: {
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"3"];
              
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"5"];
              
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"9"];
              break;
          }
          case 7: {
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"4"];
              
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"8"];
              break;
          }
          case 8: {
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"5"];
              
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"7"];
              
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"9"];
              
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"0"];
              break;
          }
          case 9: {
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"6"];
              
              [result addObject: [NSMutableString stringWithString:number]];
              [[result objectAtIndex:[result count]-1] replaceCharactersInRange:NSMakeRange(i, 1) withString:@"8"];
              break;
          }
        }
    }
    
    return result;
}
@end
