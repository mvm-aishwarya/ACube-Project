//
//  ViewCourseController.h
//  ACube
//
//  Created by Akshay Yadav on 11/29/14.
//  Copyright (c) 2014 Akshay Yadav. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>

@interface ViewCourseController : UIViewController{
    
    NSString *videoURL;
    NSString *pdfURL;
    
    NSString *nameOfCourse;
    
    NSURL *url;
    
    NSString *lastSelectionofVideoOrPdf;
    
    
    
   
}

@property (weak, nonatomic) IBOutlet UIWebView *pdfVideoWebView;

@property (weak, nonatomic) IBOutlet UIButton *pdfVideoButton;
- (IBAction)pdfVideoAction:(id)sender;

@end