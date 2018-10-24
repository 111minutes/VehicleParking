//
//  ViewController.m
//  CarParking
//
//  Created by Andriy Fedin on 5/31/17.
//  Copyright © 2017 111 Minutes. All rights reserved.
//

#import "ViewController.h"
#import "CPParking.h"
#import "CPCar.h"
#import "CPTruck.h"

@interface ViewController ()

@property (strong, nonatomic) CPParking *parking;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.parking = [[CPParking alloc] initWithCarPlacesCount:2 truckPlacesCount:3];
    
    NSLog(@"%ld", (long)[self.parking parkCar:[CPCar new]]);
    NSLog(@"%ld", (long)[self.parking parkCar:[CPTruck new]]);
    NSLog(@"%ld", (long)[self.parking parkCar:[CPCar new]]);
    NSLog(@"%ld", (long)[self.parking parkCar:[CPTruck new]]);
    
    [self.parking unparkCarWithPlace:1];
    
}


@end
