//
//  CPParking.h
//  CarParking
//
//  Created by Andriy Fedin on 5/31/17.
//  Copyright © 2017 111 Minutes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPVehicleProtocol.h"

@interface CPParking : NSObject

- (id)init __attribute__((unavailable("Must use initWithCarPlacesCount:truckPlacesCount: instead.")));

- (id)initWithCarPlacesCount:(NSUInteger)maxCarPlaces truckPlacesCount:(NSUInteger)maxTruckPlaces;
- (NSInteger)parkCar:(id<CPVehicleProtocol>)car;
- (void)unparkCarWithPlace:(NSUInteger)place;

@end
