import 'package:flutter/material.dart';
import 'models/workout.dart';
import 'screens/main_shell.dart';
import 'screens/workout_detail_screen.dart';
import 'theme.dart';

void main() => runApp(const FitLifeApp());

/// Урок «Структура приложения» + «Stateless виджеты».
class FitLifeApp extends StatelessWidget {
  const FitLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitLife',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      initialRoute: '/',
      // Урок «Передача параметров в маршруте» — onGenerateRoute.
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const MainShell());
          case '/detail':
            final workout = settings.arguments as Workout;
            return MaterialPageRoute(
                builder: (_) => WorkoutDetailScreen(workout: workout));
        }
        return null;
      },
    );
  }
}
