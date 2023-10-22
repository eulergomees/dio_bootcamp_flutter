import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilhaapp_inicial/services/app_storage_service.dart';

class RandomNumberPage extends StatefulWidget {
  const RandomNumberPage({super.key});

  @override
  State<RandomNumberPage> createState() => _RandomNumberPageState();
}

class _RandomNumberPageState extends State<RandomNumberPage> {
  int numGer = 0;
  int clicks = 0;
  AppStorageService storage = AppStorageService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    numGer = await storage.getRandomNum();
    clicks = await storage.getRandomClicks();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Gerador de numeros aleatorios"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              numGer == null ? "Nenhum numero gerado!" : numGer.toString(),
              style: const TextStyle(fontSize: 22),
            ),
            Text(
              clicks == null
                  ? "Nenhum clique feito!"
                  : "Quantidade de cliques: ${clicks.toString()}",
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var random = Random();
          setState(() {
            numGer = random.nextInt(1000);
            clicks = (clicks ?? 0) + 1;
          });
          await storage.setRandomNum(numGer);
          await storage.setRandomClicks(clicks);
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}
