//
//  MessagePicCell.m
//  ChatDemo
//
//  Created by 陈思宇 on 16/12/27.
//  Copyright © 2016年 human. All rights reserved.
//

#import "MessagePicCell.h"
#import "UIImage+ResizeImage.h"
@implementation MessagePicCell
@synthesize timeLabel,iconView,picView;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //        self.backgroundView = nil;
        self.backgroundColor = [UIColor clearColor];
        
        timeLabel = [[UILabel alloc] init];
        timeLabel.textAlignment = NSTextAlignmentCenter;
        timeLabel.textColor = [UIColor grayColor];
        timeLabel.font = [UIFont systemFontOfSize:14];
        
        [self.contentView addSubview:timeLabel];
        
        iconView = [[UIImageView alloc] init];
        iconView.image = [UIImage imageNamed:@"me"];
        [self.contentView addSubview:iconView];
        
        picView = [UIImageView new];
        [self.contentView addSubview:picView];

        
    }
    return self;
}


-(void)setMessageModel:(MessageModel *)messageModel{
    CGFloat offsetY=0;
    timeLabel.text=@"";
    if(messageModel.showTime==YES){
        timeLabel.text=messageModel.time;
        timeLabel.frame=CGRectMake(0, 0,[[UIScreen mainScreen] bounds].size.width, 20);
        offsetY+=20+5;
    }
    
    if(messageModel.type == kMessageModelTypeOther){
        //接受者
        iconView.frame=CGRectMake(5, offsetY+5, 30, 30);
        CGSize picSize = [messageModel.image getWantSize];
        picView.frame= CGRectMake(35, offsetY, picSize.width, picSize.height);
//        picView.frame=CGRectMake(35, offsetY, picSize.width, picSize.height);
        
        CAShapeLayer *layer = [CAShapeLayer layer];
        
        layer.frame = picView.bounds;
        layer.contents = (id)[UIImage imageNamed:@"chat_recive_nor"].CGImage;
        layer.contentsCenter = CGRectMake(0.5, 0.5, 0.1, 0.1);
        layer.contentsScale = [UIScreen mainScreen].scale;
        
        picView.layer.mask = layer;
        picView.layer.frame = picView.frame;
        picView.image=messageModel.image;
    
//        [picView setBackgroundImage:messageModel.image forState:UIControlStateNormal];
        
//        [textView setTitle:messageModel.text forState:UIControlStateNormal];
//        CGSize truesize = messageModel.truesize;
//        textView.frame=CGRectMake(35, offsetY, truesize.width+2*textPadding, truesize.height+2*textPadding);
//        [textView setBackgroundImage:[UIImage resizeImage:@"chat_recive_nor"]  forState:UIControlStateNormal];
        //  self.backgroundColor=[UIColor redColor];
    }else{
        //发送者
        iconView.frame=CGRectMake([[UIScreen mainScreen] bounds].size.width-30-5, offsetY+5, 30, 30);
        
        CGSize picSize = [messageModel.image getWantSize];
        picView.frame= CGRectMake (kScreenWidth-35-picSize.width, offsetY, picSize.width, picSize.height);

        
        CAShapeLayer *layer = [CAShapeLayer layer];
        
        layer.frame = picView.bounds;
        layer.contents = (id)[UIImage imageNamed:@"chat_send_nor"].CGImage;
        layer.contentsCenter = CGRectMake(0.5, 0.5, 0.1, 0.1);
        layer.contentsScale = [UIScreen mainScreen].scale;
        
        picView.layer.mask = layer;
        picView.layer.frame = picView.frame;
        picView.image=messageModel.image;
        
//        [textView setTitle:messageModel.text forState:UIControlStateNormal];
//        CGSize truesize = messageModel.truesize;
//        textView.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-35-(truesize.width+2*textPadding), offsetY, truesize.width+2*textPadding, truesize.height+2*textPadding);
//        [textView setBackgroundImage:[UIImage resizeImage:@"chat_send_nor"]  forState:UIControlStateNormal];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
