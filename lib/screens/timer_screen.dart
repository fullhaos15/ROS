import 'dart:async';
import 'package:flutter/material.dart';
import '../models/workout.dart';
import '../theme.dart';

class TimerScreen extends StatefulWidget {
  final Workout workout;
  const TimerScreen({super.key, required this.workout});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late final int _total = widget.workout.minutes * 60;
  late int _left = _total;
  Timer? _timer;
  bool _running = false;

  void _toggle() {
    if (_running) {
      _timer?.cancel();
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (t) {
        if (_left <= 0) {
          t.cancel();
          setState(() => _running = false);
          return;
        }
        setState(() => _left--);
      });
    }
    setState(() => _running = !_running);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _time {
    final m = (_left ~/ 60).toString().padLeft(2, '0');
    final s = (_left % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.workout.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 240,
              height: 240,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox.expand(
                    child: CircularProgressIndicator(
                      value: 1 - _left / _total,
                      strokeWidth: 12,
                      color: AppColors.primary,
                      backgroundColor: Colors.black12,
                    ),
                  ),
                  Text(_time,
                      style: Theme.of(context).textTheme.headlineMedium),
                ],
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: _toggle,
              icon: Icon(_running ? Icons.pause : Icons.play_arrow),
              label: Text(_running ? 'Пауза' : 'Старт'),
            ),
          ],
        ),
      ),
    );
  }
}
