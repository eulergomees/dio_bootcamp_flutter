import 'package:flutter/cupertino.dart';

class Tarefa {
  final String _Id = UniqueKey().toString();
  String _Descricao = "";
  bool _Concluido = false;

  Tarefa(this._Descricao, this._Concluido);

  String get Id => _Id;

  String get Descricao => _Descricao;

  set Descricao(String descricao) {
    _Descricao = descricao;
  }

  bool get Concluido => _Concluido;

  set Concluido(bool concluido) {
    _Concluido = concluido;
  }
}
