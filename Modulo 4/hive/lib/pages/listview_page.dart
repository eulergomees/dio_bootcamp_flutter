import 'package:flutter/material.dart';

import '../shared/widgets/app_images.dart';

class ListViewHPage extends StatefulWidget {
  const ListViewHPage({super.key});

  @override
  State<ListViewHPage> createState() => _Page3State();
}

class _Page3State extends State<ListViewHPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
            leading: Image.asset(AppImage.user2),
            title: const Text("Usuario 2"),
            subtitle: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Olá tudo bem ?"),
                Text("08:59"),
              ],
            ),
            trailing: PopupMenuButton<String>(
              onSelected: (menu) {},
              itemBuilder: (BuildContext bc) {
                return <PopupMenuEntry<String>>[
                  const PopupMenuItem(
                    value: "opcao1",
                    child: Text("Opçao 1"),
                  ),
                  const PopupMenuItem(
                    value: "opcao2",
                    child: Text("Opçao 2"),
                  ),
                  const PopupMenuItem(
                    value: "opcao3",
                    child: Text("Opçao 3"),
                  )
                ];
              },
            )),
        Image.asset(AppImage.user1),
        Image.asset(AppImage.user2),
        Image.asset(AppImage.user3),
        Image.asset(AppImage.paisagem1),
        Image.asset(AppImage.paisagem2),
        Image.asset(AppImage.paisagem3),
      ],
    );
  }
}
