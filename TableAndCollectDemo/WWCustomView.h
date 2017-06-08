//
//  WWCustomView.h
//  TableAndCollectDemo
//
//  Created by DUC-apple3 on 2017/6/2.
//  Copyright © 2017年 DUC-apple3. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^btnActionBlock)();
@interface WWCustomView : UIView
-(instancetype)initWithRemindDay:(NSString*)remindDay  SureBtn:(btnActionBlock)sureBlock CancleBtn:(btnActionBlock)cancleBlock;
@property (nonatomic, copy) btnActionBlock sureBtnBlock;
@property (nonatomic, copy) btnActionBlock cancleBtnBlock;
+(void)showViewWithRemindDay:(NSString*)remindDay  SureBtn:(btnActionBlock)sureBlock CancleBtn:(btnActionBlock)cancleBlock;
@end
