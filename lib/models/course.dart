import 'package:flutter/material.dart';

class Course {
  final String id;
  final String name;
  final String code;
  final String category;
  final Color color;
  final String instructor;
  final int progress;

  const Course({
    required this.id,
    required this.name,
    required this.code,
    required this.category,
    required this.color,
    required this.instructor,
    required this.progress,
  });
}

final List<Course> courses = [
  const Course(
    id: '1',
    name: 'Data Structures and Algorithms (DSALG) (2025/26)',
    code: 'M21270-2025/26-SMSEP',
    category: 'Computer Science',
    color: Color(0xFF5D2D5F),
    instructor: 'Dr. M. Ghahremani',
    progress: 72,
  ),
  const Course(
    id: '2',
    name: 'Discrete Mathematics And Functional Programming (2025/26)',
    code: 'M21274-2025/26-SMJAN',
    category: 'Mathematics',
    color: Color(0xFF0075FF),
    instructor: 'Dr. J. Smith',
    progress: 85,
  ),
  const Course(
    id: '3',
    name: 'COMP TUTORIAL LEVEL 5 (2025/26)',
    code: 'M22732-2025/26-SMYEAR',
    category: 'Tutorial',
    color: Color(0xFF2E7D32),
    instructor: 'Prof. A. Brown',
    progress: 60,
  ),
  const Course(
    id: '4',
    name: 'Operating Systems and Internetworking (2025/26)',
    code: 'M30233-2025/26-SMSEP',
    category: 'Infrastructure',
    color: Color(0xFFE65100),
    instructor: 'Dr. C. Wilson',
    progress: 45,
  ),
  const Course(
    id: '5',
    name: 'Programming Applications and Programming Languages (2025/26)',
    code: 'M30235-2025/26-SMYEAR',
    category: 'Software Development',
    color: Color(0xFF4527A0),
    instructor: 'Dr. R. Patel',
    progress: 90,
  ),
];
