//
//  studentTakingQuiz.m
//  ACube
//
//  Created by Akshay Yadav on 12/4/14.
//  Copyright (c) 2014 Akshay Yadav. All rights reserved.
//

#import "studentTakingQuiz.h"

@implementation studentTakingQuiz




-(void) viewDidLoad{
    
    [super viewDidLoad];
    
    score = 0;
    
    blankBox = [UIImage imageNamed:@"cbox.png"];
    checkedBox = [UIImage imageNamed:@"checkedcbox.png"];
    
    nameOfCourse = [[NSUserDefaults standardUserDefaults]stringForKey:@"currentOpenCourse"];
    
    Q1SCA = @"noAnswer";
    Q2SCA = @"noAnswer";
    Q3SCA = @"noAnswer";
    Q4SCA = @"noAnswer";
    Q5SCA = @"noAnswer";
    
    
    currentUserDetails = [[NSUserDefaults standardUserDefaults]stringForKey:@"loggedInUserdetailsURL"];
    
    NSString *q1URL = [@"https://acube.firebaseio.com/allCourses/" stringByAppendingString:[nameOfCourse stringByAppendingString:@"/quiz/question1"]];
     NSString *q2URL = [@"https://acube.firebaseio.com/allCourses/" stringByAppendingString:[nameOfCourse stringByAppendingString:@"/quiz/question2"]];
     NSString *q3URL = [@"https://acube.firebaseio.com/allCourses/" stringByAppendingString:[nameOfCourse stringByAppendingString:@"/quiz/question3"]];
     NSString *q4URL = [@"https://acube.firebaseio.com/allCourses/" stringByAppendingString:[nameOfCourse stringByAppendingString:@"/quiz/question4"]];
     NSString *q5URL = [@"https://acube.firebaseio.com/allCourses/" stringByAppendingString:[nameOfCourse stringByAppendingString:@"/quiz/question5"]];
    
    
    Firebase *q1FB = [[Firebase alloc]initWithUrl:q1URL];
    Firebase *q2FB = [[Firebase alloc]initWithUrl:q2URL];
    Firebase *q3FB = [[Firebase alloc]initWithUrl:q3URL];
    Firebase *q4FB = [[Firebase alloc]initWithUrl:q4URL];
    Firebase *q5FB = [[Firebase alloc]initWithUrl:q5URL];

    [q1FB observeSingleEventOfType:FEventTypeValue withBlock:^(FDataSnapshot *snap1){
    
        [self.Q1 setText:snap1.value[@"Q1"]];
        [self.Q1A1 setText:snap1.value[@"ans1"]];
        [self.Q1A2 setText:snap1.value[@"ans2"]];
        [self.Q1A3 setText:snap1.value[@"ans3"]];
        [self.Q1A4 setText:snap1.value[@"ans4"]];
        
        Q1CA = snap1.value[@"CA"];
        
    
    }];
    [q2FB observeSingleEventOfType:FEventTypeValue withBlock:^(FDataSnapshot *snap2){
    
    
        [self.Q2 setText:snap2.value[@"Q2"]];
        [self.Q2A1 setText:snap2.value[@"ans1"]];
        [self.Q2A2 setText:snap2.value[@"ans2"]];
        [self.Q2A3 setText:snap2.value[@"ans3"]];
        [self.Q2A4 setText:snap2.value[@"ans4"]];
        
        Q2CA = snap2.value[@"CA"];
    
    
    
    
    }];
    [q3FB observeSingleEventOfType:FEventTypeValue withBlock:^(FDataSnapshot *snap3){
    
    
    
        [self.Q3 setText:snap3.value[@"Q3"]];
        [self.Q3A1 setText:snap3.value[@"ans1"]];
        [self.Q3A2 setText:snap3.value[@"ans2"]];
        [self.Q3A3 setText:snap3.value[@"ans3"]];
        [self.Q3A4 setText:snap3.value[@"ans4"]];
        
        Q3CA = snap3.value[@"CA"];
    
    
    
    }];
    [q4FB observeSingleEventOfType:FEventTypeValue withBlock:^(FDataSnapshot *snap4){
    
    
    
        [self.Q4 setText:snap4.value[@"Q4"]];
        [self.Q4A1 setText:snap4.value[@"ans1"]];
        [self.Q4A2 setText:snap4.value[@"ans2"]];
        [self.Q4A3 setText:snap4.value[@"ans3"]];
        [self.Q4A4 setText:snap4.value[@"ans4"]];
        
        Q4CA = snap4.value[@"CA"];
    
    
    }];
    [q5FB observeSingleEventOfType:FEventTypeValue withBlock:^(FDataSnapshot *snap5){
    
    
        [self.Q5 setText:snap5.value[@"Q5"]];
        [self.Q5A1 setText:snap5.value[@"ans1"]];
        [self.Q5A2 setText:snap5.value[@"ans2"]];
        [self.Q5A3 setText:snap5.value[@"ans3"]];
        [self.Q5A4 setText:snap5.value[@"ans4"]];
        
        Q5CA = snap5.value[@"CA"];
    
    }];
  
    
}

