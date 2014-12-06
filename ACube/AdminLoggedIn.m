//
//  AdminLoggedIn.m
//  ACube
//
//  Created by Akshay Yadav on 11/29/14.
//  Copyright (c) 2014 Akshay Yadav. All rights reserved.
//

#import "AdminLoggedIn.h"
#import <Firebase/Firebase.h>

@interface AdminLoggedIn()


@property (nonatomic) Firebase *listOfUsersFB;

@property (nonatomic,strong) NSMutableArray *data;

@end


@implementation AdminLoggedIn

static NSString *cellIdentifier;



-(NSString *)encodeEmailId:(NSString*)emailid{
    
    NSString* bar = [emailid stringByReplacingOccurrencesOfString:@"@" withString:@"AtThErAtEsUb"];
    bar = [bar stringByReplacingOccurrencesOfString:@"." withString:@"DoTrEpLaCe"];
    
    return bar;
}


-(NSString *)decodeEmailId:(NSString*)emailid{
    
    NSString* bar = [emailid stringByReplacingOccurrencesOfString:@"AtThErAtEsUb" withString:@"@"];
    bar = [bar stringByReplacingOccurrencesOfString:@"DoTrEpLaCe" withString:@"."];
    
    return bar;
    
}


- (void)viewDidLoad{
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    listOfUsersURL = @"https://acube.firebaseio.com/ActiveUsers";
    
    
    
    if (listOfUsersURL) {
        
        
    }
    self.listOfUsersFB = [[Firebase alloc] initWithUrl:listOfUsersURL];
    
    self.data = [[NSMutableArray alloc] init];
    [self loadDataFromFirebase];
    [self.listOfUsers reloadData];
    NSLog(@"%lu", (unsigned long)[self.data count]);
    
    
}


-(void)loadDataFromFirebase
{
    
    [self.listOfUsersFB observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
        
        NSLog(@"%@", snapshot.value);
        
        NSString *decodedEmailOfUsers = [self decodeEmailId:snapshot.name];
        
        [self.data addObject:decodedEmailOfUsers];
        
        NSLog(@"%lu", (unsigned long)[self.data count]);
        
        [self.listOfUsers reloadData];
        
        
    }];
    
    cellIdentifier = @"rowCell";
    
    [self.listOfUsers registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
    NSLog(@"%@",self.data);
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.data count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    
    //------attempting---thumbnail---canvas-------
    
    
    //  UIImageView *tempImage;
    
    
    cell.textLabel.text = [self.data objectAtIndex:indexPath.row];
    //    UIImage *image = [UIImage imageNamed: @"Eraser.png"];
    //    [cell.imageView setImage:image] ;
    
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString * nameOfuser  = [self.data objectAtIndex:indexPath.row];
   
    NSString * encodedNameOfUser = [self encodeEmailId:nameOfuser];
    
    [[NSUserDefaults standardUserDefaults]setValue:encodedNameOfUser forKey:@"userSelectedByAdmin"];
    [[NSUserDefaults standardUserDefaults]synchronize];

        NSLog(nameOfuser);
    [self performSegueWithIdentifier:@"adminselectsuser" sender:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
