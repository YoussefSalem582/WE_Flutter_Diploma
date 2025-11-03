import 'course.dart';

// class Teacher{
//   late String teacherName;
//   late String email;
//   late int password;
//
//   Teacher(this.teacherName, this.email, this.password);
// }


// class Teacher {
//   List<Course> courses = [];
//
//   void addNewCourse(Course course) {
//     courses.add(course);
//   }
//
//   void deleteCourse(String courseName) {
//     courses.remove(courses);
//   }
// }

class Teacher {
  List<Course>courses = [];

  void addNewCourse(Course course) {
    courses.add(course);
  }

  void deleteCourse(String courseName) {
    courses.removeWhere((course) => course.courseName == courseName);
  }
}