//
//  BNRCoursesViewController.m
//  Nerdfeed
//
//  Created by daipeng on 15-3-15.
//  Copyright (c) 2015年 joygin. All rights reserved.
//

#import "BNRCoursesViewController.h"
#import "BNRWebViewController.h"

@interface BNRCoursesViewController () <NSURLSessionDataDelegate>

@property (nonatomic) NSURLSession *session;
@property (nonatomic, copy) NSArray *courses;

@end

@implementation BNRCoursesViewController

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *courses = self.courses[indexPath.row];
    NSURL *URL = [NSURL URLWithString:courses[@"url"]];

    self.webViewController.title = courses[@"title"];
    self.webViewController.URL = URL;

    if (!self.splitViewController) {
        [self.navigationController pushViewController:self.webViewController
                                             animated:YES];
    }
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.courses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                                            forIndexPath:indexPath];

    NSDictionary *course = self.courses[indexPath.row];
    cell.textLabel.text = course[@"title"];

    return cell;
}

- (void)fetchFeed
{
    NSString *requestString = [@"https://bookapi.bignerdranch.com/private/courses.json"
                               stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:requestString];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];

    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:req
                                                     completionHandler:
                                      ^(NSData *data, NSURLResponse *response, NSError *error){
                                          NSLog(@"%@", response);
                                          NSLog(@"%@", error);
                                          NSDictionary *jsonObject =
                                          [NSJSONSerialization JSONObjectWithData:data
                                                                          options:0
                                                                            error:nil];
                                          NSLog(@"%@", jsonObject);
                                          self.courses = jsonObject[@"courses" ];
                                          NSLog(@"%@", self.courses);

                                          dispatch_async(dispatch_get_main_queue(), ^{
                                              [self.tableView reloadData];
                                          });
                                      }];
    [dataTask resume];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.navigationItem.title = @"BNR Courses";

        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:config
                                                 delegate:self
                                            delegateQueue:nil];
        [self fetchFeed];
    }
    return self;
}

- (void)URLSession:(NSURLSession *)session
              task:(NSURLSessionTask *)task
didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
 completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition,
                             NSURLCredential *))completionHandler

{
    NSURLCredential *cred = [NSURLCredential credentialWithUser:@"BigNerdRanch"
                                                       password:@"AchieveNerdvana"
                                                    persistence:NSURLCredentialPersistenceForSession];

    completionHandler(NSURLSessionAuthChallengeCancelAuthenticationChallenge, cred);
}

@end
