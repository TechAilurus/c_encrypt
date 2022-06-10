import 'package:c_encrypt/c_encrypt.dart';
import 'package:c_encrypt/c_encrypt_method_channel.dart';
import 'package:c_encrypt/c_encrypt_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCEncryptPlatform with MockPlatformInterfaceMixin implements CEncryptPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> getAppId() => Future.value('appId');
}

void main() {
  final CEncryptPlatform initialPlatform = CEncryptPlatform.instance;

  test('$MethodChannelCEncrypt is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCEncrypt>());
  });

  test('getPlatformVersion', () async {
    CEncrypt cEncryptPlugin = CEncrypt();
    MockCEncryptPlatform fakePlatform = MockCEncryptPlatform();
    CEncryptPlatform.instance = fakePlatform;

    expect(await cEncryptPlugin.getPlatformVersion(), '42');
  });
}
