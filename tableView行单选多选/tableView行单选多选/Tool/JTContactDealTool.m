//  Created by summerxx on 2019/3/17.
//  Copyright © 2019年 yaya. All rights reserved.
//

#import "JTContactDealTool.h"

@implementation JTContactDealTool
/// 汉字转拼音
+ (NSString *)transform:(NSString *)chinese
{
    if(!chinese){
        return nil;
    }
    NSMutableString *pinyin = [chinese mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    return [pinyin uppercaseString];
}
/// 拿到第一个字母并排序
+ (NSString *)getFirstUpperLetter:(NSString *)chinese {
    NSString *pinyin = [self transform:chinese];
    NSString *firstUpperLetter = [[pinyin substringToIndex:1] uppercaseString];
    if ([firstUpperLetter compare:@"A"] != NSOrderedAscending &&
        [firstUpperLetter compare:@"Z"] != NSOrderedDescending) {
        return firstUpperLetter;
    } else {
        return @"#";
    }
}

+ (NSMutableDictionary *)sortArrayWithPinYin:(NSArray *)list{
    
    NSMutableArray *contentArray = [NSMutableArray array];
    for (int i = 0; i < 26; i++) {
        
        [contentArray addObject:[NSMutableArray array]];
    }
    NSArray *keys = @[
                      @"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N",
                      @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", @"#"
                      ];
    NSMutableArray *tempArray = [NSMutableArray array];
    
    for (id user in list) {
        
        NSString *firstLetter;
        firstLetter = [self getFirstUpperLetter:(NSString *)user];
        int asciiIndex = [firstLetter characterAtIndex:0];
        int index = asciiIndex - [@"A" characterAtIndex:0];
        char c = [firstLetter characterAtIndex:0];
        if (isalpha(c) == 0) {
            [tempArray addObject:user];
        }else{
            NSMutableArray *indexArray = [contentArray objectAtIndex:index];
            [indexArray addObject:user];
        }
    }
    
    NSMutableDictionary *infoDic = [NSMutableDictionary dictionary];
    for(int i = 0; i < contentArray.count; i++){
        NSMutableArray *itemArray = [contentArray objectAtIndex:i];
        if(itemArray.count > 0){
            
            if (![itemArray count])
                continue;
            [infoDic setObject:itemArray forKey:keys[i]];
        }
    }
    if ([tempArray count]) [infoDic setObject:tempArray forKey:@"#"];
    
    NSArray *key = [[infoDic allKeys] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    NSMutableArray *allKeys = [[NSMutableArray alloc] initWithArray:key];
    NSMutableDictionary *resultDic = [NSMutableDictionary new];
    [resultDic setObject:infoDic forKey:@"infoDic"];
    [resultDic setObject:allKeys forKey:@"allKeys"];
    return resultDic;
}
@end
