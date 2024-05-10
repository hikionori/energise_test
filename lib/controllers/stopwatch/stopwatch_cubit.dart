import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wakelock/wakelock.dart';

part 'stopwatch_state.dart';

class StopwatchCubit extends Cubit<StopwatchState> {
  StopwatchCubit() : super(const StopwatchInitial());

  Timer? _timer;

  startTimer([int? time]) {
    Wakelock.enable();

    if (time != null) {
      emit(StopwatchRunning(time));
    } else {
      emit(StopwatchRunning(state.elapsed));
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      onTick(timer);
    });
  }

  stopTimer() {
    Wakelock.disable();
    _timer?.cancel();
    emit(const StopwatchInitial());
  }

  onTick(Timer timer) {
    emit(StopwatchRunning(state.elapsed! + 1));
  }
}
