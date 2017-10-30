//
//  ViewController.m
//  RongCloudDemo
//
//  Created by 刘圣洁 on 16/11/9.
//  Copyright © 2016年 LSJ. All rights reserved.
//

#import "ViewController.h"
#import "ChatListViewController.h"
#import "ChatViewController.h"

@interface ViewController ()<RCIMUserInfoDataSource,RCIMGroupInfoDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [self addBtn];
}

- (void)addBtn {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 200, 45);
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor blackColor]];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn addTarget:self action:@selector(jump:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)jump:(UIButton *)btn {
    
    [[RCIM sharedRCIM] setUserInfoDataSource:self];
    [[RCIM sharedRCIM] setGroupInfoDataSource:self];
    [[RCIM sharedRCIM] connectWithToken:@"vOwOL+QpTDgwYPhc8RIvS6+Il+PR2HnJqzkVlTz0vkJHK8E2jvREWTMhSI6qQpwjzHzDhmNI0ykVjB8ScoEilQ==" success:^(NSString *userId) {
        NSLog(@"登陆成功，当前登录的用户ID：%@",userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"错误状态：%ld",(long)status);
    } tokenIncorrect:^{
        
    }];

    
    ChatListViewController *chatListVC = [[ChatListViewController alloc] init];
    [self.navigationController pushViewController:chatListVC animated:YES];
}


- (void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo *))completion {
    
    if ([@"lsj" isEqual:userId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.name = @"刘圣洁";
        user.portraitUri = @"http://g.hiphotos.baidu.com/image/pic/item/94cad1c8a786c91709202506ca3d70cf3bc757e9.jpg";
        return completion(user);
    }else if ([@"hbx" isEqual:userId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.name = @"黄保晓";
        user.portraitUri = @"http://pic.nipic.com/2008-01-17/20081179523741_2.jpg";
        return completion(user);
    }else{
        NSLog(@"无此用户");
    }
}

- (void)getGroupInfoWithGroupId:(NSString *)groupId completion:(void (^)(RCGroup *))completion {
    
}
@end
