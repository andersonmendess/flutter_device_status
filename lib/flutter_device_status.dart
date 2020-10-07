import 'dart:async';

import 'package:flutter/services.dart';

class FlutterDeviceStatus {
  static const MethodChannel _channel =
      const MethodChannel('flutter_device_status');

  static Future<bool> get isBluetoothConnected async {
    return await _channel.invokeMethod('bt_isConnected');
  }

  static Future<bool> get isBluetoothEnabled async {
    return await _channel.invokeMethod('bt_isOn');
  }

  static Future<bool> get isBluetoothSupported async {
    return await _channel.invokeMethod('bt_isSupported');
  }

  static Future<bool> get enableBluetooth async {
    return await _channel.invokeMethod('bt_enable');
  }
}
