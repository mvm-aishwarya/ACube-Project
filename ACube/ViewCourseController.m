//
//  ViewCourseController.m
//  ACube
//
//  Created by Akshay Yadav on 11/29/14.
//  Copyright (c) 2014 Akshay Yadav. All rights reserved.
//

#import "ViewCourseController.h"

@implementation ViewCourseController{
    
    
}
    
-(void)viewDidLoad{
    [super viewDidLoad];
    lastSelectionofVideoOrPdf = @"video";
    
   // [self.pdfVideoswitch isOn];
    nameOfCourse = [[NSUserDefaults standardUserDefaults]stringForKey:@"currentOpenCourse"];
    
    Firebase *currentCourseDetails = [[Firebase alloc]initWithUrl:[@"https://acube.firebaseio.com/allCourses/"stringByAppendingString:nameOfCourse]];
    
    [currentCourseDetails observeSingleEventOfType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot){
    
        videoURL = snapshot.value[@"videoURL"];
        NSLog(videoURL);
        
        pdfURL = snapshot.value[@"pdfURL"];
        
        url = [NSURL URLWithString:videoURL];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [_pdfVideoWebView loadRequest:request];
        
        
    }];
  
    
}

-(void)changeSelection{
    
    if ([lastSelectionofVideoOrPdf isEqualToString:@"video"]) {
        lastSelectionofVideoOrPdf = @"pdf";
        [self.pdfVideoButton setImage:[UIImage imageNamed:@"pdfswitchtrans.png"] forState:UIControlStateNormal];
    }
    else{
        lastSelectionofVideoOrPdf = @"video";
        [self.pdfVideoButton setImage:[UIImage imageNamed:@"Videoswitchtrans.png"] forState:UIControlStateNormal];
    }
    
}
- (IBAction)pdfVideoAction:(id)sender {

    [self changeSelection];
    
    if ([lastSelectionofVideoOrPdf isEqualToString: @"video"]) {
        url = [NSURL URLWithString:videoURL];
        NSLog(@"playingVideo");
        NSLog(videoURL);
    }
    else{
        url = [NSURL URLWithString:pdfURL];
        NSLog(@"playingPDF");
        NSLog(pdfURL);
    }
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_pdfVideoWebView loadRequest:request];
    

}
@end
