#import "MessageModel.h"
#import "NSString+Extension.h"
#import "UIImage+ResizeImage.h"

@implementation MessageModel

+ (id)messageModelWithDict:(NSDictionary *)dict
{
    MessageModel *message = [[self alloc] init];
    message.text = dict[@"text"];
    message.time = dict[@"time"];
    message.type = [dict[@"type"] intValue];
    message.showTime=YES;
    message.useType=kMessageText;
    return message;
}

-(CGFloat)cellHeight{
    if(!_cellHeight){
        //文字信息
        if(self.useType==kMessageText){
        float offsetY=0;
        if(self.showTime!=NO)
            offsetY+=20+5;
        CGSize truesize = self.truesize;
        float labelHeight=truesize.height;
        offsetY+=labelHeight;
        offsetY+=30;
        _cellHeight=offsetY;
        }
        //图片信息
        if(self.useType==kMessagePic){
            float offsetY=0;
            if(self.showTime!=NO)
                offsetY+=20+5;
            CGSize picSize = [self.image getWantSize];
            offsetY+=picSize.height;
            _cellHeight=offsetY;
        }
    }
    return _cellHeight;
}

-(CGSize)truesize{
    if(CGSizeEqualToSize(_truesize, CGSizeZero)){
        _truesize=[self.text sizeWithFont:[UIFont systemFontOfSize:15] maxSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width-2*textPadding-30-50, MAXFLOAT)];
    }
    return _truesize;
}
@end
