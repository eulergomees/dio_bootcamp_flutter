import 'package:flutter/material.dart';

class DadosCadastraisPage extends StatelessWidget {
  final String text;
  final List<String> dados;

  const DadosCadastraisPage(
      {super.key, required this.text, required this.dados});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: Center(
        child: Text(dados.length.toString()),
      ),
    );
  }
}
