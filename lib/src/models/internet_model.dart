import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rxdart/rxdart.dart';

enum ConnectionStatus {
  online,
  offline,
}

class CheckInternetConnection {
  final Connectivity _connectivity = Connectivity();
  final _controller = BehaviorSubject.seeded(ConnectionStatus.online);
}
