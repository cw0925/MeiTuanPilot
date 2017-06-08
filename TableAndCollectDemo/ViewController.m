//
//  ViewController.m
//  TableAndCollectDemo
//
//  Created by DUC-apple3 on 2017/5/9.
//  Copyright © 2017年 DUC-apple3. All rights reserved.
//

#import "ViewController.h"
#import "FirstTableViewCell.h"
#import "TwoViewController.h"
#define Cell @"cell"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,FirstTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Demo";
    self.automaticallyAdjustsScrollViewInsets = NO;
//    [self.tableView registerNib:[UINib nibWithNibName:@"FirstTableViewCell" bundle:nil] forCellReuseIdentifier:Cell];
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cell];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FirstTableViewCell" owner:self options:nil] lastObject];
    }
    cell.testLabel.text = [NSString stringWithFormat:@"当前cell:%ld",indexPath.row];
    cell.delegate = self;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 250;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TwoViewController *wVC = [TwoViewController new];
    [self.navigationController pushViewController:wVC animated:YES];
    
}
//点击图片代理方法
- (void)scanImageAction:(NSInteger)itemIndex{
    NSLog(@"图片下标%ld",itemIndex);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
