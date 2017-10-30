//
//  ChatViewController.m
//  RongCloudDemo
//
//  Created by 刘圣洁 on 16/11/9.
//  Copyright © 2016年 LSJ. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //改变聊天背景图片
    self.conversationMessageCollectionView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"23"]];
    
    [self setDefaultInputType:RCChatSessionInputBarInputExtention];

    [self.chatSessionInputBarControl.pluginBoardView insertItemWithImage:[UIImage imageNamed:@""] title:@"滑稽" tag:3];
}

- (void)didTapCellPortrait:(NSString *)userId {
    if ([userId isEqualToString:@"lsj"]) {
        NSLog(@"1");
    }else{
        NSLog(@"2");
    }
}

- (void)didLongPressCellPortrait:(NSString *)userId {
    if ([userId isEqualToString:@"lsj"]) {
        NSLog(@"3");
    }else{
        NSLog(@"4");
    }
}

//自定义聊天界面用户图像框的样式（切圆角）
- (void)willDisplayConversationTableCell:(RCMessageBaseCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    if ([cell isKindOfClass:[RCMessageCell class]]) {
        RCMessageCell *messageCell = (RCMessageCell *)cell;
        //messageCell.portraitImageView
        UIImageView *portraitImageView= (UIImageView *)messageCell.portraitImageView;
        portraitImageView.layer.cornerRadius = 10;
    }
    
    //改变字体颜色
//        RCTextMessageCell *textCell = (RCTextMessageCell *)cell;
//        textCell.textLabel.textColor = [UIColor redColor];
//        if ([cell isMemberOfClass:RCImageMessageCell.class]) {
//            RCImageMessageCell *Image = (RCImageMessageCell *)cell;
//            Image.pictureView.layer.borderWidth = 2;
//            Image.pictureView.layer.borderColor = [UIColor redColor].CGColor;
//        }
}


-(void)pluginBoardView:(RCPluginBoardView*)pluginBoardView clickedItemWithTag:(NSInteger)tag {
    if (tag == 3) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
