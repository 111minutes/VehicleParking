//
//  CPCarParkingPlace.m
//  CarParking
//
//  Created by Andriy Fedin on 5/31/17.
//  Copyright © 2017 111 Minutes. All rights reserved.
//

#import "CPCarParkingPlace.h"

@interface CPCarParkingPlace ()

@end

@implementation CPCarParkingPlace

- (id)initWithVehicleClasses:(NSArray<Class<CPVehicleProtocol>> *)vehicleClasses
{
    if (self = [super init]) {
        self.vehicleClasses = vehicleClasses;
    }
    return self;
}

- (BOOL)isEmpty
{
    return !self.car;
}

- (BOOL)canPark:(id<CPVehicleProtocol>)vehicle
{
    if (![self isEmpty]) {
        return NO;
    }
    
    for (Class vehicleClass in self.vehicleClasses) {
        if ([vehicle isKindOfClass:vehicleClass]) {
            return YES;
        }
    }
    return NO;
}

@end
