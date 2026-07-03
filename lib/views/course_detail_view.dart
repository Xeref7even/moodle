import 'package:flutter/material.dart';
import 'package:moodle/models/course.dart';
import 'package:moodle/constants.dart';

class CourseDetailView extends StatelessWidget {
  final Course course;

  const CourseDetailView({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isPAPL = course.code == 'M30235-2025/26-SMYEAR';

    final sections = isPAPL
        ? [
            {
              'title': 'Week 1: Introduction to Flutter',
              'items': [
                'Lecture slides: Getting Started with Flutter',
                'Video: Flutter & Dart overview',
                'Quiz: Dart Basics',
              ],
            },
            {
              'title': 'Week 2: Widgets and Layouts',
              'items': [
                'Lecture slides: Stateless vs Stateful Widgets',
                'Lab sheet: Building Layouts',
                'Reading: Flutter documentation',
              ],
            },
            {
              'title': 'Week 3: State Management',
              'items': [
                'Lecture slides: setState and Provider',
                'Lab sheet: Counter App',
                'Quiz: State Management Concepts',
              ],
            },
            {
              'title': 'Week 4: Navigation and Routing',
              'items': [
                'Lecture slides: Navigator and Named Routes',
                'Lab sheet: Multi-page App',
                'Reading: Flutter Navigation docs',
              ],
            },
            {
              'title': 'Week 5: Firebase Integration',
              'items': [
                'Lecture slides: Firebase setup and configuration',
                'Lab sheet: Firestore CRUD',
                'Workshop: Authentication with Firebase',
              ],
            },
            {
              'title': 'Assessments',
              'items': [
                'Coursework 1 brief',
                'Coursework 2: Moodle App — due 01 Aug 2026',
                'Submission instructions',
              ],
            },
          ]
        : [
            {
              'title': 'Section 1: Introduction',
              'items': [
                'Lecture slides',
                'Reading material',
                'Quiz',
              ],
            },
            {
              'title': 'Section 2: Core Concepts',
              'items': [
                'Lecture slides',
                'Lab worksheet',
                'Additional reading',
              ],
            },
            {
              'title': 'Section 3: Practical Work',
              'items': [
                'Lab sessions',
                'Project brief',
                'Submission portal',
              ],
            },
          ];

    IconData resourceIcon(String name) {
      final lower = name.toLowerCase();
      if (lower.contains('video')) return Icons.play_circle_outline;
      if (lower.contains('quiz')) return Icons.quiz_outlined;
      if (lower.contains('lab')) return Icons.science_outlined;
      if (lower.contains('slides') || lower.contains('lecture')) {
        return Icons.slideshow_outlined;
      }
      if (lower.contains('coursework') ||
          lower.contains('brief') ||
          lower.contains('submission')) {
        return Icons.assignment_outlined;
      }
      return Icons.description_outlined;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: course.color,
        foregroundColor: Colors.white,
        title: Text(
          course.code,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: moodleBg,
        child: ListView(
          children: [
            Container(
              color: course.color,
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    course.instructor,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: sections.map((section) {
                  return Card(
                    color: moodleWhite,
                    elevation: 0,
                    margin: const EdgeInsets.only(bottom: 8),
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: moodleBorder),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: ExpansionTile(
                      tilePadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      title: Text(
                        section['title'] as String,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: moodleTextDark,
                        ),
                      ),
                      children: (section['items'] as List<String>).map((item) {
                        return ListTile(
                          dense: true,
                          leading: Icon(
                            resourceIcon(item),
                            color: moodlePurple,
                            size: 20,
                          ),
                          title: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                              color: moodleTextDark,
                            ),
                          ),
                          onTap: () {},
                        );
                      }).toList(),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
