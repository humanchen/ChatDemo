#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef enum {
    kMessageModelTypeOther,
    kMessageModelTypeMe
} MessageModelType;

typedef enum {
    kMessagePic,
    kMessageText
} MessageType;

@interface MessageModel : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, assign) MessageModelType type;//自己或对方
@property (nonatomic, assign) MessageType useType;//信息类型
@property (nonatomic, assign) BOOL showTime;
@property (nonatomic,assign) CGFloat cellHeight;
@property (nonatomic,assign) CGSize truesize;//文字大小
@property (nonatomic,strong) UIImage *image;//图片
+ (id)messageModelWithDict:(NSDictionary *)dict;

@end
