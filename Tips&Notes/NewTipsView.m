//
//  NewTipsView.m
//  Tips&Notes
//
//  Created by apple on 10/10/14.
//  Copyright (c) 2014年 ___GWH___. All rights reserved.
//

#import "NewTipsView.h"

@implementation NewTipsView
bool isDone=0;
int color=1;
@synthesize tipsTextView,nextButton,datePicker;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        tipsTextView=[[UITextView alloc]initWithFrame:CGRectMake(10, 80, self.bounds.size.width-20, self.bounds.size.height-350)];
        tipsTextView.backgroundColor=[UIColor colorWithRed:255 green:120/255.f blue:120/255.f alpha:1];
        tipsTextView.text=@"";
        tipsTextView.textColor=[UIColor blackColor];
        tipsTextView.font=[UIFont systemFontOfSize:14];
        [tipsTextView.layer setMasksToBounds:YES];
        [tipsTextView.layer setCornerRadius:5.0];//设置矩形四个圆角半径
        [self addSubview:tipsTextView];
        [tipsTextView becomeFirstResponder];
        tipsTextView.delegate=self;
        
        [self colorButton];
        
        UIImageView *whiteImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height-190, 320, 190)];
        whiteImageView.backgroundColor=[UIColor whiteColor];
        [self addSubview:whiteImageView];
        
        datePicker=[[UIDatePicker alloc]init];
        datePicker.frame=CGRectMake(0, self.bounds.size.height-200, self.bounds.size.width, 190);
        [self addSubview:datePicker];
        
        UILabel *noticeLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, self.bounds.size.height-230, self.bounds.size.width-20, 40)];
        noticeLabel.backgroundColor=[UIColor clearColor];
        noticeLabel.text=@"请选择提醒的时间，然后再完成。";
        noticeLabel.textColor=[UIColor whiteColor];
        noticeLabel.font=[UIFont boldSystemFontOfSize:14];
        [self addSubview:noticeLabel];
    }
    return self;
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    isDone=0;
    [UIView animateWithDuration:0.25f animations:^{
        nextButton.alpha=0;
        [nextButton setTitle:@"Next" forState:UIControlStateNormal];
        [nextButton setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8]];
        [nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }completion:^(BOOL finished){
        [UIView animateWithDuration:0.25f animations:^{
            nextButton.alpha=1;
        }];
        
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)colorButton{
    UIButton *bt1=[UIButton buttonWithType:UIButtonTypeCustom];
    bt1.frame=CGRectMake(self.bounds.size.width/2-75, self.bounds.size.height-260, 30, 30);
    bt1.backgroundColor=[UIColor colorWithRed:255 green:120/255.f blue:120/255.f alpha:1];
    bt1.highlighted=NO;
    [bt1.layer setMasksToBounds:YES];
    [bt1.layer setCornerRadius:5.0];//设置矩形四个圆角半径
    [self addSubview:bt1];
    [bt1 addTarget:self action:@selector(colorButton:) forControlEvents:UIControlEventTouchUpInside];
    bt1.tag=1;
    
    UIButton *bt2=[UIButton buttonWithType:UIButtonTypeCustom];
    bt2.frame=CGRectMake(self.bounds.size.width/2-35, self.bounds.size.height-260, 30, 30);
    bt2.backgroundColor=[UIColor colorWithRed:255 green:255 blue:120/255.f alpha:1];
    bt2.highlighted=NO;
    [bt2.layer setMasksToBounds:YES];
    [bt2.layer setCornerRadius:5.0];//设置矩形四个圆角半径
    [self addSubview:bt2];
    [bt2 addTarget:self action:@selector(colorButton:) forControlEvents:UIControlEventTouchUpInside];
    bt2.tag=2;
    
    UIButton *bt3=[UIButton buttonWithType:UIButtonTypeCustom];
    bt3.frame=CGRectMake(self.bounds.size.width/2+5, self.bounds.size.height-260, 30, 30);
    bt3.backgroundColor=[UIColor colorWithRed:120/255.f green:255 blue:120/255.f alpha:1];
    bt3.highlighted=NO;
    [bt3.layer setMasksToBounds:YES];
    [bt3.layer setCornerRadius:5.0];//设置矩形四个圆角半径
    [self addSubview:bt3];
    [bt3 addTarget:self action:@selector(colorButton:) forControlEvents:UIControlEventTouchUpInside];
    bt3.tag=3;
    
    UIButton *bt4=[UIButton buttonWithType:UIButtonTypeCustom];
    bt4.frame=CGRectMake(self.bounds.size.width/2+45, self.bounds.size.height-260, 30, 30);
    bt4.backgroundColor=[UIColor colorWithRed:120/255.f green:120/255.f blue:255 alpha:1];
    bt4.highlighted=NO;
    [bt4.layer setMasksToBounds:YES];
    [bt4.layer setCornerRadius:5.0];//设置矩形四个圆角半径
    [self addSubview:bt4];
    [bt4 addTarget:self action:@selector(colorButton:) forControlEvents:UIControlEventTouchUpInside];
    bt4.tag=4;
    
    UIButton *cancelButton=[UIButton buttonWithType:UIButtonTypeCustom];
    cancelButton.frame=CGRectMake(10, self.bounds.size.height-260, 60, 30);
    cancelButton.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    cancelButton.highlighted=NO;
//    cancelButton.layer.borderColor = [[UIColor whiteColor] CGColor];
//    cancelButton.layer.borderWidth = 2;
    [cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancelButton.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [cancelButton.layer setMasksToBounds:YES];
    [cancelButton.layer setCornerRadius:5.0];//设置矩形四个圆角半径
    [self addSubview:cancelButton];
    [cancelButton addTarget:self action:@selector(colorButton:) forControlEvents:UIControlEventTouchUpInside];
    cancelButton.tag=0;
    
    nextButton=[UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.frame=CGRectMake(self.bounds.size.width-70, self.bounds.size.height-260, 60, 30);
    nextButton.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    nextButton.highlighted=NO;
//    nextButton.layer.borderColor = [[UIColor whiteColor] CGColor];
//    nextButton.layer.borderWidth = 2;
    [nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextButton setTitle:@"Next" forState:UIControlStateNormal];
    [nextButton.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [nextButton.layer setMasksToBounds:YES];
    [nextButton.layer setCornerRadius:5.0];//设置矩形四个圆角半径
    [self addSubview:nextButton];
    [nextButton addTarget:self action:@selector(colorButton:) forControlEvents:UIControlEventTouchUpInside];
    nextButton.tag=5;
}

- (void)colorButton:(id)sender{
    UIButton *button=(UIButton *)sender;
    if (button.tag==1) {
        color=1;
        [UIView animateWithDuration:0.5f animations:^{
        tipsTextView.backgroundColor=[UIColor colorWithRed:255 green:120/255.f blue:120/255.f alpha:1];
        } completion:^(BOOL finished) {
            
        }];
    }else if (button.tag==2){
        color=2;
        [UIView animateWithDuration:0.5f animations:^{
            tipsTextView.backgroundColor=[UIColor colorWithRed:255 green:255 blue:120/255.f alpha:1];
        } completion:^(BOOL finished) {
            
        }];
    }else if (button.tag==3){
        color=3;
        [UIView animateWithDuration:0.5f animations:^{
            tipsTextView.backgroundColor=[UIColor colorWithRed:120/255.f green:255 blue:120/255.f alpha:1];
        } completion:^(BOOL finished) {
            
        }];
    }else if (button.tag==4){
        color=4;
        [UIView animateWithDuration:0.5f animations:^{
            tipsTextView.backgroundColor=[UIColor colorWithRed:120/255.f green:120/255.f blue:255 alpha:1];
        } completion:^(BOOL finished) {
            
        }];
    }else if (button.tag==0){
        [tipsTextView resignFirstResponder];
        [UIView animateWithDuration:0.2f animations:^{
            self.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        }];
        
        [UIView animateWithDuration:0.5f animations:^{
            self.frame=CGRectMake(0, -self.bounds.size.height, self.bounds.size.width, self.bounds.size.height);
            
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }else if (button.tag==5){
        if (isDone==0) {
            
            if (tipsTextView.text.length==0) {
                UIAlertView *alt=[[UIAlertView alloc]initWithTitle:nil message:@"Sorry, Content Cannot Be Nil" delegate:nil cancelButtonTitle:@"Write Something" otherButtonTitles:nil, nil];
                [alt show];
            }else{
                isDone=1;
                [tipsTextView resignFirstResponder];
                
                [UIView animateWithDuration:0.25f animations:^{
                    nextButton.alpha=0;
                    [nextButton setTitle:@"Done" forState:UIControlStateNormal];
                    [nextButton setBackgroundColor:[UIColor whiteColor]];
                    [nextButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                }completion:^(BOOL finished){
                    [UIView animateWithDuration:0.25f animations:^{
                        nextButton.alpha=1;
                    }];
                    
                }];
            }
            
        }else{
            NSLog(@"realDone");
            [self makeNotification];
            [self writeToPlist];
            
            [UIView animateWithDuration:0.5f animations:^{
                self.frame=CGRectMake(0, self.bounds.size.height, self.bounds.size.width, self.bounds.size.height);
                
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }
    }
}

- (void)makeNotification{
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
	
	// Get the current date
	NSDate *pickerDate = [self.datePicker date];
	
	// Break the date up into components
	NSDateComponents *dateComponents = [calendar components:( NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit )
												   fromDate:pickerDate];
	NSDateComponents *timeComponents = [calendar components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit )
												   fromDate:pickerDate];
	
	// Set up the fire time
    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
    [dateComps setDay:[dateComponents day]];
    [dateComps setMonth:[dateComponents month]];
    [dateComps setYear:[dateComponents year]];
    [dateComps setHour:[timeComponents hour]];
	// Notification will fire in one minute
    [dateComps setMinute:[timeComponents minute]];
	[dateComps setSecond:[timeComponents second]];
    NSDate *itemDate = [calendar dateFromComponents:dateComps];
	
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    if (localNotif == nil)
        return;
    localNotif.fireDate = itemDate;
    localNotif.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    localNotif.timeZone = [NSTimeZone defaultTimeZone];
	
	// Notification details
    localNotif.alertBody = [tipsTextView text];
	// Set the action button
    localNotif.alertAction = @"View";
	
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    localNotif.applicationIconBadgeNumber = 1;
	
	// Specify custom data for the notification
    NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"someValue" forKey:@"someKey"];
    localNotif.userInfo = infoDict;
	
	// Schedule the notification
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
}

- (void)writeToPlist{
    //获取应用程序沙盒的Documents目录
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *plistPath = [paths objectAtIndex:0];
    //得到完整的文件名
    NSString *filename=[plistPath stringByAppendingPathComponent:@"tips.plist"];
    //读出来看看
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:filename];
    [[data objectForKey:@"text"]addObject:tipsTextView.text];
    
    NSDate* now = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:now];
    NSInteger month=[comps month];
    NSInteger day=[comps day];
    NSInteger hour=[comps hour];
    NSInteger min=[comps minute];
    NSString *timeString=[NSString stringWithFormat:@"%ld-%ld %ld:%ld",(long)month,(long)day,(long)hour,(long)min];
    [[data objectForKey:@"time"]addObject:timeString];
    [[data objectForKey:@"color"]addObject:[NSString stringWithFormat:@"%d",color]];
    
    [data writeToFile:filename atomically:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NewTips" object:@"NewTips"];
}

@end