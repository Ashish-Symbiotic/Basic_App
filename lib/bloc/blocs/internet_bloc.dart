import 'dart:async';

import 'package:basic_app/bloc/event/internet_event.dart';
import 'package:basic_app/bloc/state/internet_state.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? streamSubscription;

  InternetBloc() : super(InternetInitialState()) {
    on<InteretLossEvent>((event, emit) => emit(InteretLossState()));
    on<InternetGainEvent>(
      (event, emit) => emit(InternetGainState()),
    );

    streamSubscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainEvent());
      } else {
        add(InteretLossEvent());
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
