//
//  studentTryingToAddTheCourse.m
//  ACube
//
//  Created by Akshay Yadav on 11/17/14.
//  Copyright (c) 2014 Akshay Yadav. All rights reserved.
//

#import "studentTryingToAddTheCourse.h"


@implementation studentTryingToAddTheCourse



-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self.courseName setText:[[NSUserDefaults standardUserDefaults]stringForKey:@"currentOpenCourse"]];
    
    Firebase *currentCourseDetails = [[Firebase alloc]initWithUrl:[@"https://acube.firebaseio.com/allCourses/" stringByAppendingString: [[NSUserDefaults standardUserDefaults]stringForKey:@"currentOpenCourse"]]];
    
    [currentCourseDetails observeSingleEventOfType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot){
    
        [self.tag1 setText:snapshot.value[@"tag1"]];
        [self.tag2 setText:snapshot.value[@"tag2"]];
        [self.tag3 setText:snapshot.value[@"tag3"]];
        
        if ([snapshot.value[@"deprecatedStatus"] isEqualToString:@"deprecated"]) {
            [self.deprecatedStatus setText:@"This course is deprecated"];
        }
        
    
    
    }];
     
     
   
    
    
    
}




- (IBAction)addThisCourseAction:(id)sender {
    
    
    NSString *loggedInUserURL = [[NSUserDefaults standardUserDefaults]stringForKey:@"loggedInUserdetailsURL"];
    
    NSString *thisStudentsID = [loggedInUserURL stringByReplacingOccurrencesOfString:@"https://acube.firebaseio.com/ActiveUsers/" withString:@""];
    NSLog(thisStudentsID);
    
    Firebase *thisStudentsCourses = [[Firebase alloc]initWithUrl:[loggedInUserURL stringByAppendingString:[@"/courses/" stringByAppendingString:[[NSUserDefaults standardUserDefaults]stringForKey:@"currentOpenCourse" ]]]];
    
    //
    
    
    
    
    NSDictionary *StudentsPerformanceDetails = @{@"quizTaken": @"notTaken",@"score": @"0"};
    
    
    [thisStudentsCourses setValue:StudentsPerformanceDetails];
    
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Course Added Succesfully"
                                                   message: @"This Course is succesfully added."
                                                  delegate: self
                                         cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil];
    
    [alert setTag:31];
    [alert show];
//
//
//
//
//  Firebase *studentInThisCourse = [[Firebase alloc]initWithUrl:[@"https://acube.firebaseio.com/allCourses/" stringByAppendingString:[[[NSUserDefaults standardUserDefaults]stringForKey:@"currentOpenCourse" ] stringByAppendingString:[@"/students/" stringByAppendingString:thisStudentsID]]] ];
//
//   
//    
//    
//    
  
    //THIS SECTION IS COMMENTED TO BE USED LATER!!! DO NOT DELETE _________IT ADDS STUDENT TO COURSE.
    
    
    
//    [studentInThisCourse setValue:@"takingCourse"];
    
    //------------------------------_______----------------------------
    
    
    
//    NSString *thisStudentsCoursesURL = [[loggedInUserURL stringByReplacingOccurrencesOfString:@"ActiveUsers" withString:@"CoursesManagement"]stringByAppendingString:[@"/courses/" stringByAppendingString:[[NSUserDefaults standardUserDefaults]stringForKey:@"currentOpenCourse"]]];
//    Firebase *thisStudentsPerformancesinThisCourse = [[Firebase alloc]initWithUrl:thisStudentsCoursesURL];
//    
//    [thisStudentsPerformancesinThisCourse setValue:@"notTaken" forKey:@"quizTaken"];
//    [thisStudentsPerformancesinThisCourse setValue:0 forKey:@"score"];
    
    
    
    
    
    NSLog(loggedInUserURL);
    
    
}
@end
