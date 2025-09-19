import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecoconnect/models/quiz.dart';

class QuizService {
  final CollectionReference quizzesCollection =
      FirebaseFirestore.instance.collection('quizzes');

  // Get quizzes stream
  Stream<List<Quiz>> get quizzes {
    return quizzesCollection.snapshots().map(_quizListFromSnapshot);
  }

  // Quiz list from snapshot
  List<Quiz> _quizListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Quiz(
        question: (doc.data() as Map<String, dynamic>)['question'] ?? '',
        options: List<String>.from((doc.data() as Map<String, dynamic>)['options'] ?? []),
        correctAnswerIndex: (doc.data() as Map<String, dynamic>)['correctAnswerIndex'] ?? 0,
      );
    }).toList();
  }

  // Add quiz
  Future addQuiz(String question, List<String> options, int correctAnswerIndex) async {
    return await quizzesCollection.add({
      'question': question,
      'options': options,
      'correctAnswerIndex': correctAnswerIndex,
    });
  }

  // Update quiz
  Future updateQuiz(String quizId, String question, List<String> options, int correctAnswerIndex) async {
    return await quizzesCollection.doc(quizId).update({
      'question': question,
      'options': options,
      'correctAnswerIndex': correctAnswerIndex,
    });
  }

  // Delete quiz
  Future deleteQuiz(String quizId) async {
    return await quizzesCollection.doc(quizId).delete();
  }
}
