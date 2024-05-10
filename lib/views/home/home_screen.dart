import 'package:energise_test/controllers/stopwatch/stopwatch_cubit.dart';
import 'package:energise_test/views/home/widgets/stopwatch_button.dart';
import 'package:energise_test/views/home/widgets/stopwatch_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController _buttonController;
  late final AnimationController _timerController;

  @override
  void initState() {
    super.initState();
    _buttonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
    _timerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _buttonController.dispose();
    _timerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<StopwatchCubit, StopwatchState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StopwatchButton(
                    buttonController: _buttonController,
                    timerController: _timerController,
                    state: state),
                const SizedBox(height: 20),
                StopwatchDisplay(
                    timerController: _timerController, state: state),
              ],
            ),
          );
        },
      ),
    );
  }
}