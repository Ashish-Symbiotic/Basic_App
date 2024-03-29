import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetCubitStateEnum { initial, gained, lost }

class InternetCubitState extends Cubit<InternetCubitStateEnum> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? streamSubscriptionConnect;

  InternetCubitState() : super(InternetCubitStateEnum.initial) {
    streamSubscriptionConnect =
        _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        emit(InternetCubitStateEnum.gained);
      } else {
        emit(InternetCubitStateEnum.lost);
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscriptionConnect?.cancel();
    return super.close();
  }
}
