import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecoconnect/models/lesson.dart';

class LessonService {
  final CollectionReference lessonsCollection =
      FirebaseFirestore.instance.collection('lessons');

  // Get lessons stream
  Stream<List<Lesson>> get lessons {
    return lessonsCollection.snapshots().map(_lessonListFromSnapshot);
  }

  // Lesson list from snapshot
  List<Lesson> _lessonListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Lesson(
        title: (doc.data() as Map<String, dynamic>)['title'] ?? '',
        description: (doc.data() as Map<String, dynamic>)['description'] ?? '',
        content: (doc.data() as Map<String, dynamic>)['content'] ?? '',
      );
    }).toList();
  }

  // Add lesson
  Future addLesson(String title, String description, String content) async {
    return await lessonsCollection.add({
      'title': title,
      'description': description,
      'content': content,
    });
  }

  // Update lesson
  Future updateLesson(String lessonId, String title, String description, String content) async {
    return await lessonsCollection.doc(lessonId).update({
      'title': title,
      'description': description,
      'content': content,
    });
  }

  // Delete lesson
  Future deleteLesson(String lessonId) async {
    return await lessonsCollection.doc(lessonId).delete();
  }
}
