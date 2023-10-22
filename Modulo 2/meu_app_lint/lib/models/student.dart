class Student {
  String _name = "";
  final List<double> _grades = [];

  Student(this._name);

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
    var avarege =
        _grades.reduce((value, element) => value + element) / _grades.length;
    return avarege.isNaN ? 0 : avarege;
  }

  bool aprove(double gradeAvarege) {
    return returnAvarege() >= gradeAvarege;
  }
}
