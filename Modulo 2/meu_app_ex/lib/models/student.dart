class Student {
  String _name = "";
  final List<double> _grades = [];

  Student(String name) {
    _name = name;
  }

  void setName(String name) {
    _name = name;
  }

  String getName() {
    return _name;
  }

  List<double> getGrades() {
    return _grades;
  }

  void addGrade(double grade) {
    _grades.add(grade);
  }

  double returnAvarege() {
    var totalGrades = 0.0;
    for (var grade in _grades) {
      totalGrades = totalGrades + grade;
    }
    var avarege = totalGrades / _grades.length;
    return avarege.isNaN ? 0 : avarege;
  }

  bool aprove(double gradeAvarege) {
    return returnAvarege() >= gradeAvarege;
  }
}
