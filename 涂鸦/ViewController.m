//
//  ViewController.m
//  涂鸦
//
//  Created by Guan on 15/8/6.
//  Copyright (c) 2015年 Guan. All rights reserved.
//

#import "ViewController.h"
#import "DrawBoard.h"
#import "UIImage+MJ.h"
#import "MBProgressHUD+MJ.h"

@interface ViewController ()

- (IBAction)clearAll:(id)sender;
- (IBAction)goBack:(id)sender;

- (IBAction)save:(id)sender;

@property (weak, nonatomic) IBOutlet DrawBoard *board;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clearAll:(id)sender {
    [self.board clearAll];
}

- (IBAction)goBack:(id)sender {
    [self.board goBack];
}

- (IBAction)save:(id)sender {
    UIImage *image = [UIImage captureWithView:self.board];
    
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

-(void)image:(UIImage*)image didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo
{
    if (error) {
        [MBProgressHUD showError:@"保存失败！"];
    }else {
    [MBProgressHUD showSuccess: @"保存成功！"];
    }
}

@end
