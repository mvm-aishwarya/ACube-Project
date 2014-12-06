//
//  adminSelectedUser.h
//  ACube
//
//  Created by Akshay Yadav on 12/3/14.
//  Copyright (c) 2014 Akshay Yadav. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>

@interface adminSelectedUser : UIViewController{
    Firebase * selectedUsersURL;
    
    NSString *RoleOfThisUser;
    
}


@property (weak, nonatomic) IBOutlet UILabel *selectedUsersEmailId;

@property (weak, nonatomic) IBOutlet UILabel *firstName;
@property (weak, nonatomic) IBOutlet UILabel *lastName;
@property (weak, nonatomic) IBOutlet UILabel *Role;

@property (weak, nonatomic) IBOutlet UIButton *MakeStudentTOCM;

- (IBAction)makeStudentCMAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *deleteThisUser;

- (IBAction)deleteThisUserAction:(id)sender;





@end
