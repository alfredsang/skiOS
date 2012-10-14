//
//  ECategory.h
//  ex
//
//  Created by sang alfred on 9/22/12.
//
//

#import <Foundation/Foundation.h>

@interface ECategoryBase : NSObject
    @property(nonatomic,retain,readwrite) NSString *cid;
    @property(nonatomic,retain,readwrite) NSString *name;
@end

@interface ECategory : ECategoryBase
@property(nonatomic,assign,readwrite) BOOL opened;
@property(nonatomic,retain,readwrite) NSString *count;
@property(nonatomic,retain,readwrite) NSArray *subs;

@end
