import 'dart:io';

import 'package:meu_app_ex/exceptions/invalid_name_exception.dart';
import 'package:meu_app_ex/models/console_utils.dart';
import 'package:meu_app_ex/models/student.dart';

void execute() {
  print("Bem vindo ao sistema de notas!");
  String name = ConsoleUtils.readTextString("Digite o nome do aluno:");

  try {
    if (name.trim() == "") {
      throw InvalidNameException();
    }
  } catch (InvalidNameException) {
    name = "Nome padrao";
    print(InvalidNameException);
  } catch (e) {
    print(e);
  }

  var student = Student(name);
  double? grade;
  do {
    grade =
        ConsoleUtils.readTextDoubleOutput("Digite a nota ou S para sair", "s");
    if (grade != null) {
      student.addGrade(grade);
    }
  } while (grade != null);
  print(student.getName());
  print(student.getGrades());
  if (student.aprove(7)) {
    print("Aprovado");
  } else {
    print("Reprovado");
  }
}
