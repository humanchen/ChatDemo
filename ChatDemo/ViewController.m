//
//  ViewController.m
//  ChatDemo
//
//  Created by human on 2016/12/21.
//  Copyright © 2016年 human. All rights reserved.
//

#import "ViewController.h"
#import "MessageModel.h"
#import "messageCell.h"
#import "ToolBar.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property(nonatomic,strong)UITableView *chatTable;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)ToolBar *toolBar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadData];
    [self addChatTable];
    [self addToolBar];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}

- (void)keyboardWillChange:(NSNotification *)note
{
    NSLog(@"%@", note.userInfo);
    NSDictionary *userInfo = note.userInfo;
    CGFloat duration = [userInfo[@"UIKeyboardAnimationDurationUserInfoKey"] doubleValue];
    
    CGRect keyFrame = [userInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    CGFloat moveY = keyFrame.origin.y - self.view.frame.size.height;
 
    [UIView animateWithDuration:duration animations:^{
        _toolBar.transform = CGAffineTransformMakeTranslation(0, moveY);
    }];
    
    if(moveY<0){
        _chatTable.frame=CGRectMake(0, 0, kScreenWidth, kScreenHeight-kToolBarH-keyFrame.size.height);
        if (_dataArr.count>0)
        {
            NSIndexPath *index=[NSIndexPath indexPathForItem:_dataArr.count-1 inSection:0];
            [_chatTable scrollToRowAtIndexPath:index atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
        }
        
    }else{
        _chatTable.frame= CGRectMake(0, 0, kScreenWidth,kScreenHeight - kToolBarH);
    }
}


- (void)loadData
{
    _dataArr =[NSMutableArray array];
    NSURL *dataUrl = [[NSBundle mainBundle] URLForResource:@"messages.plist" withExtension:nil];
    NSArray *dataArray = [NSArray arrayWithContentsOfURL:dataUrl];
    for (NSDictionary *dict in dataArray) {
        MessageModel *message = [MessageModel messageModelWithDict:dict];
        MessageModel *  messagelast=_dataArr.lastObject;
        if([messagelast.time isEqualToString:message.time]){
            message.time=nil;
        }
        [_dataArr addObject:message];

    }
}


- (void)addChatTable{
    
    self.view.backgroundColor = [UIColor colorWithRed:235.0/255 green:235.0/255 blue:235.0/255 alpha:1.0];
    UITableView *chatView = [[UITableView alloc] init];
    chatView.frame = CGRectMake(0, 0, kScreenWidth,kScreenHeight - kToolBarH);
    chatView.backgroundColor = [UIColor colorWithRed:235.0/255 green:235.0/255 blue:235.0/255 alpha:1.0];
    chatView.delegate = self;
    chatView.dataSource = self;
    chatView.separatorStyle = UITableViewCellSeparatorStyleNone;
    chatView.allowsSelection = NO;
    [chatView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endEdit)]];
    _chatTable = chatView;
    
    [self.view addSubview:chatView];
}

- (void)endEdit{
    [self.view endEditing:YES];
}

- (void)addToolBar{
    
    _toolBar=[[ToolBar alloc]initWithFrame:CGRectMake(0, kScreenHeight-kToolBarH, kScreenWidth, kToolBarH)];
    _toolBar.textField.delegate=self;
    [self.view addSubview:_toolBar];
}

#pragma mark - tableView的数据源和代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}


- (messageCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    messageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[messageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.messageModel=_dataArr[indexPath.row];

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageModel *cellModel = _dataArr[indexPath.row];
    return cellModel.cellHeight;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
