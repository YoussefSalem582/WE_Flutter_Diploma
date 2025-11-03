import 'lecture.dart';
import 'sheet.dart';
//
// class Course {
//   late String courseName;
//   late String courseDescription;
//
//   Course(this.courseName, this.courseDescription);
//
//   List<Lecture> lectures = [];
//   List<Sheet> sheets = [];
//
//   //lecture
//   void addNewLecture(Lecture lecture) {
//     lectures.add(lecture);
//   }
//   void deleteLecture(String lectureName) {
//     lectures.remove(lectures);
//   }
//
//   //sheet
//   void addNewSheet(Sheet sheet) {
//     sheets.add(sheet);
//   }
//   void deleteSheet(int sheetNumber) {
//     sheets.remove(sheets);
//   }
// }

class Course {
  late String courseName;
  late String courseDescription;

  Course(this.courseName, this.courseDescription);

  List<Lecture> lectures = [];
  List<Sheet> sheets = [];

  void addNewLecture(Lecture lecture) {
    lectures.add(lecture);
  }

  void deleteLecture(String lectureName) {
    lectures.removeWhere((lecture) => lecture.lectureName == lectureName);
  }

  void addNewSheet(Sheet sheet) {
    sheets.add(sheet);
  }

  void deleteSheet(int sheetNumber) {
    sheets.removeWhere((sheet) => sheet.sheetNum == sheetNumber);
  }
}