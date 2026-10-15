import 'package:flutter/material.dart';
import '../models/workout.dart';

const categories = ['Кардио', 'Силовые', 'Йога', 'Растяжка'];

const workouts = <Workout>[
  Workout(
    title: 'Утренний бег',
    category: 'Кардио',
    level: 'Начальный',
    minutes: 30,
    kcal: 280,
    icon: Icons.directions_run,
    color: Color(0xFFFF5A36),
    exercises: ['Разминка 5 мин', 'Лёгкий бег 20 мин', 'Заминка 5 мин'],
  ),
  Workout(
    title: 'HIIT 20',
    category: 'Кардио',
    level: 'Средний',
    minutes: 20,
    kcal: 320,
    icon: Icons.bolt,
    color: Color(0xFFFFA000),
    exercises: ['Берпи 40 сек', 'Прыжки на месте 40 сек', 'Скалолаз 40 сек', 'Отдых 20 сек'],
  ),
  Workout(
    title: 'Грудь и трицепс',
    category: 'Силовые',
    level: 'Средний',
    minutes: 45,
    kcal: 350,
    icon: Icons.fitness_center,
    color: Color(0xFF5C6BC0),
    exercises: ['Жим лёжа 4x10', 'Отжимания на брусьях 3x12', 'Разводка гантелей 3x12'],
  ),
  Workout(
    title: 'Ноги и ягодицы',
    category: 'Силовые',
    level: 'Продвинутый',
    minutes: 50,
    kcal: 420,
    icon: Icons.accessibility_new,
    color: Color(0xFF26A69A),
    exercises: ['Приседания 4x12', 'Выпады 3x10', 'Румынская тяга 3x10'],
  ),
  Workout(
    title: 'Йога для начинающих',
    category: 'Йога',
    level: 'Начальный',
    minutes: 25,
    kcal: 120,
    icon: Icons.self_improvement,
    color: Color(0xFF8E24AA),
    exercises: ['Поза горы', 'Собака мордой вниз', 'Поза воина', 'Шавасана'],
  ),
  Workout(
    title: 'Растяжка перед сном',
    category: 'Растяжка',
    level: 'Начальный',
    minutes: 15,
    kcal: 60,
    icon: Icons.nightlight_round,
    color: Color(0xFF00897B),
    exercises: ['Наклоны вперёд', 'Растяжка спины', 'Растяжка бёдер'],
  ),
];

IconData categoryIcon(String c) {
  switch (c) {
    case 'Кардио':
      return Icons.favorite;
    case 'Силовые':
      return Icons.fitness_center;
    case 'Йога':
      return Icons.self_improvement;
    default:
      return Icons.accessibility_new;
  }
}
