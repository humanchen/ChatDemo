//
//  messageCell.m
//  ChatDemo
//
//  Created by human on 2016/12/21.
//  Copyright © 2016年 human. All rights reserved.
//

#import "messageCell.h"
#import "UIImage+ResizeImage.h"
#import "NSString+Extension.h"

@implementation messageCell
@synthesize timeLabel,iconView,textView;
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
        
        textView = [UIButton buttonWithType:UIButtonTypeCustom];
        textView.titleLabel.numberOfLines = 0;
        textView.titleLabel.font = [UIFont systemFontOfSize:15];
   
        [textView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        textView.contentEdgeInsets = UIEdgeInsetsMake(textPadding, textPadding, textPadding, textPadding);
        [self.contentView addSubview:textView];
    }
    return self;
}

-(void)setMessageModel:(MessageModel *)messageModel{
    CGFloat offsetY=0;
    if(messageModel.time){
        timeLabel.frame=CGRectMake(0, 0,[[UIScreen mainScreen] bounds].size.width, 20);
        offsetY+=20+5;
        timeLabel.text=messageModel.time;
    }
    if(messageModel.type == kMessageModelTypeOther){
        //接受者
    iconView.frame=CGRectMake(5, offsetY+5, 30, 30);
    [textView setTitle:messageModel.text forState:UIControlStateNormal];
    CGSize truesize = messageModel.truesize;
    textView.frame=CGRectMake(35, offsetY, truesize.width+2*textPadding, truesize.height+2*textPadding);
             [textView setBackgroundImage:[UIImage resizeImage:@"chat_recive_nor"]  forState:UIControlStateNormal];
        self.backgroundColor=[UIColor redColor];
    }else{
        //发送者
        iconView.frame=CGRectMake([[UIScreen mainScreen] bounds].size.width-30-5, offsetY+5, 30, 30);
        [textView setTitle:messageModel.text forState:UIControlStateNormal];
        CGSize truesize = messageModel.truesize;
        textView.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-35-(truesize.width+2*textPadding), offsetY, truesize.width+2*textPadding, truesize.height+2*textPadding);
             [textView setBackgroundImage:[UIImage resizeImage:@"chat_send_nor"]  forState:UIControlStateNormal];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
