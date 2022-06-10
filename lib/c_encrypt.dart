
import 'c_encrypt_platform_interface.dart';

class CEncrypt {
  Future<String?> getPlatformVersion() {
    return CEncryptPlatform.instance.getPlatformVersion();
  }

  Future<String?> getAppId() {
    return CEncryptPlatform.instance.getAppId();
  }

  Future<String?> getAppSignature() {
    return CEncryptPlatform.instance.getAppSignature();
  }

  Future<String?> getAppVersionName() {
    return CEncryptPlatform.instance.getAppVersionName();
  }
}
