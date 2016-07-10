//
//  ViewController.m
//  5.11web视图
//
//  Created by chenp on 16/5/11.
//  Copyright © 2016年 chenp. All rights reserved.
//

#import "ViewController.h"

typedef NS_ENUM(NSInteger, cpWebItemAction) {
    cpWebItem_goback=1,
    cpWebItem_goForward=2,
    cpWebItem_reload=3,
    cpWebItem_stopLoading=4,
};

@interface ViewController ()<UIWebViewDelegate>
{
    CGFloat view_W;
    CGFloat view_H;
}
//网页视图
@property(strong,nonatomic)UIWebView *cpweb;
//工具栏
@property(strong,nonatomic)UIToolbar *cpTool;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"0.jpg"]];
    
    view_W=[UIScreen mainScreen].bounds.size.width;
    view_H=[UIScreen mainScreen].bounds.size.height;
    
    
    [self.view addSubview:self.cpweb];
    [self.view addSubview:self.cpTool];
}


#pragma mark --代理方法
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //点击事件，输出相应的地址
    NSLog(@"%@", request.URL.absoluteString);
    

    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"开始下载");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"完成下载");

    //与js交互，输出相应标题
    NSLog(@"%@",[self.cpweb stringByEvaluatingJavaScriptFromString:@"document.title"]);
    //添加数据
//    [self.cpweb stringByEvaluatingJavaScriptFromString:@"var field = document.getElementById('field_2');" "field.value='Multiple statements - OK';"];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    NSLog(@"下载失败");
}

#pragma mark --工具栏的按钮事件
-(void)itenAction:(UIBarButtonItem *)sender{

    switch (sender.tag) {
        case cpWebItem_goback:
        {
            [self.cpweb goBack];
        }
            break;
        case cpWebItem_goForward:
        {
            [self.cpweb goForward];
        }
            break;
        case cpWebItem_reload:
        {
            [self.cpweb reload];
        }
            break;
        case cpWebItem_stopLoading:
        {
            [self.cpweb stopLoading];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark --get

-(UIToolbar *)cpTool{

    if (!_cpTool) {
        _cpTool=[[UIToolbar alloc]initWithFrame:CGRectMake(0, view_H-44, view_W, 44)];
        NSArray *arr=@[@"后退",@"前进",@"刷新",@"停止刷新"];
        NSMutableArray *itemArr=[NSMutableArray new];
        for (int i=0; i<4; i++) {
            UIBarButtonItem *spaceitem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
            [itemArr addObject:spaceitem];
            UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithTitle:arr[i] style:UIBarButtonItemStyleDone target:self action:@selector(itenAction:)];
            item.tag=i+1;
            [itemArr addObject:item];
        }
        UIBarButtonItem *spaceitem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        [itemArr addObject:spaceitem];
        [_cpTool setItems:itemArr animated:NO];
    }
    return _cpTool;
}

-(UIWebView *)cpweb{

    if (!_cpweb) {
        _cpweb=[[UIWebView alloc]initWithFrame:CGRectMake(0, 20, view_W, view_H-64)];
        //加载百度网页
        [_cpweb loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.taobao.com"]]];
        
        
        //加载html的方法一：
//        NSString *path=[[NSBundle mainBundle]pathForResource:@"index" ofType:@"html"];
//        NSURL *url=[NSURL fileURLWithPath:path];
//        NSURLRequest *request=[NSURLRequest requestWithURL:url];
//        [_cpweb loadRequest:request];
        
        //加载html的方法二:
//        NSURL *baseUrl=[NSURL fileURLWithPath:[[NSBundle mainBundle]bundlePath]];
//        NSString *path = [[NSBundle mainBundle]pathForResource:@"index" ofType:@"html"];
//        NSString *html=[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
//        [_cpweb loadHTMLString:html baseURL:baseUrl];
        
        
//        _cpweb.scalesPageToFit=YES;
        _cpweb.delegate=self;
        _cpweb.opaque=YES;
    }
    return _cpweb;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
