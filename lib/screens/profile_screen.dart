import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/history_service.dart';
import '../theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _water = 3;
  static const _waterGoal = 8;
  static const _steps = 6400;
  static const _stepsGoal = 10000;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text('Профиль',
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
              IconButton(
                tooltip: 'Выйти',
                icon: const Icon(Icons.logout),
                onPressed: () => FirebaseAuth.instance.signOut(),
              ),
            ],
          ),
          Text(FirebaseAuth.instance.currentUser?.email ?? '',
              style: const TextStyle(color: Colors.black54)),
          const SizedBox(height: 20),
          const Row(
            children: [
              Expanded(child: _InfoTile(title: 'Вес', value: '72 кг')),
              SizedBox(width: 12),
              Expanded(child: _InfoTile(title: 'Рост', value: '178 см')),
              SizedBox(width: 12),
              Expanded(child: _InfoTile(title: 'ИМТ', value: '22.7')),
            ],
          ),
          const SizedBox(height: 24),
          const Text('Шаги сегодня',
              style: TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          _progress(_steps / _stepsGoal),
          const SizedBox(height: 4),
          const Text('$_steps / $_stepsGoal'),
          const SizedBox(height: 24),
          Text('Вода: $_water / $_waterGoal стаканов',
              style: const TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          _progress(_water / _waterGoal),
          const SizedBox(height: 12),
          Row(
            children: [
              IconButton.filledTonal(
                onPressed: _water > 0 ? () => setState(() => _water--) : null,
                icon: const Icon(Icons.remove),
              ),
              const SizedBox(width: 12),
              IconButton.filled(
                style: IconButton.styleFrom(backgroundColor: AppColors.primary),
                onPressed:
                    _water < _waterGoal ? () => setState(() => _water++) : null,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text('История тренировок',
              style: TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: HistoryService.latest(),
            builder: (context, snap) {
              final docs = snap.data?.docs ?? [];
              if (docs.isEmpty) {
                return const Text('Пока пусто — завершите первую тренировку');
              }
              return Column(
                children: [
                  for (final d in docs)
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.check_circle,
                          color: AppColors.primary),
                      title: Text(d['title'] as String),
                      subtitle: Text(
                          '${(d['seconds'] as int) ~/ 60} мин • ${d['kcal']} ккал'),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _progress(double value) {
    return LayoutBuilder(builder: (context, c) {
      return Container(
        height: 12,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(6)),
        alignment: Alignment.centerLeft,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          width: c.maxWidth * value.clamp(0.0, 1.0),
          decoration: BoxDecoration(
              color: AppColors.primary, borderRadius: BorderRadius.circular(6)),
        ),
      );
    });
  }
}

class _InfoTile extends StatelessWidget {
  final String title;
  final String value;
  const _InfoTile({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Text(value,
              style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}