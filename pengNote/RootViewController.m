//
//  RootViewController.m
//  pengNote
//
//  Created by lining on 2017/12/30.
//  Copyright © 2017年 biubiublue. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()<UITextViewDelegate>
@property(nonatomic,strong) UILabel *titleLabel;

@property(nonatomic,strong) UITextView *textEdit;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _titleLabel = [[UILabel alloc]init];
    CGFloat x,y,w,h;
    
    x = 0;
    y = 30;
    w = [UIScreen mainScreen].bounds.size.width;
    h = 30;
    _titleLabel.frame = (CGRect){x,y,w,h};
    _titleLabel.text = @"pengNote";
    _titleLabel.font = [UIFont systemFontOfSize:18];
    _titleLabel.textColor = [UIColor redColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:_titleLabel];
    
    _textEdit = [[UITextView alloc]init];
    x = CGRectGetMinX(_titleLabel.frame);
    y = CGRectGetMaxY(_titleLabel.frame)+5;
    w = [UIScreen mainScreen].bounds.size.width;
    h = [UIScreen mainScreen].bounds.size.height-CGRectGetMaxY(_titleLabel.frame)-5;
    
    _textEdit.frame = (CGRect){x,y,w,h};
    
    _textEdit.delegate = self;
    _textEdit.backgroundColor = [UIColor yellowColor];
    _textEdit.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:_textEdit];
    //获得焦点
    [_textEdit becomeFirstResponder];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder]; return NO;
    }
    return YES;
}
@end
