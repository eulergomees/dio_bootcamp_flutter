import 'package:flutter/material.dart';

import '../shared/widgets/app_images.dart';

class ListViewHorizontal extends StatefulWidget {
  const ListViewHorizontal({super.key});

  @override
  State<ListViewHorizontal> createState() => _ListViewHorizontalState();
}

class _ListViewHorizontalState extends State<ListViewHorizontal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex: 2,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Card(
                elevation: 8,
                child: Image.asset(AppImage.paisagem1),
              ),
              Card(
                elevation: 8,
                child: Image.asset(AppImage.paisagem2),
              ),
              Card(
                elevation: 8,
                child: Image.asset(AppImage.paisagem3),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(),
        )
      ]),
    );
  }
}
