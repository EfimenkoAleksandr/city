//
//  ViewController.m
//  Cities
//
//  Created by mac on 03.04.2018.
//  Copyright © 2018 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property NSArray *countrys;
@property NSArray *regions;
@property NSArray *citys;
@property NSString *strRegion,*strCity;
@property (nonatomic) NSInteger compHeight,rowWidth;
@property (weak, nonatomic) IBOutlet UITextField *countryTextFild;
@property (weak, nonatomic) IBOutlet UITextField *regionTextFild;
@property (weak, nonatomic) IBOutlet UITextField *cityTextFild;
@property (weak, nonatomic) IBOutlet UIPickerView *countriPicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.countrys=@[@"Ukraine",@"Belarus",@"Poland",@"Georgia"];
   // self.regions=@[@"nul"];
   // self.citys=@[@"nul"];
    self.countriPicker.dataSource=self;
    self.countriPicker.delegate=self;
    self.compHeight=0;
    self.rowWidth=0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSInteger count=0;
    if(component==0){
        count= self.countrys.count;
    }
    if(component==1){
        count= self.regions.count;
    }
    if(component==2){
        count= self.citys.count;
    }
    return count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *rowv;
    self.compHeight=component;
    self.rowWidth=row;
    if(self.compHeight==0){
        rowv= self.countrys[self.rowWidth];
        [self rowRegion:self.rowWidth];
        [self rowCity:[self rowRegion:self.rowWidth]];
    }
    if(self.compHeight==1){
         rowv= self.regions[self.rowWidth];
 
   //      [self rowCity:row];
    }
    if(self.compHeight==2){
         rowv= self.citys[self.rowWidth];
    }
    return rowv;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        [self.countryTextFild setText:self.countrys[row]];
    }
    if (component == 1) {
        [self.regionTextFild setText:self.regions[row]];
    }
    if(component== 2){
        [self.cityTextFild setText:self.citys[row]];
    }
}

-(NSInteger)rowRegion:(NSInteger)rowNumber{
    NSInteger buf=0;
    switch (rowNumber) {
        case 0:
            {
                self.regions=@[@"Zaporozka",@"Xarkovska",@"Dneprovska",@"Kievska"];
            }
            buf=0;
            break;
        case 1:
        {
            self.regions=@[@"Belaruska",@"Belaruska",@"Belaruska",@"Belaruska"];
        }
            buf=1;
            break;
        case 2:
        {
            self.regions=@[@"Polska",@"Polska",@"Polska",@"Polska"];
        }
            buf=2;
            break;
        case 3:
        {
            self.regions=@[@"Gruzinska",@"Gruzinska",@"Gruzinska",@"Gruzinska"];
        }
            buf=3;
            break;
    }
    return buf;
}

-(void)rowCity:(NSInteger)rowNumber{
    switch (rowNumber) {
        case 0:
        {
            self.citys=@[@"Zaporoziza",@"Melitopol",@"Vasilivka",@"Berdansk"];
        }
            break;
        case 1:
        {
            self.citys=@[@"Belarus",@"Belarus",@"Belarus",@"Belarus"];
        }
            break;
        case 2:
        {
            self.citys=@[@"Pols",@"Pols",@"Pols",@"Pols"];
        }
            break;
        case 3:
        {
            self.citys=@[@"Gruzins",@"Gruzins",@"Gruzins",@"Gruzins"];
        }
            break;
    }
}

@end
