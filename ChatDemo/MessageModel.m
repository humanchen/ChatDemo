#import "MessageModel.h"

@implementation MessageModel

+ (id)messageModelWithDict:(NSDictionary *)dict
{
    MessageModel *message = [[self alloc] init];
    message.text = dict[@"text"];
    message.time = dict[@"time"];
    message.type = [dict[@"type"] intValue];
   
    return message;
}

-(CGFloat)cellHeight{
    if(!_cellHeight){
        float offsetY=0;
        if(self.time)
            offsetY+=10;
        float labelHeight=[self getHeightByWidth:200 title:self.text font:[UIFont systemFontOfSize:15]];
        offsetY+=labelHeight;
        offsetY+=30;
        _cellHeight=offsetY;
    }
    return _cellHeight;
}


- (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font
{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = title;
    label.font = font;
    label.numberOfLines = 0;
    [label sizeToFit];
    CGFloat height = label.frame.size.height;
    return height;
}
@end
