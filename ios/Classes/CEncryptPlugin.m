#import "CEncryptPlugin.h"
#if __has_include(<c_encrypt/c_encrypt-Swift.h>)
#import <c_encrypt/c_encrypt-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "c_encrypt-Swift.h"
#endif

@implementation CEncryptPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCEncryptPlugin registerWithRegistrar:registrar];
}
@end
