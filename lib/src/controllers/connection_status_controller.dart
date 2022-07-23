import 'dart:async';

import 'package:detection/main.dart';
import 'package:detection/src/models/internet_model.dart';
import 'package:get/get.dart';

class ConnectionStatusController extends GetxController {
  late StreamSubscription _connectionSubscription;

  final status = Rx<ConnectionStatus>(ConnectionStatus.online);

  ConnectionStatusController() {
    _connectionSubscription = internetChecker
        .internetStatus()
        .listen((newStatus) => status.value = newStatus);
  }

  @override
  void dispose() {
    _connectionSubscription.cancel();
    super.dispose();
  }
}
