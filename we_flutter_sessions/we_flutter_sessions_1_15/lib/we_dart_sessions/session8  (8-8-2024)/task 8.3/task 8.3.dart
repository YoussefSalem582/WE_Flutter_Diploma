import 'course.dart';
import 'teacher.dart';
import 'sheet.dart';
import 'lecture.dart';
import'coursera.dart';

void main() {
  // Create a Coursera instance
  Coursera coursera = Coursera();

  // Register a teacher
  coursera.registerTeacher('John Doe', 'john.doe@example.com', 'password123');

  // Login the teacher
  coursera.loginTeacher('John Doe', 'password123');

  // Create a teacher instance
  Teacher teacher = Teacher();

  // Create a course
  Course flutterCourse = Course('Flutter Development', 'Learn how to develop mobile apps using Flutter.');

  // Create lectures and sheets
  Lecture introLecture = Lecture('Introduction to Flutter', 'Overview of Flutter framework.', 'lecture1.pdf');
  Sheet worksheet1 = Sheet(1, 'Worksheet 1', 'sheet1.pdf');

  // Add lectures and sheets to the course
  flutterCourse.addNewLecture(introLecture);
  flutterCourse.addNewSheet(worksheet1);

  // Add the course to the teacher's list
  teacher.addNewCourse(flutterCourse);

  // Print the teacher's courses
  print('Teacher Courses:');
  teacher.courses.forEach((course) {
    print('- ${course.courseName}');
  });

  // Delete a course
  teacher.deleteCourse('Flutter Development');

  // Print the teacher's courses after deletion
  print('\nTeacher Courses After Deletion:');
  teacher.courses.forEach((course) {
    print('- ${course.courseName}');
  });
}