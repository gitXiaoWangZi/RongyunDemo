//
//  ChatListViewController.m
//  RongCloudDemo
//
//  Created by 刘圣洁 on 16/11/9.
//  Copyright © 2016年 LSJ. All rights reserved.
//

#import "ChatListViewController.h"
#import "ChatViewController.h"

@interface ChatListViewController ()

@end

@implementation ChatListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置需要显示哪些类型的会话
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),
                                        @(ConversationType_DISCUSSION),
                                        @(ConversationType_CHATROOM),
                                        @(ConversationType_GROUP),
                                        @(ConversationType_APPSERVICE),
                                        @(ConversationType_SYSTEM)]];
    
    //设置需要将哪些类型的会话在会话列表中聚合显示
    [self setCollectionConversationType:@[@(ConversationType_DISCUSSION),
                                          @(ConversationType_GROUP)]];
    self.conversationListTableView.tableFooterView = [UIView new];
    
    [RCIM sharedRCIM].globalMessageAvatarStyle = RC_USER_AVATAR_CYCLE;
    [RCIM sharedRCIM].globalConversationPortraitSize = CGSizeMake(40, 40);
    
    self.topCellBackgroundColor = [UIColor blackColor];
    self.isShowNetworkIndicatorView = YES;
    self.showConnectingStatusOnNavigatorBar = YES;
}


- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath {
//    
//        ChatViewController *chatVC = [[ChatViewController alloc] init];
//        chatVC.conversationType = ConversationType_PRIVATE;
//        chatVC.targetId = model.targetId;
//        chatVC.title = @"天啊";
//        [self.navigationController pushViewController:chatVC animated:YES];
    
    ChatViewController *chatVC = [[ChatViewController alloc] initWithConversationType:ConversationType_PRIVATE targetId:@"hbx"];
    [self.navigationController pushViewController:chatVC animated:YES];

}


//点击头像事件
- (void)didTapCellPortrait:(RCConversationModel *)model {
    NSLog(@"点击头像了");
}

//长按头像
- (void)didLongPressCellPortrait:(RCConversationModel *)model{
    NSLog(@"松手吧");
}
@end
