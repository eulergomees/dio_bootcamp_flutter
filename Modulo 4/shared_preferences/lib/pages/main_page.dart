import 'package:flutter/material.dart';
import 'package:trilhaapp_inicial/pages/card_page.dart';
import 'package:trilhaapp_inicial/pages/image_assets.dart';
import 'package:trilhaapp_inicial/pages/listview_h_page.dart';
import 'package:trilhaapp_inicial/pages/listview_page.dart';
import 'package:trilhaapp_inicial/pages/tarefa_page.dart';
import 'package:trilhaapp_inicial/shared/widgets/custom_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int posicaoPage = 0;
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("MainPage"),
        ),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPage = value;
                  });
                },
                children: const [
                  CardPage(),
                  ImageAssetsPage(),
                  ListViewHPage(),
                  ListViewHorizontal(),
                  TarefaPage()
                ],
              ),
            ),
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
                currentIndex: posicaoPage,
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Page1"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.add), label: "Page2"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: "Page3"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.image), label: "Page4"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list), label: "Page5"),
                ])
          ],
        ),
      ),
    );
  }
}
