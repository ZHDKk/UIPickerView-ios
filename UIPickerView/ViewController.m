//
//  ViewController.m
//  UIPickerView
//
//  Created by zh dk on 2017/8/28.
//  Copyright © 2017年 zh dk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //创建选择视图对象;显示多组数据和多个元素以供选择
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    
    pickerView.frame = CGRectMake(10, 100, 300, 200);
    //设置普通代理对象为当前的视图控制器
    pickerView.delegate = self;
    //设置数据代理对象为当前视图控制器
    pickerView.dataSource = self;
    [self.view addSubview:pickerView];
    
}

//实现获取组数的协议函数;返回值为选择视图的组数，整数类型
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

//实现每组元素的个数
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    return 10;
}

//显示每个元素的内容   component:组数    row:行数
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *str=[NSString stringWithFormat:@"%ld组%ld行",component+1,row+1];
    return str;
}

//设置每行元素的高度
-(CGFloat) pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 80;
}

//可以将自定义的视图显示到屏幕上
-(UIView*) pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",(row)%11+1]];
    UIImageView *iView = [[UIImageView alloc] initWithImage:image];
    iView.frame = CGRectMake(0, 0, 80, 80);
    return iView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
