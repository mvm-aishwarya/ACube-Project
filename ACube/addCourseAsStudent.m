//
//  addCourseAsStudent.m
//  ACube
//
//  Created by Akshay Yadav on 11/14/14.
//  Copyright (c) 2014 Akshay Yadav. All rights reserved.
//

#import "addCourseAsStudent.h"
#import <Firebase/Firebase.h>


@interface  addCourseAsStudent()

@property (nonatomic) Firebase *coursesOfGivenQuery;
@property (nonatomic) Firebase *tagsOfGivenQuery;

@property (weak, nonatomic) NSString *desiredQuery;

@property (nonatomic,strong) NSMutableArray *data;

@end

@implementation addCourseAsStudent

static NSString *cellIdentifier;


- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    self.searchCoursetextField.delegate = self;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)searchForCourse:(id)sender {
    
    [self.LoadingImage setHidden:NO];
    [self.loadingGif setHidden:NO];
    
    if ([self.searchCoursetextField.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Invalid Course or tag"
                                                       message: @"Please add course name or tag."
                                                      delegate: self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        
        [alert setTag:20];
        [alert show];
        
        [self.LoadingImage setHidden:YES];
        [self.loadingGif setHidden:YES];
        
    }
    
    
    
    else{
        
        self.desiredQuery = self.searchCoursetextField.text;
        
        
        NSString *newCoursesURL = [@"https://acube.firebaseio.com/allCourses/"stringByAppendingString:self.desiredQuery];
        NSString *newTagsURL = [@"https://acube.firebaseio.com/allTags/" stringByAppendingString:self.desiredQuery];
     //   NSLog(newTagsURL);
        
        
        self.coursesOfGivenQuery= [[Firebase alloc]initWithUrl:newCoursesURL];
        self.tagsOfGivenQuery = [[Firebase alloc]initWithUrl:newTagsURL];
       
        
        self.data = [[NSMutableArray alloc] init];
        [self loadDataFromFirebase];
     //   [self.listOfCourses reloadData];
     //   NSLog(@"%lu", (unsigned long)[self.data count]);
        
    }
    
    
    
}

-(void)loadDataFromFirebase
{
    
    [self.coursesOfGivenQuery observeSingleEventOfType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot){
    
        NSLog(@"starting LOAD DATA FROM FIREBASE");
    
        if (snapshot.value == [NSNull null]) {
            NSLog(@"No course With this name is released.");
        }
        else{
            if ([snapshot.value[@"releaseStatus"] isEqualToString:@"released"])  {
                
                NSLog(@"a released course with this name is found, now adding");
                
                [self.data addObject:snapshot.name];
                NSLog(@"%@",self.data);
            //    [self.listOfCourses reloadData];
            }
        }
    
    }];
    
    [self performSelector:@selector(getTagsFromFirebase) withObject:self afterDelay:2.0 ];

    
    
}

-(void)getTagsFromFirebase{
    
        [self.tagsOfGivenQuery observeEventType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
    
            NSLog(@"%@", snapshot.value);
    
            Firebase *courseFromTags = [[Firebase alloc]initWithUrl:[@"https://acube.firebaseio.com/allCourses/" stringByAppendingString:[snapshot.name stringByAppendingString:@"/releaseStatus"] ]];
    
    
            [courseFromTags observeSingleEventOfType:FEventTypeValue withBlock:^(FDataSnapshot *courseReleaseStatus){
    
                if ([courseReleaseStatus.value isEqualToString:@"released"]) {
                    [self.data addObject:snapshot.name];
    
    
    
                    NSLog(@"%lu", (unsigned long)[self.data count]);
    
    
                }
    
           }];
    
       }];
    [self performSelector:@selector(loadDataFromFirebaseII) withObject:self afterDelay:2.0 ];
}



-(void) loadDataFromFirebaseII{
    
    NSLog(@"%@",self.data);
    NSLog(@"starting reload");
    
    [self.listOfCourses reloadData];
    
    NSLog(@"%@",self.data);
    
    cellIdentifier = @"rowCell";
    NSLog(@"starting register");
    
    [self.listOfCourses registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
    
    NSLog(@"%@",self.data);
    
    [self.LoadingImage setHidden:YES];
    [self.loadingGif setHidden:YES];
    [self.searchCoursetextField setText:@""];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.data count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    
    //------attempting---thumbnail---canvas-------
    
    
    //  UIImageView *tempImage;
    
    
    cell.textLabel.text = [self.data objectAtIndex:indexPath.row];
    //    UIImage *image = [UIImage imageNamed: @"Eraser.png"];
    //    [cell.imageView setImage:image] ;
    
    
    
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString * nameOfCourse;
    
    nameOfCourse = [self.data objectAtIndex:indexPath.row];
    
    
    
    [[NSUserDefaults standardUserDefaults]setValue:nameOfCourse forKey:@"currentOpenCourse"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    NSLog(@"this thing works");
    [self performSegueWithIdentifier:@"clickedOnCourse" sender:self];
    
    
    
}

@end
