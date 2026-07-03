import 'package:flutter/material.dart';
import 'package:moodle/widgets/nav_drawer.dart';
import 'package:moodle/constants.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final events = [
      {
        'date': '01 Aug 2026',
        'title': 'PAPL Flutter App Due',
        'type': 'Assignment',
      },
      {
        'date': '27 Jul 2026',
        'title': 'Demo booking deadline',
        'type': 'Reminder',
      },
      {
        'date': '15 Jul 2026',
        'title': 'PAPL coursework review session',
        'type': 'Event',
      },
      {
        'date': '30 Jun 2026',
        'title': 'DSALG Assignment Due',
        'type': 'Assignment',
      },
      {
        'date': '30 May 2026',
        'title': 'Functional Programming submission',
        'type': 'Assignment',
      },
    ];

    Color typeColor(String type) {
      switch (type) {
        case 'Assignment':
          return Colors.red;
        case 'Reminder':
          return Colors.orange;
        default:
          return Colors.blue;
      }
    }

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
                'Calendar',
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
              'Calendar',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: moodlePurple,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Upcoming deadlines and events',
              style: TextStyle(fontSize: 14, color: moodleTextMuted),
            ),
            const SizedBox(height: 24),
            ...events.map((e) {
              final color = typeColor(e['type']!);
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
                  child: Row(
                    children: [
                      Container(
                        width: 4,
                        height: 48,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e['title']!,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: moodleTextDark,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today_outlined,
                                  size: 13,
                                  color: moodleTextMuted,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  e['date']!,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: moodleTextMuted,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: color.withValues(alpha: 0.12),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    e['type']!,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: color,
                                    ),
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
            }),
          ],
        ),
      ),
    );
  }
}