- (IBAction)Q1A1Raction:(id)sender {
    
    
    
    
    
    Q1SCA = @"a";
    [self.Q1A1R setImage:checkedBox forState:UIControlStateNormal];
    [self.Q1A2R setImage:blankBox forState:UIControlStateNormal];
    [self.Q1A3R setImage:blankBox forState:UIControlStateNormal];
    [self.Q1A4R setImage:blankBox forState:UIControlStateNormal];
    
}

- (IBAction)Q1A2Raction:(id)sender {
    
    Q1SCA = @"b";
    
    [self.Q1A1R setImage:blankBox forState:UIControlStateNormal];
    [self.Q1A2R setImage:checkedBox forState:UIControlStateNormal];
    [self.Q1A3R setImage:blankBox forState:UIControlStateNormal];
    [self.Q1A4R setImage:blankBox forState:UIControlStateNormal];
}

- (IBAction)Q1A3Raction:(id)sender {
    
    Q1SCA = @"c";
    
    [self.Q1A1R setImage:blankBox forState:UIControlStateNormal];
    [self.Q1A2R setImage:blankBox forState:UIControlStateNormal];
    [self.Q1A3R setImage:checkedBox forState:UIControlStateNormal];
    [self.Q1A4R setImage:blankBox forState:UIControlStateNormal];
}

- (IBAction)Q1A4Raction:(id)sender {
    Q1SCA = @"d";
    
    [self.Q1A1R setImage:blankBox forState:UIControlStateNormal];
    [self.Q1A2R setImage:blankBox forState:UIControlStateNormal];
    [self.Q1A3R setImage:blankBox forState:UIControlStateNormal];
    [self.Q1A4R setImage:checkedBox forState:UIControlStateNormal];
    
}

- (IBAction)Q2A1Raction:(id)sender {
    Q2SCA = @"a";
    
    [self.Q2A1R setImage:checkedBox forState:UIControlStateNormal];
    [self.Q2A2R setImage:blankBox forState:UIControlStateNormal];
    [self.Q2A3R setImage:blankBox forState:UIControlStateNormal];
    [self.Q2A4R setImage:blankBox forState:UIControlStateNormal];
    
    
    
    
}

- (IBAction)Q2A2Raction:(id)sender {
    Q2SCA = @"b";
    
    [self.Q2A1R setImage:blankBox forState:UIControlStateNormal];
    [self.Q2A2R setImage:checkedBox forState:UIControlStateNormal];
    [self.Q2A3R setImage:blankBox forState:UIControlStateNormal];
    [self.Q2A4R setImage:blankBox forState:UIControlStateNormal];
    
    
    
}

