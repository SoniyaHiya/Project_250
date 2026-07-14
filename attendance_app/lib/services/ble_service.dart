import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BleService {

Future<bool> isBluetoothOn() async {
    return await FlutterBluePlus.adapterState.first ==
        BluetoothAdapterState.on;
  }
}