//
//  adminSelectedUser.m
//  ACube
//
//  Created by Akshay Yadav on 12/3/14.
//  Copyright (c) 2014 Akshay Yadav. All rights reserved.
//

#import "adminSelectedUser.h"

@implementation adminSelectedUser


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


-(void)viewDidLoad{
    
    [super viewDidLoad];
    

    NSString *encodedEmailIDOfSelectedUser = [[NSUserDefaults standardUserDefaults]stringForKey:@"userSelectedByAdmin"];
    
    NSString * decodeEmailIdOfSelectedUser = [self decodeEmailId:encodedEmailIDOfSelectedUser];
    
    [self.selectedUsersEmailId setText:decodeEmailIdOfSelectedUser];
    
    selectedUsersURL = [[Firebase alloc]initWithUrl:[@"https://acube.firebaseio.com/ActiveUsers/" stringByAppendingString:encodedEmailIDOfSelectedUser]];
    
    
    
    [selectedUsersURL observeSingleEventOfType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot){
    
        [self.firstName setText:snapshot.value[@"firstName" ]];
        
        [self.lastName setText:snapshot.value[@"lastName"]];
        
        [self.Role setText:snapshot.value[@"role"]];
        
        RoleOfThisUser = snapshot.value[@"role"];
        
        if ([snapshot.value[@"role"]isEqualToString:@"student"]) {
            
            [self.MakeStudentTOCM setHidden:NO];
        }
        
        
    
        }];
    
    
    
}

- (IBAction)makeStudentCMAction:(id)sender {
    
    
    Firebase *thisUsersCourses = [[Firebase alloc]initWithUrl:[@"https://acube.firebaseio.com/ActiveUsers/" stringByAppendingString:[[[NSUserDefaults standardUserDefaults]stringForKey:@"userSelectedByAdmin"]stringByAppendingString:@"/courses"]]];
    
    
    
    [thisUsersCourses observeSingleEventOfType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot){
    
    
        if (snapshot.value == [NSNull null]) {
            
            Firebase *roleOfUserURL = [[Firebase alloc]initWithUrl:[@"https://acube.firebaseio.com/ActiveUsers/" stringByAppendingString:[[[NSUserDefaults standardUserDefaults]stringForKey:@"userSelectedByAdmin"] stringByAppendingString:@"/role"]] ];
            
            [roleOfUserURL setValue:@"content manager"];
            
            [self performSegueWithIdentifier:@"goBackToUserList" sender:self];
        }
        else{
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Invalid Action"
                                                           message: @"This User is enrolled in Courses and cannot be made Content Manager"
                                                          delegate: self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
            
            [alert setTag:5];
            [alert show];
            
        }
        
    
    }];
    
    
    
    
    
}
- (IBAction)deleteThisUserAction:(id)sender {
    
    Firebase *thisUser = [[Firebase alloc]initWithUrl:[@"https://acube.firebaseio.com/ActiveUsers/" stringByAppendingString:[[NSUserDefaults standardUserDefaults]stringForKey:@"userSelectedByAdmin"]]];
    
    
    
    [thisUser removeValue];
    
    [self performSegueWithIdentifier:@"goBackToUserList" sender:self];
    
}
@end
