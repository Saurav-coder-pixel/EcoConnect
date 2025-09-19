import 'package:ecoconnect/api/lesson_service.dart';
import 'package:ecoconnect/api/quiz_service.dart';
import 'package:ecoconnect/models/lesson.dart';
import 'package:ecoconnect/models/quiz.dart';
import 'package:flutter/material.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LessonService lessonService = LessonService();
    final QuizService quizService = QuizService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Modules'),
      ),
      body: StreamBuilder<List<Lesson>>(
        stream: lessonService.lessons,
        builder: (context, lessonSnapshot) {
          if (lessonSnapshot.hasData) {
            List<Lesson> lessons = lessonSnapshot.data ?? [];
            return ListView.builder(
              itemCount: lessons.length,
              itemBuilder: (context, lessonIndex) {
                Lesson lesson = lessons[lessonIndex];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: ListTile(
                        title: Text(lesson.title),
                        subtitle: Text(lesson.description),
                      ),
                    ),
                    StreamBuilder<List<Quiz>>(
                      stream: quizService.quizzes,
                      builder: (context, quizSnapshot) {
                        if (quizSnapshot.hasData) {
                          List<Quiz> quizzes = quizSnapshot.data ?? [];
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: quizzes.length,
                            itemBuilder: (context, quizIndex) {
                              Quiz quiz = quizzes[quizIndex];
                              return Card(
                                child: ListTile(
                                  title: Text(quiz.question),
                                ),
                              );
                            },
                          );
                        } else {
                          return const Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ],
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
