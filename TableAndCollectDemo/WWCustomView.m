//
//  WWCustomView.m
//  TableAndCollectDemo
//
//  Created by DUC-apple3 on 2017/6/2.
//  Copyright © 2017年 DUC-apple3. All rights reserved.
//

#import "WWCustomView.h"
#define kScreen_Width  [[UIScreen mainScreen] bounds].size.width
#define kScreen_Height [[UIScreen mainScreen] bounds].size.height
#define WidthIphone6 [UIScreen mainScreen].bounds.size.width/375
#define kButtonHei 44
#define kDistance 60

#define kTitleFont 17
#define kMassageFont 15
#define kBtnTitleFont  15
@interface WWCustomView()
@property (weak, nonatomic) IBOutlet UILabel *remindDayLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cancleBottom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sureBottom;

@end
@implementation WWCustomView
{
 UIView *_backgraoudView; //蒙板背景
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithRemindDay:(NSString*)remindDay SureBtn:(btnActionBlock)sureBlock CancleBtn:(btnActionBlock)cancleBlock {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0,kScreen_Width, kScreen_Height);
//        self.tag=tag;
        //蒙板
        [_backgraoudView removeFromSuperview];
        _backgraoudView = nil;
        _backgraoudView = [[UIView alloc]init];
        _backgraoudView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height);
        _backgraoudView.backgroundColor = [UIColor blackColor];
        _backgraoudView.alpha = 0;
        [self addSubview:_backgraoudView];
        
        [UIView animateWithDuration:0.2 animations:^{
            _backgraoudView.alpha = 0.7;
        }];
       //提示界面
     UIView *cueView  = [[[NSBundle mainBundle] loadNibNamed:@"WWCustomView" owner:self options:nil] firstObject];
        cueView.frame = CGRectMake(36, 150*WidthIphone6,kScreen_Width-72, 332 *WidthIphone6);
        NSLog(@"%.2f",WidthIphone6);
        self.heightLabel.constant = WidthIphone6*71;
        self.cancleBottom.constant = WidthIphone6*25;
        self.sureBottom.constant = WidthIphone6*20;
        [self addSubview:cueView];
        self.remindDayLabel.text = remindDay;
        [self addSubview:cueView];
        self.cancleBtnBlock =cancleBlock;
        self.sureBtnBlock = sureBlock;
       
    }
    UIWindow *window = [UIApplication sharedApplication].windows[0];
    [window addSubview:self];
    return self;
}
+(void)showViewWithRemindDay:(NSString *)remindDay SureBtn:(btnActionBlock)sureBlock CancleBtn:(btnActionBlock)cancleBlock{
    [[WWCustomView alloc] initWithRemindDay:remindDay SureBtn:sureBlock CancleBtn:cancleBlock];

}
- (IBAction)memberSureBtnAction:(id)sender {
    [self removeFromSuperview];
    if (self.sureBtnBlock) {
        self.sureBtnBlock();
    }
}
- (IBAction)memberCancleBtnAction:(id)sender {
    [self removeFromSuperview];
    if (self.cancleBtnBlock) {
        self.cancleBtnBlock();
    }
}

@end
