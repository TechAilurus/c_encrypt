package com.mobileconnected.c_encrypt

import android.content.Context

object EncryptJNI {
  init {
    System.loadLibrary("cencrypt")
  }

  external fun appIDFromJNI(context: Context): String

  external fun signatureFromJNI(context: Context): String

  external fun versionNameFromJNI(context: Context): String
}