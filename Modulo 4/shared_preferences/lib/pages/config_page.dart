import 'package:flutter/material.dart';
import 'package:trilhaapp_inicial/services/app_storage_service.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  AppStorageService storage = AppStorageService();

  TextEditingController userNameController = TextEditingController();
  TextEditingController userHeightController = TextEditingController();

  String? userName;
  double? height;
  bool pushNotification = false;
  bool darkTheme = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    userNameController.text = await storage.getConfigUserName();
    userHeightController.text =
        (storage.getConfigUserHeight().toString());
    pushNotification = await storage.getConfigUserPush();
    darkTheme = await storage.getConfigUserDark();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Configurações"),
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: const InputDecoration(hintText: "Nome"),
                controller: userNameController,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "Altura"),
                controller: userHeightController,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SwitchListTile(
                title: const Text("Receber notificações"),
                value: pushNotification,
                onChanged: (bool value) {
                  setState(() {
                    pushNotification = value;
                  });
                }),
            const SizedBox(
              height: 8,
            ),
            SwitchListTile(
                title: const Text("Tema escuro"),
                value: darkTheme,
                onChanged: (bool value) {
                  setState(() {
                    darkTheme = value;
                  });
                }),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                    await storage.setConfigUserHeight(
                        double.parse(userHeightController.text));
                  } catch (e) {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: const Text("Meu app"),
                            content: const Text(
                                "Favor informar uma altura valida!"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Ok"))
                            ],
                          );
                        });
                    return;
                  }
                  await storage.setConfigUserName(userNameController.text);
                  await storage.setConfigUserPush(pushNotification);
                  await storage.setConfigUserDark(darkTheme);
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.deepPurple),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: const Text(
                  "Salvar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
