import 'package:flutter/material.dart';
import '../data/workouts.dart';
import '../theme.dart';
import '../widgets/workout_card.dart';

class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({super.key});

  @override
  State<WorkoutsScreen> createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  String? _selected; // null = все

  @override
  Widget build(BuildContext context) {
    final list = _selected == null
        ? workouts
        : workouts.where((w) => w.category == _selected).toList();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Тренировки', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _chip('Все', null),
                for (final c in categories) _chip(c, c),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: list.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, i) => WorkoutCard(workout: list[i]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(String label, String? value) {
    final active = _selected == value;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: active,
        selectedColor: AppColors.primary,
        labelStyle: TextStyle(color: active ? Colors.white : AppColors.dark),
        onSelected: (_) => setState(() => _selected = value),
      ),
    );
  }
}
