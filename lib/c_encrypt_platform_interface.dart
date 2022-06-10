import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'c_encrypt_method_channel.dart';

abstract class CEncryptPlatform extends PlatformInterface {
  /// Constructs a CEncryptPlatform.
  CEncryptPlatform() : super(token: _token);

  static final Object _token = Object();

  static CEncryptPlatform _instance = MethodChannelCEncrypt();

  /// The default instance of [CEncryptPlatform] to use.
  ///
  /// Defaults to [MethodChannelCEncrypt].
  static CEncryptPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CEncryptPlatform] when
  /// they register themselves.
  static set instance(CEncryptPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getAppId() {
    throw UnimplementedError('getAppId() has not been implemented.');
  }

  Future<String?> getAppSignature() {
    throw UnimplementedError('getAppSignature() has not been implemented.');
  }

  Future<String?> getAppVersionName() {
    throw UnimplementedError('getAppVersionName() has not been implemented.');
  }
}
