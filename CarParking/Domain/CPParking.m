//
//  CPParking.m
//  CarParking
//
//  Created by Andriy Fedin on 5/31/17.
//  Copyright © 2017 111 Minutes. All rights reserved.
//

#import "CPParking.h"
#import "CPVehicleProtocol.h"
#import "CPCarParkingPlace.h"
#import "CPCar.h"
#import "CPTruck.h"


@interface CPParking ()

@property (strong, nonatomic) NSMutableArray<CPCarParkingPlace *> *parikingPlaces;

@end


@implementation CPParking

- (id)initWithCarPlacesCount:(NSUInteger)maxCarPlaces truckPlacesCount:(NSUInteger)maxTruckPlaces {
    if (self = [super init]) {
        self.parikingPlaces = [NSMutableArray<CPCarParkingPlace *> new];
        
        for (int i = 0; i < maxCarPlaces; i++) {
            NSMutableArray<CPVehicleProtocol> *classes = [NSMutableArray<CPVehicleProtocol> arrayWithObjects:[CPCar class], nil];
            [self.parikingPlaces addObject:[[CPCarParkingPlace alloc] initWithVehicleClasses:classes]];
        }
        
        for (int i = 0; i < maxTruckPlaces; i++) {
            NSMutableArray<CPVehicleProtocol> *classes = [NSMutableArray<CPVehicleProtocol> arrayWithObjects:[CPTruck class], [CPCar class], nil];
            [self.parikingPlaces addObject:[[CPCarParkingPlace alloc] initWithVehicleClasses:classes]];
        }
    }
    return self;
}

- (NSInteger)parkCar:(id<CPVehicleProtocol>)car
{
    for (int i = 0; i < self.parikingPlaces.count; i++) {
        if ([self.parikingPlaces[i] canPark:car]) {
            self.parikingPlaces[i].car = car;
            [self logState];
            return i;
        }
    }
    [self logState];
    return -1;
}

- (void)unparkCarWithPlace:(NSUInteger)place
{
    if (place > self.parikingPlaces.count - 1) {
        return;
    }
    
    self.parikingPlaces[place].car = nil;
    
    [self logState];
}

- (void)logState
{
    NSLog(@"\n\nparking state");
    for (int i = 0; i < self.parikingPlaces.count; i++) {
        NSLog(@"Place %i %@", i, [self.parikingPlaces[i] isEmpty] ? @"empty" : @"occupied");
    }
}

@end
