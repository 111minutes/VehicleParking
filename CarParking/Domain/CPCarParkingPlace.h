//
//  CPCarParkingPlace.h
//  CarParking
//
//  Created by Andriy Fedin on 5/31/17.
//  Copyright © 2017 111 Minutes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPVehicleProtocol.h"
//#import "CPParkingPlaceProtocol.h"

@interface CPCarParkingPlace : NSObject

@property (nonatomic, assign) NSArray<Class<CPVehicleProtocol>> *vehicleClasses;
@property (nonatomic, strong) id<CPVehicleProtocol> car;

- (id) init __attribute__((unavailable("Must use initWithVehicleClasses: instead.")));

- (BOOL)isEmpty;
- (id)initWithVehicleClasses:(NSArray<Class<CPVehicleProtocol>> *)vehicleClasses;
- (BOOL)canPark:(id<CPVehicleProtocol>)vehicle;

@end
