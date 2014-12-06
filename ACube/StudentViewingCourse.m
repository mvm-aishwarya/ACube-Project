//
//  StudentViewingCourse.m
//  ACube
//
//  Created by Yadav, Akshay on 12/2/14.
//  Copyright (c) 2014 Akshay Yadav. All rights reserved.
//

#import "StudentViewingCourse.h"
#import <MailCore/MailCore.h>
#import <Firebase/Firebase.h>

#import "AESCrypt.h"

@interface StudentViewingCourse ()

@end

@implementation StudentViewingCourse

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


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



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Firebase *userDetails = [[Firebase alloc]initWithUrl:[[NSUserDefaults standardUserDefaults]stringForKey:@"loggedInUserdetailsURL"]];
    
                             [userDetails observeSingleEventOfType:FEventTypeValue withBlock:^(FDataSnapshot *emailsnap){
    decodedEmailOfUsers  = [self decodeEmailId:emailsnap.name];
    }];
                             
                             
    
    [self.nameOfCourse setText:[[NSUserDefaults standardUserDefaults]stringForKey:@"currentOpenCourse"]];
    
    NSString *URLofTheCurrentCourse = [@"https://acube.firebaseio.com/allCourses/" stringByAppendingString:[[[NSUserDefaults standardUserDefaults]stringForKey:@"currentOpenCourse"] stringByAppendingString:@"/deprecatedStatus"]];
    
    Firebase *currentCourseDetails = [[Firebase alloc]initWithUrl:URLofTheCurrentCourse];
    
    [currentCourseDetails observeSingleEventOfType:FEventTypeValue withBlock:^(FDataSnapshot *deprecatedstatus){
    
    
        if ([deprecatedstatus.value isEqualToString:@"deprecated"]) {
            
            [self.deprecatedNotification setHidden:NO];
        }
    
    }];
    
    
    
    
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takeQuizAction:(id)sender {
    
    NSString *nameOfOpenCourse = [[NSUserDefaults standardUserDefaults]stringForKey:@"currentOpenCourse"];
    
    Firebase *thisCourseQuiz = [[Firebase alloc] initWithUrl:[@"https://acube.firebaseio.com/allCourses/" stringByAppendingString:[nameOfOpenCourse stringByAppendingString:@"/quizStatus"]]];
    
    [thisCourseQuiz observeSingleEventOfType:FEventTypeValue withBlock:^(FDataSnapshot *quizSnap){
    
    
    
    
    
    
        if ([quizSnap.value isEqualToString:@"yesQuiz"]) {
            
            
            NSString *currentUserDetails = [[NSUserDefaults standardUserDefaults]stringForKey:@"loggedInUserdetailsURL"];
            
            NSString *thisUsersQuizStatus = [currentUserDetails stringByAppendingString:[@"/courses/" stringByAppendingString:[nameOfOpenCourse stringByAppendingString:@"/quizTaken"]]];
            
            Firebase *thisUserQuizStatus = [[Firebase alloc]initWithUrl:thisUsersQuizStatus];
            
            [thisUserQuizStatus observeSingleEventOfType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot){
                
                if ([snapshot.value isEqualToString:@"notTaken"]) {
                    
                    [self performSegueWithIdentifier:@"authorizedToTakeQuiz" sender:self];
                }
                else{
                    
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Quiz Complete"
                                                                   message: @"You have already taken quiz."
                                                                  delegate: self
                                                         cancelButtonTitle:@"OK"
                                                         otherButtonTitles:nil];
                    
                    [alert setTag:31];
                    [alert show];
                }
                
                
                
                
            }];
            
            
        }
        else {UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Quiz Does Not Exist"
                                                             message: @"Content Manager has not updated Quiz yet."
                                                            delegate: self
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
            
            [alert setTag:31];
            [alert show];}
    
    
    }];
    
    
    
    
}
- (IBAction)sendCertificateAction:(id)sender {
    
    
    NSString *loggedInUserDetails =[[NSUserDefaults standardUserDefaults]stringForKey:@"loggedInUserdetailsURL"];
    
    
    Firebase *thisUsersQuizStatus = [[Firebase alloc]initWithUrl:[loggedInUserDetails stringByAppendingString:[@"/courses/" stringByAppendingString:[[NSUserDefaults standardUserDefaults]stringForKey:@"currentOpenCourse"]]]];
 
    
    
    [thisUsersQuizStatus observeSingleEventOfType:FEventTypeValue withBlock:^(FDataSnapshot *quizStatus){
    
        if ([quizStatus.value[@"quizTaken"]isEqualToString:@"notTaken"]) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Quiz not Taken"
                                                           message: @"Certificate cannot be generated before taking quiz."
                                                          delegate: self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
            
            [alert setTag:31];
            [alert show];
        
    
     }
        
        else{
            
            
            
            
            
            NSString *score = quizStatus.value[@"score"];
            
            
            
            NSString *messageBody = [@"Welcome To A-Cube. \n \n \n Your Score in " stringByAppendingString:[[[NSUserDefaults standardUserDefaults]stringForKey:@"currentOpenCourse"] stringByAppendingString:[@" is " stringByAppendingString:[score stringByAppendingString:@"/500"]]]];
            
            MCOSMTPSession *smtpSession = [[MCOSMTPSession alloc]init];
            smtpSession.hostname = @"smtp.gmail.com";
            smtpSession.port = 465;
            smtpSession.username = @"teama3login@gmail.com";
            smtpSession.password = @"teamA3FOSE";
            smtpSession.authType = MCOAuthTypeSASLPlain;
            smtpSession.connectionType = MCOConnectionTypeTLS;
            
            MCOMessageBuilder *builder = [[MCOMessageBuilder alloc] init];
            MCOAddress *from = [MCOAddress addressWithDisplayName:@"A-Cube"
                                                          mailbox:@"akshayadav@gmail.com"];
            MCOAddress *to = [MCOAddress addressWithDisplayName:nil
                                                        mailbox:decodedEmailOfUsers];
            [[builder header] setFrom:from];
            [[builder header] setTo:@[to]];
            [[builder header] setSubject:@"Test Result Certificate"];
            [builder setHTMLBody:messageBody];
            NSData * rfc822Data = [builder data];
            
            MCOSMTPSendOperation *sendOperation =
            [smtpSession sendOperationWithData:rfc822Data];
            [sendOperation start:^(NSError *error) {
                if(error) {
                    NSLog(@"Error sending email: %@", error);
                } else {
                    NSLog(@"Successfully sent email!");
                }
            }];

            UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Email Send Successfully"
                                                           message: @"Please check your email id for Scores."
                                                          delegate: self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
            
            [alert setTag:6];
            [alert show];
            
        }
    
    }];
    
    
    
    
}

- (IBAction)dropCourse:(id)sender {
    
    NSString *loggedInUserDetails =[[NSUserDefaults standardUserDefaults]stringForKey:@"loggedInUserdetailsURL"];
    Firebase *thisUsersQuizStatus = [[Firebase alloc]initWithUrl:[loggedInUserDetails stringByAppendingString:[@"/courses/" stringByAppendingString:[[NSUserDefaults standardUserDefaults]stringForKey:@"currentOpenCourse"]]]];
    
    [thisUsersQuizStatus removeValue];
    
    
    [self performSegueWithIdentifier:@"dropCourse" sender:self];
    
}
@end
