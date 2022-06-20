package com.mobileconnected.c_encrypt

import android.content.Context
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


const val TAG = "CEncryptPlugin"

/** CEncryptPlugin */
class CEncryptPlugin : FlutterPlugin, MethodCallHandler {
  private lateinit var channel: MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "c_encrypt")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    Log.e(TAG, "method is ${call.method}")
    when (call.method) {
      "getPlatformVersion" -> {
        result.success("Android ${android.os.Build.VERSION.RELEASE}")
      }
      "getAppId" -> {
        result.success(EncryptJNI.appIDFromJNI(context))
      }
      "getAppSignature" -> {
        result.success(EncryptJNI.signatureFromJNI(context))
      }
      "getAppVersionName" -> {
        result.success(EncryptJNI.versionNameFromJNI(context))
      }
      "decryptByAES" -> {
        result.success(EncryptJNI.decryptFromJNI(context,call.arguments<String>()!!))
      }
      "encryptByAES" -> {
        result.success(EncryptJNI.encryptFromJNI(context,call.arguments<String>()!!))
      }
      else -> {
        result.notImplemented()
      }
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
