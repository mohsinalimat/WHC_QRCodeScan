//
//  ViewController.m
//  WHC_QRCodeScanKit(OC)
//
//  Created by 吴海超 on 15/12/29.
//  Copyright © 2015年 吴海超. All rights reserved.
//

#import "ViewController.h"
#import "WHC_QRCodeVC.h"
#import "QRCodeWebVC.h"
#import "MyQRCodeVC.h"
@interface ViewController () <WHC_QRCodeVCDelegate>

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

/// 开始扫描二维码
- (IBAction)clickStart:(id)sender {
    WHC_QRCodeVC * vc = [WHC_QRCodeVC new];
    /// 扫描二维码代理
    vc.delegate = self;
    /// 生成二维码图片地址
    vc.myQRCodeUrl = @"https://github.com/netyouli?tab=repositories";
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - WHC_QRCodeVCDelegate
/// 扫描二维码回调
- (void)WHCQRCodeVCScanCallBack:(NSString *)value isQRCode:(BOOL)isQRCode {
    if (isQRCode) {
        QRCodeWebVC * vc = [QRCodeWebVC new];
        vc.value = value;
        [self presentViewController:vc animated:YES completion:nil];
    }else {
        [[[UIAlertView alloc] initWithTitle:value
                                   message:nil
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil,
          nil] show];
    }
}

/// 生成二维码图片回调
- (void)WHCQRCodeVCBecomeQRCodeImage:(UIImage *)image {
    MyQRCodeVC * vc = [MyQRCodeVC new];
    vc.myQRCodeImage = image;
    [self presentViewController:vc animated:YES completion:nil];
}
@end
