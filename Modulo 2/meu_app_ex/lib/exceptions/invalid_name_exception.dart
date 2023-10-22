class InvalidNameException {
  String error() => "Nome invalido!";

  @override
  String toString() {
    // TODO: implement toString
    return "InvalidNameException: ${error()}";
  }
}
