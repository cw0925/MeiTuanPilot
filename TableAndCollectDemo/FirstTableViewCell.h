//
//  FirstTableViewCell.h
//  TableAndCollectDemo
//
//  Created by DUC-apple3 on 2017/5/9.
//  Copyright © 2017年 DUC-apple3. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FirstTableViewCellDelegate<NSObject>
/**点击图片操作方法*/
@optional
-(void)scanImageAction:(NSInteger)itemIndex;
@end
@interface FirstTableViewCell :UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property(weak,nonatomic)id<FirstTableViewCellDelegate>delegate;
@end
