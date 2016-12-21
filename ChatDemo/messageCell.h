//
//  messageCell.h
//  ChatDemo
//
//  Created by human on 2016/12/21.
//  Copyright © 2016年 human. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"
@interface messageCell : UITableViewCell
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UIImageView *iconView;
@property(nonatomic,strong)UIButton *textView;
@property(nonatomic,strong)MessageModel *messageModel;
@end
