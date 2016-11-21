//
//  ViewController.m
//  关联
//
//  Created by HYG_IOS on 2016/11/21.
//  Copyright © 2016年 magic. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@property(nonatomic,strong)NSMutableArray * dataArr;

@end

static char dataKey;
@implementation ViewController

- (NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray arrayWithObjects:@"one",@"two",@"three",nil];
    }return _dataArr;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // 设置关联
    [self setAssociatedObject];
    
    // 取出关联
    [self getAssociatedObject];
    
    // 销毁
    [self removeAssociatedObject];
}

- (void)setAssociatedObject
{
    objc_setAssociatedObject(self.dataArr, &dataKey, @"four", OBJC_ASSOCIATION_COPY);
}

- (void)getAssociatedObject
{
    NSString * str = objc_getAssociatedObject(self.dataArr, &dataKey);
    ZGLog(@"%@",str);
}

- (void)removeAssociatedObject
{
#if DEBUG
    objc_setAssociatedObject(self.dataArr, &dataKey, nil, OBJC_ASSOCIATION_ASSIGN);
    
#else
    objc_removeAssociatedObjects(self.dataArr);
    
#endif
    ZGLog(@"");
}
@end
