//
//  AnswerHistoryCache.m
//  ex
//
//  Created by minglq on 12-8-14.
//
//

#import "AnswerHistoryCache.h"

#define Answer_History_Cache_Key @"Answer_History_Cache_Key"

@implementation AnswerHistoryCache
@synthesize max;

- (id)init{
    if (self = [super init]) {
            
        if ([[NSUserDefaults standardUserDefaults] objectForKey:Answer_History_Cache_Key]) {
            [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:Answer_History_Cache_Key];
        }
        
        //int key = [[NSUserDefaults standardUserDefaults] integerForKey:Answer_History_Cache_Key];
        _cache = [[NSMutableDictionary alloc] init];
    }
    return self;
}

 
/**
 * 增加题号和答案
 */
- (void)add:(NSString *)tNumber andAnswer:(NSString *)anwser{
    if ([tNumber intValue] <= max) {
        [_cache setObject:anwser forKey:tNumber];
    }
    
    NSEnumerator *e = [_cache keyEnumerator];
    id object;
    while (object = [e nextObject]) {
        //NSLog(@"键值为：%@",object);
        
        id objectValue = [_cache objectForKey:object];
        if(objectValue != nil)
        {
            NSLog(@"----%@所对应的value是 %@",object,objectValue);
        }
    }
    
}

/**
 * 清空
 */
- (void)clean{

}

/**
 * 归档
 */
- (void)archive{

}

- (NSDictionary *)getCache{
    return _cache;
}

/**
 * 判断试题是否答过。如果答过返回true
 */
- (BOOL)ifTidExist:(int)tid{
    NSString *ckey = [NSString stringWithFormat:@"%d",tid];
    return [[_cache allKeys] containsObject:ckey];
}


- (void)dealloc{
    [_cache removeAllObjects];
    [_cache release];
    [super dealloc];
}

@end
