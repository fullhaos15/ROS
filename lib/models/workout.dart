import 'package:flutter/material.dart';

class Workout {
  final String title;
  final String category;
  final String level;
  final int minutes;
  final int kcal;
  final IconData icon;
  final Color color;
  final List<String> exercises;

  const Workout({
    required this.title,
    required this.category,
    required this.level,
    required this.minutes,
    required this.kcal,
    required this.icon,
    required this.color,
    required this.exercises,
  });
}
