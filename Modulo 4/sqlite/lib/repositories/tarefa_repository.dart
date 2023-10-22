import '../model/tarefa.dart';

class TarefaRepository {
  final List<Tarefa> _tarefas = [];

  Future<void> add(Tarefa tarefa) async {
    await Future.delayed(const Duration(milliseconds: 0));
    _tarefas.add(tarefa);
  }

  Future <void> alt(Id, bool concluido) async {
    await Future.delayed(const Duration(milliseconds: 0));
    _tarefas
        .where((tarefa) => tarefa.Id == Id)
        .first
        .Concluido;
  }

  Future<List<Tarefa>> listar() async {
    await Future.delayed(const Duration(seconds: 1));
    return _tarefas;
  }

  Future<List<Tarefa>> listarNaoConcluidas() async {
    await Future.delayed(const Duration(seconds: 1));
    return _tarefas.where((tarefa) => !tarefa.Concluido).toList();
  }

  Future<void> remove(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tarefas.remove(_tarefas.where((tarefa) => tarefa.Id == id).first);
  }
}
