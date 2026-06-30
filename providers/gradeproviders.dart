import 'package:flutter/foundation.dart';
import '../models/subject.dart';

class GradeProvider extends ChangeNotifier {

  final List<Subject> _subjects = [];

  List<Subject> get subjects => _subjects;

  void addSubject(String name, int mark) {
    _subjects.add(Subject(name: name, mark: mark));
    notifyListeners(); 
  }
  void deleteSubject(Subject subject) {
    _subjects.remove(subject);
    notifyListeners(); 
  }

  int get totalSubjects => _subjects.length;

  double get averageMark {
    if (_subjects.isEmpty) return 0;
    final marks = _subjects.map((s) => s.mark); 
    final total = marks.reduce((a, b) => a + b);
    return total / _subjects.length;
  }

  List<Subject> get passingSubjects {
    return _subjects.where((s) => s.grade != 'F').toList(); 
  }
  String get overallGrade {
    final avg = averageMark;
    if (avg >= 80) return 'A';
    if (avg >= 65) return 'B';
    if (avg >= 50) return 'C';
    return 'F';
  }
}