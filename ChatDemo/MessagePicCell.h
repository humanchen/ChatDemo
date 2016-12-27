//
//  MessagePicCell.h
//  ChatDemo
//
//  Created by 陈思宇 on 16/12/27.
//  Copyright © 2016年 human. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"
@interface MessagePicCell : UITableViewCell
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UIImageView *iconView;
@property(nonatomic,strong)UIImageView *picView;
@property(nonatomic,strong)MessageModel *messageModel;

@end
