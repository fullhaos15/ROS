import 'package:flutter/material.dart';
import '../models/workout.dart';
import 'timer_screen.dart';

class WorkoutDetailScreen extends StatelessWidget {
  final Workout workout;
  const WorkoutDetailScreen({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Stack + Positioned
          Container(
            height: 260,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [workout.color, workout.color.withValues(alpha: 0.6)],
              ),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(36)),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 20,
                  top: 70,
                  child: Icon(workout.icon,
                      size: 140, color: Colors.white.withValues(alpha: 0.3)),
                ),
                Positioned(
                  top: 48,
                  left: 12,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  left: 24,
                  bottom: 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(workout.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w800)),
                      const SizedBox(height: 6),
                      Text('${workout.category} • ${workout.level}',
                          style: const TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _stat(Icons.timer, '${workout.minutes} мин'),
                _stat(Icons.local_fire_department, '${workout.kcal} ккал'),
                _stat(Icons.list, '${workout.exercises.length} упр.'),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: workout.exercises.length,
              itemBuilder: (_, i) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: workout.color.withValues(alpha: 0.15),
                  child: Text('${i + 1}', style: TextStyle(color: workout.color)),
                ),
                title: Text(workout.exercises[i]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                // Анонимный маршрут + параметр через конструктор.
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => TimerScreen(workout: workout)),
                ),
                child: const Text('Начать тренировку'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _stat(IconData icon, String text) => Column(
        children: [
          Icon(icon),
          const SizedBox(height: 4),
          Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      );
}
