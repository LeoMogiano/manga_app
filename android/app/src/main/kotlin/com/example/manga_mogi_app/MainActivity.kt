package com.example.manga_mogi_app

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val CHANNEL = "manga_mogi.app.channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            handleMethodCall(call, result)
        }
    }

    private fun handleMethodCall(call: MethodCall, result: MethodChannel.Result) {
        val methods: Map<String, () -> Unit> = mapOf(
            "getPlatformVersion" to { getPlatformVersion(result) }
        )
        methods[call.method]?.invoke() ?: result.notImplemented()
    }

    private fun getPlatformVersion(result: MethodChannel.Result) {
        result.success("Android " + android.os.Build.VERSION.RELEASE)
    }
}