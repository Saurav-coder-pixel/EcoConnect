import 'package:ecoconnect/api/lesson_service.dart';
import 'package:ecoconnect/models/lesson.dart';
import 'package:flutter/material.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LessonService lessonService = LessonService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Modules'),
      ),
      body: StreamBuilder<List<Lesson>>(
        stream: lessonService.lessons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Lesson> lessons = snapshot.data ?? [];
            return ListView.builder(
              itemCount: lessons.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(lessons[index].title),
                    subtitle: Text(lessons[index].description),
                  ),
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
