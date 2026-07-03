import 'package:flutter/material.dart';
import 'package:moodle/constants.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '/';

    void go(String route) {
      Navigator.pop(context);
      if (currentRoute != route) {
        Navigator.pushReplacementNamed(context, route);
      }
    }

    return Drawer(
      backgroundColor: moodlePurple,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: moodleDarkPurple),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: moodleWhite,
                    child: Text(
                      'MB',
                      style: TextStyle(
                        color: moodlePurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Muneer Bangari',
                    style: TextStyle(
                      color: moodleWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'up2195052@myport.ac.uk',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            _navItem(
              Icons.speed_outlined,
              'Dashboard',
              '/',
              currentRoute,
              go,
            ),
            _navItem(
              Icons.calendar_month_outlined,
              'Calendar',
              '/calendar',
              currentRoute,
              go,
            ),
            _navItem(
              Icons.school_outlined,
              'My courses',
              '/courses',
              currentRoute,
              go,
            ),
            _navItem(
              Icons.assignment_outlined,
              'Assessments',
              '/assessments',
              currentRoute,
              go,
            ),
            _navItem(
              Icons.person_outline,
              'Profile',
              '/profile',
              currentRoute,
              go,
            ),
            const Divider(color: Colors.white30, indent: 16, endIndent: 16),
            ListTile(
              leading: const Icon(Icons.logout, color: moodleWhite),
              title: const Text(
                'Log out',
                style: TextStyle(color: moodleWhite, fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(
    IconData icon,
    String label,
    String route,
    String currentRoute,
    void Function(String) go,
  ) {
    return ListTile(
      leading: Icon(icon, color: moodleWhite),
      title: Text(label, style: const TextStyle(color: moodleWhite, fontSize: 16)),
      selected: currentRoute == route,
      selectedTileColor: Colors.white24,
      onTap: () => go(route),
    );
  }
}
