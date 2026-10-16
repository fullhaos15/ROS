import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/workout.dart';

class HistoryService {
  static CollectionReference<Map<String, dynamic>>? _col() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('history');
  }

  static Future<void> add(Workout w, int seconds) async {
    await _col()?.add({
      'title': w.title,
      'category': w.category,
      'kcal': w.kcal,
      'seconds': seconds,
      'date': FieldValue.serverTimestamp(),
    });
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> latest() {
    final col = _col();
    if (col == null) return const Stream.empty();
    return col.orderBy('date', descending: true).limit(5).snapshots();
  }
}
