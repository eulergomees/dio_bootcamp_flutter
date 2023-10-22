class InvalidNameException {
  String error() => "Nome invalido!";

  @override
  String toString() {
    return "InvalidNameException: ${error()}";
  }
}
