package com.example.guardia // Replace with your package name

import android.Manifest
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.util.Log
import androidx.annotation.NonNull
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.guardia/panicGesture"
    private val REQUEST_CALL_PERMISSION = 1
    private val handler = Handler(Looper.getMainLooper())
    private var pressCount = 0

    private val powerButtonReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            if (Intent.ACTION_SCREEN_OFF == intent?.action) {
                pressCount++
                handler.postDelayed({
                    pressCount = 0 // Reset the count after 2 seconds
                }, 2000)

                if (pressCount == 2) {
                    requestCallPermission("8921201498") // Emergency number
                }
            }
        }
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "startListening") {
                startListeningForPowerButton()
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun startListeningForPowerButton() {
        val filter = IntentFilter(Intent.ACTION_SCREEN_OFF)
        registerReceiver(powerButtonReceiver, filter)
    }

    private fun requestCallPermission(number: String) {
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.CALL_PHONE) != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.CALL_PHONE), REQUEST_CALL_PERMISSION)
        } else {
            makeEmergencyCall(number)
        }
    }

    private fun makeEmergencyCall(number: String) {
        val callIntent = Intent(Intent.ACTION_CALL)
        callIntent.data = Uri.parse("tel:$number")
        startActivity(callIntent)
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (requestCode == REQUEST_CALL_PERMISSION && grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
            makeEmergencyCall("8921201498") // Emergency number
        } else {
            Log.d("MainActivity", "Call permission denied")
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        unregisterReceiver(powerButtonReceiver)
    }
}
