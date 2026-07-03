import 'package:flutter/material.dart';
import 'package:moodle/widgets/nav_drawer.dart';
import 'package:moodle/constants.dart';

class AssessmentsView extends StatelessWidget {
  const AssessmentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final assessments = [
      {
        'title': 'Flutter Moodle App (Coursework 2)',
        'course': 'PAPL — M30235-2025/26-SMYEAR',
        'due': '01 Aug 2026',
        'status': 'In Progress',
      },
      {
        'title': 'Functional Programming Project',
        'course': 'DiscMath — M21274-2025/26-SMJAN',
        'due': '20 Mar 2026',
        'status': 'Graded',
      },
      {
        'title': 'OS and Networking Lab Report',
        'course': 'OSI — M30233-2025/26-SMSEP',
        'due': '28 Feb 2026',
        'status': 'Graded',
      },
      {
        'title': 'Algorithm Design Assignment',
        'course': 'DSALG — M21270-2025/26-SMSEP',
        'due': '30 May 2026',
        'status': 'Submitted',
      },
      {
        'title': 'Tutorial Portfolio',
        'course': 'COMP TUTORIAL — M22732-2025/26-SMYEAR',
        'due': '15 Jan 2026',
        'status': 'Graded',
      },
    ];

    Color statusColor(String status) {
      switch (status) {
        case 'Graded':
          return Colors.green;
        case 'Submitted':
          return Colors.blue;
        case 'In Progress':
          return Colors.orange;
        default:
          return Colors.grey;
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: moodleWhite,
        foregroundColor: moodleTextDark,
        elevation: 1,
        // Zero out AppBar's built-in leading padding so our Row's margin controls spacing.
        titleSpacing: 0,
        // Horizontal scroll prevents overflow when system font scaling enlarges the title.
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                width: 32,
                height: 32,
                child: Image.asset('images/moodle_logo.png', fit: BoxFit.contain),
              ),
              const Text(
                'Assessments',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ),
        actions: const [
          SizedBox(width: 8),
          CircleAvatar(
            radius: 18,
            backgroundColor: moodleGrayBg,
            foregroundColor: moodlePurple,
            child: Text(
              'MB',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      drawer: const NavDrawer(),
      body: Container(
        color: moodleBg,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const Text(
              'My Assessments',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: moodlePurple,
              ),
            ),
            const SizedBox(height: 24),
            ...assessments.map((a) {
              final status = a['status']!;
              return Card(
                color: moodleWhite,
                elevation: 0,
                margin: const EdgeInsets.only(bottom: 12),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: moodleBorder),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              a['title']!,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: moodleTextDark,
                              ),
                            ),
                          ),
                          Chip(
                            label: Text(
                              status,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: statusColor(status),
                            padding: EdgeInsets.zero,
                            // shrinkWrap overrides Flutter's default 48px min tap target,
                            // which would push the chip outside the card boundary.
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        a['course']!,
                        style: const TextStyle(
                          fontSize: 13,
                          color: moodleTextMuted,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today_outlined,
                            size: 14,
                            color: moodleTextMuted,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Due: ${a['due']!}',
                            style: const TextStyle(
                              fontSize: 13,
                              color: moodleTextMuted,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
