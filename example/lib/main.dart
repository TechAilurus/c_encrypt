import 'dart:async';

import 'package:c_encrypt/c_encrypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

const strToBeEncrypt = 'Hello world, 你好 世界 Hello ';
const strToBeDecrypt = 'b3e922c0aab2bb09de6f7d708232d032cd73c0e651ada96207a81cfb071e6448';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _appId = "Unknown";
  String _appSignature = "Unknown";
  String _appVersionName = "Unknown";
  String _encryptedStr = 'Unknown';
  String _decryptedStr = 'Unknown';
  String _loginNonceStr = "Unknown";

  final _cEncryptPlugin = CEncrypt();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    String appId;
    String appSignature;
    String appVersionName;
    String encryptedStr;
    String decryptedStr;
    String loginNonce;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _cEncryptPlugin.getPlatformVersion() ?? 'Unknown platform version';
      appId = await _cEncryptPlugin.getAppId() ?? 'Unknown app id';
      appSignature = await _cEncryptPlugin.getAppSignature() ?? 'Unknown app signature';
      appVersionName = await _cEncryptPlugin.getAppVersionName() ?? 'Unknown app version name';
      encryptedStr = await _cEncryptPlugin.encryptByAES(strToBeEncrypt) ?? 'Unknown encrypt str';
      decryptedStr = await _cEncryptPlugin.decryptByAES(strToBeDecrypt) ?? 'Unknown decrypt str';
      loginNonce = await _cEncryptPlugin.generateLoginNonce("Hello World") ?? "null returned";
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
      appId = 'Failed to get app id';
      appSignature = 'Failed to get app signature';
      appVersionName = 'Failed to get app version name';
      encryptedStr = 'Failed to encrypt str';
      decryptedStr = 'Failed to decrypt str';
      loginNonce = "Failed to get login nonce";
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _appId = appId;
      _appSignature = appSignature;
      _appVersionName = appVersionName;
      _encryptedStr = encryptedStr;
      _decryptedStr = decryptedStr;
      _loginNonceStr = loginNonce;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Running on:\n $_platformVersion\n'),
              Text('Application ID is:\n $_appId\n'),
              Text('Application Signature is:\n $_appSignature\n'),
              Text('Application Version Name is:\n $_appVersionName\n'),
              GestureDetector(
                onTap: () {
                  initPlatformState();
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('login nonce is :\n $_loginNonceStr\n length is ${_loginNonceStr.length}'),
                ),
              ),
              const SizedBox(width: double.infinity, height: 10),
              const Text("加密前文字：$strToBeEncrypt"),
              const SizedBox(width: double.infinity, height: 10),
              Text("加密后文字\n$_encryptedStr"),
              const SizedBox(width: double.infinity, height: 10),
              const Text("解密前文字：$strToBeDecrypt"),
              const SizedBox(width: double.infinity, height: 10),
              Text("解密后文字：$_decryptedStr"),
            ],
          ),
        ),
      ),
    );
  }
}
