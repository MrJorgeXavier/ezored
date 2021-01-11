// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from proj.djinni

#import "ezored/core/EZRCoreApplicationCore+Private.h"
#import "ezored/core/EZRCoreApplicationCore.h"
#import "DJICppWrapperCache+Private.h"
#import "DJIError.h"
#import "DJIMarshal+Private.h"
#import "ezored/domain/EZRDomainCustomer+Private.h"
#import "ezored/domain/EZRDomainDeviceData+Private.h"
#import "ezored/domain/EZRDomainInitializationData+Private.h"
#include <exception>
#include <stdexcept>
#include <utility>

static_assert(__has_feature(objc_arc), "Djinni requires ARC to be enabled for this file");

@interface EZRCoreApplicationCore ()

- (id)initWithCpp:(const std::shared_ptr<::ezored::core::ApplicationCore>&)cppRef;

@end

@implementation EZRCoreApplicationCore {
    ::djinni::CppProxyCache::Handle<std::shared_ptr<::ezored::core::ApplicationCore>> _cppRefHandle;
}

- (id)initWithCpp:(const std::shared_ptr<::ezored::core::ApplicationCore>&)cppRef
{
    if (self = [super init]) {
        _cppRefHandle.assign(cppRef);
    }
    return self;
}

+ (nullable EZRCoreApplicationCore *)shared {
    try {
        auto objcpp_result_ = ::ezored::core::ApplicationCore::shared();
        return ::djinni_generated::ApplicationCore::fromCpp(objcpp_result_);
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

- (void)initialize:(nonnull EZRDomainInitializationData *)initializationData
        deviceData:(nonnull EZRDomainDeviceData *)deviceData {
    try {
        _cppRefHandle.get()->initialize(::djinni_generated::InitializationData::toCpp(initializationData),
                                        ::djinni_generated::DeviceData::toCpp(deviceData));
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

- (nonnull EZRDomainInitializationData *)getInitializationData {
    try {
        auto objcpp_result_ = _cppRefHandle.get()->getInitializationData();
        return ::djinni_generated::InitializationData::fromCpp(objcpp_result_);
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

- (nonnull EZRDomainDeviceData *)getDeviceData {
    try {
        auto objcpp_result_ = _cppRefHandle.get()->getDeviceData();
        return ::djinni_generated::DeviceData::fromCpp(objcpp_result_);
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

- (nonnull EZRDomainCustomer *)getCustomer {
    try {
        auto objcpp_result_ = _cppRefHandle.get()->getCustomer();
        return ::djinni_generated::Customer::fromCpp(objcpp_result_);
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

- (void)setCustomer:(nonnull EZRDomainCustomer *)customer {
    try {
        _cppRefHandle.get()->setCustomer(::djinni_generated::Customer::toCpp(customer));
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

- (nonnull NSString *)getVersion {
    try {
        auto objcpp_result_ = _cppRefHandle.get()->getVersion();
        return ::djinni::String::fromCpp(objcpp_result_);
    } DJINNI_TRANSLATE_EXCEPTIONS()
}

namespace djinni_generated {

auto ApplicationCore::toCpp(ObjcType objc) -> CppType
{
    if (!objc) {
        return nullptr;
    }
    return objc->_cppRefHandle.get();
}

auto ApplicationCore::fromCppOpt(const CppOptType& cpp) -> ObjcType
{
    if (!cpp) {
        return nil;
    }
    return ::djinni::get_cpp_proxy<EZRCoreApplicationCore>(cpp);
}

}  // namespace djinni_generated

@end
