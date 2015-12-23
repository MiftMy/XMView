//
//  ViewController.m
//  XMView
//
//  Created by mifit on 15/9/15.
//  Copyright (c) 2015年 mifit. All rights reserved.
//

#import "ViewController.h"
#import "XMView.h"
#import "XMSegDetailView.h"
#import "showWaterViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *seg;
@property (weak, nonatomic) IBOutlet XMSegDetailView *xmView;
- (IBAction)switchChanged:(id)sender;
- (IBAction)showMyVIew:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSArray *tem = @[@"2016/1/1",@"2016/5/1",@"2016/5/21",@"2016/1/3",@"2016/3/1",@"2016/3/11"];
    NSArray *result = [tem sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString *com1 = (NSString *)obj1;
        NSString *com2 = (NSString *)obj2;
        return [com1 compare:com2];
    }];
    NSLog(@"org:%@",tem);
    NSLog(@"res:%@",result);


    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.xmView.segment = (UIView<XMViewDelegate> *)self.seg;
    
    
    dispatch_time_t tt = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 1);
    dispatch_after(tt, dispatch_get_main_queue(), ^{
        UIView *t = [[UIView alloc]init];
        [t setBoderWidth:1 radius:5 color:[UIColor blackColor]];
        t.backgroundColor = [UIColor redColor];
        
        UIView *t2 = [[UIView alloc]init];
        t2.backgroundColor = [UIColor greenColor];
        [t2 setBoderWidth:0.5];
        [t2 setBoderRadius:10];
        
        UIView *t3 = [[UIView alloc]init];
        t3.backgroundColor = [UIColor yellowColor];
        NSArray *ar = [NSArray arrayWithObjects:t,t2,t3, nil];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(120, 100, 100, 100)];
        view.backgroundColor = [UIColor blueColor];
        [t3 addSubview:view];
        t3.frame = self.xmView.frame;
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(15, 15)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = view.bounds;
        maskLayer.path = maskPath.CGPath;
        view.layer.mask = maskLayer;
        
        self.xmView.arrViews = ar;
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchChanged:(id)sender {
    UISegmentedControl *st = (UISegmentedControl *)sender;
    self.xmView.selectedIndex = st.selectedSegmentIndex;
}

- (IBAction)showMyVIew:(id)sender {
    showWaterViewController *vc = [[UIStoryboard storyboardWithName:@"water"bundle:nil]instantiateViewControllerWithIdentifier:@"showWaterViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
