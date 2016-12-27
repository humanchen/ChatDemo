#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef enum {
    kMessageModelTypeOther,
    kMessageModelTypeMe
} MessageModelType;

@interface MessageModel : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, assign) MessageModelType type;
@property (nonatomic, assign) BOOL showTime;
@property (nonatomic,assign) CGFloat cellHeight;
@property (nonatomic,assign) CGSize truesize;//文字大小
+ (id)messageModelWithDict:(NSDictionary *)dict;

@end
