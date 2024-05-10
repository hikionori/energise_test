import 'package:energise_test/controllers/stopwatch/stopwatch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StopwatchButton extends StatelessWidget {
  const StopwatchButton({
    super.key,
    required AnimationController buttonController,
    required AnimationController timerController,
    required this.state,
  })  : _buttonController = buttonController,
        _timerController = timerController;

  final AnimationController _buttonController;
  final AnimationController _timerController;
  final StopwatchState state;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (state is StopwatchRunning) {
          context.read<StopwatchCubit>().stopTimer();
          _buttonController.repeat(reverse: true);
          _timerController.stop();
        } else {
          context.read<StopwatchCubit>().startTimer();
          _buttonController.stop();
          _timerController.repeat(reverse: true);
        }
      },
      child: AnimatedBuilder(
        animation: _buttonController,
        builder: (context, child) {
          return Container(
            width: 100 * (1 + (_buttonController.value * 0.1)),
            height: 100 * (1 + (_buttonController.value * 0.1)),
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: child,
          );
        },
        child: BlocConsumer<StopwatchCubit, StopwatchState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Icon(
              state is StopwatchRunning
                  ? Icons.pause_circle
                  : Icons.play_circle,
              color: Colors.white,
              size: 50,
            );
          },
        ),
      ),
    );
  }
}
