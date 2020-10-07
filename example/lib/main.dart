import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_device_status/flutter_device_status.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isBtConnected = false;

  @override
  void initState() {
    super.initState();
    checkBluetooth();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> checkBluetooth() async {
    bool isBtConnected;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      isBtConnected = await FlutterDeviceStatus.isBluetoothConnected;
    } on PlatformException {
      isBtConnected = false;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _isBtConnected = isBtConnected;
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
          child: Text("The Bluetooth is ${_isBtConnected ? "Connected":"Disconnected"}!"),
        ),
      ),
    );
  }
}
