import 'package:energise_test/controllers/stopwatch/stopwatch_cubit.dart';
import 'package:flutter/material.dart';

class StopwatchDisplay extends StatelessWidget {
  const StopwatchDisplay({
    super.key,
    required AnimationController timerController,
    required this.state,
  }) : _timerController = timerController;

  final AnimationController _timerController;
  final StopwatchState state;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _timerController,
      builder: (context, child) {
        return Text(
          Duration(seconds: state.elapsed ?? 0)
              .toString()
              .split('.')
              .first
              .padLeft(8, "0"),
          style: TextStyle(
            fontSize: 30 * (1 + (_timerController.value * 0.1)),
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}