- (IBAction)Q2A3Raction:(id)sender {
    
    Q2SCA = @"c";
    
    [self.Q2A1R setImage:blankBox forState:UIControlStateNormal];
    [self.Q2A2R setImage:blankBox forState:UIControlStateNormal];
    [self.Q2A3R setImage:checkedBox forState:UIControlStateNormal];
    [self.Q2A4R setImage:blankBox forState:UIControlStateNormal];
    
    
}

- (IBAction)Q2A4Raction:(id)sender {
    Q2SCA = @"d";
    
    [self.Q2A1R setImage:blankBox forState:UIControlStateNormal];
    [self.Q2A2R setImage:blankBox forState:UIControlStateNormal];
    [self.Q2A3R setImage:blankBox forState:UIControlStateNormal];
    [self.Q2A4R setImage:checkedBox forState:UIControlStateNormal];
    
    
    
}

- (IBAction)Q3A1Raction:(id)sender {
    Q3SCA = @"a";
    [self.Q3A1R setImage:checkedBox forState:UIControlStateNormal];
    [self.Q3A2R setImage:blankBox forState:UIControlStateNormal];
    [self.Q3A3R setImage:blankBox forState:UIControlStateNormal];
    [self.Q3A4R setImage:blankBox forState:UIControlStateNormal];
}

- (IBAction)Q3A2Raction:(id)sender {
    Q3SCA = @"b";
    [self.Q3A1R setImage:blankBox forState:UIControlStateNormal];
    [self.Q3A2R setImage:checkedBox forState:UIControlStateNormal];
    [self.Q3A3R setImage:blankBox forState:UIControlStateNormal];
    [self.Q3A4R setImage:blankBox forState:UIControlStateNormal];
    
}

- (IBAction)Q3A3Raction:(id)sender {
    Q3SCA = @"c";
    [self.Q3A1R setImage:blankBox forState:UIControlStateNormal];
    [self.Q3A2R setImage:blankBox forState:UIControlStateNormal];
    [self.Q3A3R setImage:checkedBox forState:UIControlStateNormal];
    [self.Q3A4R setImage:blankBox forState:UIControlStateNormal];
}

- (IBAction)Q3A4Raction:(id)sender {
    Q3SCA = @"d";
    [self.Q3A1R setImage:blankBox forState:UIControlStateNormal];
    [self.Q3A2R setImage:blankBox forState:UIControlStateNormal];
    [self.Q3A3R setImage:blankBox forState:UIControlStateNormal];
    [self.Q3A4R setImage:checkedBox forState:UIControlStateNormal];
}

- (IBAction)Q4A1Raction:(id)sender {
    Q4SCA = @"a";
    [self.Q4A1R setImage:checkedBox forState:UIControlStateNormal];
    [self.Q4A2R setImage:blankBox forState:UIControlStateNormal];
    [self.Q4A3R setImage:blankBox forState:UIControlStateNormal];
    [self.Q4A4R setImage:blankBox forState:UIControlStateNormal];
}

- (IBAction)Q4A2Raction:(id)sender {
    Q4SCA = @"b";
    [self.Q4A1R setImage:blankBox forState:UIControlStateNormal];
    [self.Q4A2R setImage:checkedBox forState:UIControlStateNormal];
    [self.Q4A3R setImage:blankBox forState:UIControlStateNormal];
    [self.Q4A4R setImage:blankBox forState:UIControlStateNormal];
}


- (IBAction)Q4A3Raction:(id)sender {
    Q4SCA = @"c";
    [self.Q4A1R setImage:blankBox forState:UIControlStateNormal];
    [self.Q4A2R setImage:blankBox forState:UIControlStateNormal];
    [self.Q4A3R setImage:checkedBox forState:UIControlStateNormal];
    [self.Q4A4R setImage:blankBox forState:UIControlStateNormal];
}

- (IBAction)Q4A4Raction:(id)sender {
    Q4SCA = @"d";
    [self.Q4A1R setImage:blankBox forState:UIControlStateNormal];
    [self.Q4A2R setImage:blankBox forState:UIControlStateNormal];
    [self.Q4A3R setImage:blankBox forState:UIControlStateNormal];
    [self.Q4A4R setImage:checkedBox forState:UIControlStateNormal];
}

