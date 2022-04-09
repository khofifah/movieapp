import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class ConnectionProvider extends ChangeNotifier {
  Connectivity connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> connectivitySubscription;
  bool isConnect = true;

  // subsConnectivity() {
  //   connectivitySubscription =
  //       connectivity.onConnectivityChanged.listen(checkConnectivity);
  //   notifyListeners();
  // }

  // unsubsConnectivity() {
  //   connectivitySubscription.cancel();
  //   notifyListeners();
  // }

  Future checkConnectivity() async {
    ConnectivityResult result = await connectivity.checkConnectivity();

    switch (result) {
      case ConnectivityResult.wifi:
        isConnect = true;
        break;
      case ConnectivityResult.mobile:
        isConnect = true;
        break;
      case ConnectivityResult.none:
        isConnect = false;
        break;
      default:
        isConnect = false;
        break;
    }
    notifyListeners();

    return isConnect;
  }

  // Future<void> _updateConnectionStatus(ConnectivityResult result) async {

  // }
}
