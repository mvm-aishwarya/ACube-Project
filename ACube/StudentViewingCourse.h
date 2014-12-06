//
//  StudentViewingCourse.h
//  ACube
//
//  Created by Yadav, Akshay on 12/2/14.
//  Copyright (c) 2014 Akshay Yadav. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <Firebase/Firebase.h>


@interface StudentViewingCourse : UIViewController{
    
    NSString *decodedEmailOfUsers;
}


@property (weak, nonatomic) IBOutlet UILabel *nameOfCourse;

@property (weak, nonatomic) IBOutlet UILabel *deprecatedNotification;
- (IBAction)takeQuizAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *sendCertificate;

- (IBAction)sendCertificateAction:(id)sender;

- (IBAction)dropCourse:(id)sender;


@end
