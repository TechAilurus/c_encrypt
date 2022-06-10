import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'c_encrypt_platform_interface.dart';

/// An implementation of [CEncryptPlatform] that uses method channels.
class MethodChannelCEncrypt extends CEncryptPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('c_encrypt');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getAppId() async {
    final appId = await methodChannel.invokeMethod<String>('getAppId');
    return appId;
  }

  @override
  Future<String?> getAppSignature() async {
    final appSignature = await methodChannel.invokeMethod<String>('getAppSignature');
    return appSignature;
  }

  @override
  Future<String?> getAppVersionName() async {
    final appVersionName = await methodChannel.invokeMethod<String>('getAppVersionName');
    return appVersionName;
  }
}
