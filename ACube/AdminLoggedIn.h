//
//  AdminLoggedIn.h
//  ACube
//
//  Created by Akshay Yadav on 11/29/14.
//  Copyright (c) 2014 Akshay Yadav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdminLoggedIn : UIViewController<UITableViewDelegate,UITableViewDataSource>{
  
    
    NSString *listOfUsersURL;
    
    
}

@property (weak, nonatomic) IBOutlet UITableView *listOfUsers;

@end
