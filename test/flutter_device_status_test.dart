import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_device_status/flutter_device_status.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_device_status');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return false;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getBluetooth', () async {
    expect(await FlutterDeviceStatus.isBluetoothConnected, false);
  });
}
