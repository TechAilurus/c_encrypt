import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:c_encrypt/c_encrypt_method_channel.dart';

void main() {
  MethodChannelCEncrypt platform = MethodChannelCEncrypt();
  const MethodChannel channel = MethodChannel('c_encrypt');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
