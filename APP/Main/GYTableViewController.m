//
//  GYTableViewController.m
//  APP
//
//  Created by Paul on 2018/11/16.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "GYTableViewController.h"
#import "GYTableViewCell.h"

@interface GYTableViewController ()

@property (nonatomic,copy) NSArray *list;

@end

@implementation GYTableViewController

- (NSArray *)list{
    if (_list == nil) {
        _list = @[@"您好！怀孕是从最后一次月经的第一日算起的。共40周，280天。预产期也是从最后一次月经的第一日算起，简单的计算方法为：月份=月份-3或+9，日期=阳历日期+7通常不管是计算怀孕时间还是推算预产期都是由最后一次月经的第一日算起，预产期嘛加上280天(40周)即是。但事实上，正确的算法应该是——当精子、卵子结合后开始着床这个时候怀孕，也就是妊娠才开始，从这个时间算起，再加上266天就是比较准确的预产期。不过由于一般人都无法确定受精日，所以前者的计算法较为方便，不过这280天里就包括了尚未怀孕的日子，这是正常的，其实按这样的方法算出的怀孕时间或者推算的预产期只是为了便于孕期里的各种检查，没有必要去确定准确的受精怀孕时间。",@"-3或+9，日期=阳历日期+7通常不管是计算怀孕时间还是推算预产期都是由最后一次月经的第一日算起，预产期嘛加上280天(40周)即是。但事实上，正确的算法应该是——当精子、卵子结合后开始着床这个时",@"或+9，日期=阳历日期+7通常不管是计算怀孕时间还是推算预产期都是由最后一次月经的第一日算起，预产期嘛加上280天(40周)即是。但事实上，正确的算法应该是——当精子、卵子结合后开始着床这个时候怀孕，也就是妊娠才开始，从这个时间算起，再加上266天就是比较准确的预产期。不过由于一般人",@"间或者推算的预产",@"月份=月份-3或+9，日期=阳历日期+7通常不管是计算怀孕时间还是推算预产期都是由最后一次月经的第一日算起，预产期嘛加上280天(40周)即是。但事实上，正确的算法应该是——当精子、卵子结合后开始着床这个时候怀孕，也就是妊娠才开始，从这个时间算起，再加上266天就是比较准确的预产期。不过由于一般人都无法确定受精日，所以前者的计算法较为方便，不过这280天里就包括了尚未怀孕的日子，这是正常的，其实按这样的方法算出的怀孕时间或者推算的预产期只是为了便于孕期里的各种检查，没有必要去确定准确的受精怀孕时间。",@"-3或+9，日期=阳历日期+7通常",@"期=阳历日期+7通常不管是计算怀孕时间还是推算预产期都是由最后一次月经的第一日算起，预产期嘛加上280天(40周)即是。但事实上，正确的",@"于一般人",@"40周)即是。但事实上，正确的算法应该是——当精子、卵子结合后开始着床这个时候怀孕，也就是妊娠才开始，从这个时间算起，再加上266天就是比较准确的预产期。不过由于一般人都无法确定受精日，所以前者的计算法较为方便，不过这280天里就包括了尚未怀孕的日子，这是正常的，其实按这样的方法算出的怀孕时间或者推算的预产期只是为了便于孕期里的各种检查，没有必要去确定准确的受精怀孕时间。",@"-3或+9，日期=阳历日期+7通常不管是计算怀孕时间还",@")即是。但事实上，正确的算法应该是——当精子、卵子结合后开始着床这个时候怀孕，也就是妊娠才开始，从这个时间算起，再加上266天就是比较准确的预产期。不过由于一般人都无法确定受精日，所以前者的计算法较为方便，不过这280天里就包括了尚未怀孕的日子，这是正常的，其实按这样的方法算出的怀孕时间或者推算的预产期只是为了便于孕期里的各种检查，没有必要去确定准确的受精怀孕时间。",@"-3或+9，日期=阳历日期+7通常",@"期=阳历日期+7通常不管是计算怀孕时间还是推算预产期都是由最后一次月经的第一日算起，预产期嘛加上280天(40周)即是。",@"始着"];
    }
    return _list;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"测试";
    
    self.tableView.estimatedRowHeight = 50;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.tableView registerWithClassName:@"GYTableViewCell" identifier:GYTableViewCellID];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:GYTableViewCellID forIndexPath:indexPath];
    cell.label.text = self.list[indexPath.row];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
