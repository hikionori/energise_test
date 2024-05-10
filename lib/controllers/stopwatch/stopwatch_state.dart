part of 'stopwatch_cubit.dart';

@immutable
sealed class StopwatchState extends Equatable {
  final int? elapsed;
  const StopwatchState({this.elapsed});
}

final class StopwatchInitial extends StopwatchState {
  const StopwatchInitial() : super(elapsed: 0);

  @override
  List<Object> get props => [elapsed as Object];
}

final class StopwatchRunning extends StopwatchState {
  const StopwatchRunning(int? elapsed) : super(elapsed: elapsed);

  @override
  List<Object> get props => [elapsed as Object];
}
