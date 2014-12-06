//
//  studentTakingQuiz.h
//  ACube
//
//  Created by Akshay Yadav on 12/4/14.
//  Copyright (c) 2014 Akshay Yadav. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>

@interface studentTakingQuiz : UIViewController{
    
    UIImage *blankBox;
    UIImage *checkedBox;
    
    
    NSString * nameOfCourse;
    NSString * CourseDetailsURL;
    
    NSString *currentUserDetails;
    
    NSString *Q1CA;
    NSString *Q2CA;
    NSString *Q3CA;
    NSString *Q4CA;
    NSString *Q5CA;
    
    
    NSString *Q1SCA;
    NSString *Q2SCA;
    NSString *Q3SCA;
    NSString *Q4SCA;
    NSString *Q5SCA;
    
    
    
    int score;
    
    
    
}

@property (weak, nonatomic) IBOutlet UIButton *submitButton;


- (IBAction)submitButtonAction:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *Q1;

@property (weak, nonatomic) IBOutlet UILabel *Q1A1;

@property (weak, nonatomic) IBOutlet UILabel *Q1A2;

@property (weak, nonatomic) IBOutlet UILabel *Q1A3;

@property (weak, nonatomic) IBOutlet UILabel *Q1A4;

@property (weak, nonatomic) IBOutlet UIButton *Q1A1R;

@property (weak, nonatomic) IBOutlet UIButton *Q1A2R;

@property (weak, nonatomic) IBOutlet UIButton *Q1A3R;

@property (weak, nonatomic) IBOutlet UIButton *Q1A4R;


@property (weak, nonatomic) IBOutlet UILabel *Q2;

@property (weak, nonatomic) IBOutlet UILabel *Q2A1;

@property (weak, nonatomic) IBOutlet UILabel *Q2A2;

@property (weak, nonatomic) IBOutlet UILabel *Q2A3;

@property (weak, nonatomic) IBOutlet UILabel *Q2A4;

@property (weak, nonatomic) IBOutlet UIButton *Q2A1R;

@property (weak, nonatomic) IBOutlet UIButton *Q2A2R;

@property (weak, nonatomic) IBOutlet UIButton *Q2A3R;

@property (weak, nonatomic) IBOutlet UIButton *Q2A4R;


@property (weak, nonatomic) IBOutlet UILabel *Q3;

@property (weak, nonatomic) IBOutlet UILabel *Q3A1;

@property (weak, nonatomic) IBOutlet UILabel *Q3A2;

@property (weak, nonatomic) IBOutlet UILabel *Q3A3;

@property (weak, nonatomic) IBOutlet UILabel *Q3A4;

@property (weak, nonatomic) IBOutlet UIButton *Q3A1R;

@property (weak, nonatomic) IBOutlet UIButton *Q3A2R;

@property (weak, nonatomic) IBOutlet UIButton *Q3A3R;

@property (weak, nonatomic) IBOutlet UIButton *Q3A4R;


@property (weak, nonatomic) IBOutlet UILabel *Q4;

@property (weak, nonatomic) IBOutlet UILabel *Q4A1;

@property (weak, nonatomic) IBOutlet UILabel *Q4A2;

@property (weak, nonatomic) IBOutlet UILabel *Q4A3;

@property (weak, nonatomic) IBOutlet UILabel *Q4A4;

@property (weak, nonatomic) IBOutlet UIButton *Q4A1R;

@property (weak, nonatomic) IBOutlet UIButton *Q4A2R;

@property (weak, nonatomic) IBOutlet UIButton *Q4A3R;

@property (weak, nonatomic) IBOutlet UIButton *Q4A4R;


@property (weak, nonatomic) IBOutlet UILabel *Q5;

@property (weak, nonatomic) IBOutlet UILabel *Q5A1;

@property (weak, nonatomic) IBOutlet UILabel *Q5A2;

@property (weak, nonatomic) IBOutlet UILabel *Q5A3;

@property (weak, nonatomic) IBOutlet UILabel *Q5A4;

@property (weak, nonatomic) IBOutlet UIButton *Q5A1R;

@property (weak, nonatomic) IBOutlet UIButton *Q5A2R;

@property (weak, nonatomic) IBOutlet UIButton *Q5A3R;

@property (weak, nonatomic) IBOutlet UIButton *Q5A4R;




- (IBAction)Q1A1Raction:(id)sender;
- (IBAction)Q1A2Raction:(id)sender;
- (IBAction)Q1A3Raction:(id)sender;
- (IBAction)Q1A4Raction:(id)sender;

- (IBAction)Q2A1Raction:(id)sender;
- (IBAction)Q2A2Raction:(id)sender;
- (IBAction)Q2A3Raction:(id)sender;
- (IBAction)Q2A4Raction:(id)sender;

- (IBAction)Q3A1Raction:(id)sender;
- (IBAction)Q3A2Raction:(id)sender;
- (IBAction)Q3A3Raction:(id)sender;
- (IBAction)Q3A4Raction:(id)sender;


- (IBAction)Q4A1Raction:(id)sender;
- (IBAction)Q4A2Raction:(id)sender;
- (IBAction)Q4A3Raction:(id)sender;
- (IBAction)Q4A4Raction:(id)sender;


- (IBAction)Q5A1Raction:(id)sender;
- (IBAction)Q5A2Raction:(id)sender;
- (IBAction)Q5A3Raction:(id)sender;
- (IBAction)Q5A4Raction:(id)sender;





@end
