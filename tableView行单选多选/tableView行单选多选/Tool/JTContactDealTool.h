
//
//  Created by summmerxx on 2019/3/17.
//  Copyright © 2019年 yaya. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JTContactDealTool : NSObject
+ (NSString *)transform:(NSString *)chinese;
+ (NSMutableDictionary *)sortArrayWithPinYin:(NSArray *)list;
@end

NS_ASSUME_NONNULL_END
