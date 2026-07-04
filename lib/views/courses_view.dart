import 'package:flutter/material.dart';
import 'package:moodle/widgets/nav_drawer.dart';
import 'package:moodle/constants.dart';
import 'package:moodle/models/course.dart';
import 'package:moodle/views/course_detail_view.dart';

class CoursesView extends StatefulWidget {
  const CoursesView({Key? key}) : super(key: key);

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filtered = courses
        .where(
          (c) =>
              c.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              c.code.toLowerCase().contains(_searchQuery.toLowerCase()),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: moodleWhite,
        foregroundColor: moodleTextDark,
        elevation: 1,
        titleSpacing: 0,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                width: 32,
                height: 32,
                child: Image.asset(
                  'images/moodle_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              const Text(
                'My courses',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          const CircleAvatar(
            radius: 18,
            backgroundColor: moodleGrayBg,
            foregroundColor: moodlePurple,
            child: Text(
              'MB',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      drawer: const NavDrawer(),
      body: Container(
        color: moodleBg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: Text(
                'My courses',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: moodlePurple,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search courses...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: moodleWhite,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: moodleBorder),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: moodleBorder),
                  ),
                ),
                onChanged: (value) => setState(() => _searchQuery = value),
              ),
            ),
            Expanded(
              child: filtered.isEmpty
                  ? const Center(
                      child: Text(
                        'No courses found.',
                        style: TextStyle(color: moodleTextMuted),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        final course = filtered[index];
                        return Card(
                          color: moodleWhite,
                          elevation: 0,
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: moodleBorder),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      CourseDetailView(course: course),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: course.color,
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(8),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        course.name,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: moodleTextDark,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        course.code,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: moodleTextMuted,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        course.instructor,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: moodleTextMuted,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: LinearProgressIndicator(
                                              value: course.progress / 100,
                                              backgroundColor: moodleGrayBg,
                                              color: course.color,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            '${course.progress}%',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: moodleTextMuted,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