- (IBAction)Q5A1Raction:(id)sender {
    Q5SCA = @"a";
    [self.Q5A1R setImage:checkedBox forState:UIControlStateNormal];
    [self.Q5A2R setImage:blankBox forState:UIControlStateNormal];
    [self.Q5A3R setImage:blankBox forState:UIControlStateNormal];
    [self.Q5A4R setImage:blankBox forState:UIControlStateNormal];
}

- (IBAction)Q5A2Raction:(id)sender {
    Q5SCA = @"b";
    [self.Q5A1R setImage:blankBox forState:UIControlStateNormal];
    [self.Q5A2R setImage:checkedBox forState:UIControlStateNormal];
    [self.Q5A3R setImage:blankBox forState:UIControlStateNormal];
    [self.Q5A4R setImage:blankBox forState:UIControlStateNormal];
    
}

- (IBAction)Q5A3Raction:(id)sender {
    Q5SCA = @"c";
    [self.Q5A1R setImage:blankBox forState:UIControlStateNormal];
    [self.Q5A2R setImage:blankBox forState:UIControlStateNormal];
    [self.Q5A3R setImage:checkedBox forState:UIControlStateNormal];
    [self.Q5A4R setImage:blankBox forState:UIControlStateNormal];
    
}

- (IBAction)Q5A4Raction:(id)sender {
    Q5SCA = @"d";
    [self.Q5A1R setImage:blankBox forState:UIControlStateNormal];
    [self.Q5A2R setImage:blankBox forState:UIControlStateNormal];
    [self.Q5A3R setImage:blankBox forState:UIControlStateNormal];
    [self.Q5A4R setImage:checkedBox forState:UIControlStateNormal];
    
}


- (IBAction)submitButtonAction:(id)sender {
    
    if ([Q1SCA isEqualToString:@"noAnswer"]||[Q2SCA isEqualToString:@"noAnswer"]||[Q3SCA isEqualToString:@"noAnswer"]||[Q4SCA isEqualToString:@"noAnswer"]||[Q5SCA isEqualToString:@"noAnswer"]) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Quiz incomplete"
                                                       message: @"Please finish all questions before submitting."
                                                      delegate: self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        
        [alert setTag:11];
        [alert show];
    }
    
    else{
        if ([Q1SCA isEqualToString:Q1CA]) {
            score = score + 100;
        }
        if ([Q2SCA isEqualToString:Q2CA]) {
            score = score + 100;
            
        }if ([Q3SCA isEqualToString:Q3CA]) {
            score = score + 100;
        }
        if ([Q4SCA isEqualToString:Q4CA]) {
            score = score + 100;
        }
        
        if ([Q5SCA isEqualToString:Q5CA]) {
            score = score + 100;
        }
        
        
        NSString *thisUsersQuizStatus = [currentUserDetails stringByAppendingString:[@"/courses/" stringByAppendingString:[nameOfCourse stringByAppendingString:@"/quizTaken"]]];
        
        NSString *thisUsersScore = [currentUserDetails stringByAppendingString:[@"/courses/" stringByAppendingString:[nameOfCourse stringByAppendingString:@"/score"]]];
        
        Firebase *thisUserQuizStatusFB = [[Firebase alloc]initWithUrl:thisUsersQuizStatus];
        Firebase *thisUsersScoreFB = [[Firebase alloc]initWithUrl:thisUsersScore];
        
        NSString *scoreString = [NSString stringWithFormat:@"%d",score];
        
        [thisUserQuizStatusFB setValue:@"taken"];
        [thisUsersScoreFB setValue:scoreString];
        
        [self performSelector:@selector(performTheSegue) withObject:self afterDelay:1.0 ];
        
    }
    
    
    
}

-(void)performTheSegue{
    [self performSegueWithIdentifier:@"doneQuiz" sender:self];
}



@end
