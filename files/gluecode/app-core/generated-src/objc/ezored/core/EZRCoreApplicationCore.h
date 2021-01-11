// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from proj.djinni

#import "ezored/domain/EZRDomainCustomer.h"
#import "ezored/domain/EZRDomainDeviceData.h"
#import "ezored/domain/EZRDomainInitializationData.h"
#import <Foundation/Foundation.h>
@class EZRCoreApplicationCore;


@interface EZRCoreApplicationCore : NSObject

+ (nullable EZRCoreApplicationCore *)shared;

- (void)initialize:(nonnull EZRDomainInitializationData *)initializationData
        deviceData:(nonnull EZRDomainDeviceData *)deviceData;

- (nonnull EZRDomainInitializationData *)getInitializationData;

- (nonnull EZRDomainDeviceData *)getDeviceData;

- (nonnull EZRDomainCustomer *)getCustomer;

- (void)setCustomer:(nonnull EZRDomainCustomer *)customer;

- (nonnull NSString *)getVersion;

@end
