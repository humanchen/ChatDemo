//
//  messageCell.m
//  ChatDemo
//
//  Created by human on 2016/12/21.
//  Copyright © 2016年 human. All rights reserved.
//

#import "messageCell.h"
#import "UIImage+ResizeImage.h"
#define textPadding 15
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
        [textView setBackgroundImage:[UIImage resizeImage:@"chat_recive_nor"]  forState:UIControlStateNormal];
        [textView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        textView.contentEdgeInsets = UIEdgeInsetsMake(textPadding, textPadding, textPadding, textPadding);
        [self.contentView addSubview:textView];
    }
    return self;
}

-(void)setMessageModel:(MessageModel *)messageModel{
    CGFloat offsetY=0;
    if(messageModel.time){
        timeLabel.frame=CGRectMake(0, 0, self.frame.size.width, 10);
        offsetY+=10;
    }
    iconView.frame=CGRectMake(5, offsetY, 20, 20);

    [textView setTitle:messageModel.text forState:UIControlStateNormal];
    float labelHeight=[self getHeightByWidth:200 title:messageModel.text font:[UIFont systemFontOfSize:15]];
    textView.frame=CGRectMake(25, offsetY, 200+2*textPadding, labelHeight+2*textPadding);
    
    
    
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


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
