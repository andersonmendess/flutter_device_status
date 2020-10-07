
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterDeviceStatus {
  static const MethodChannel _channel =
      const MethodChannel('flutter_device_status');

  static Future<bool> get isBluetoothConnected async {
    return await _channel.invokeMethod('getBluetooth');
  }
}
