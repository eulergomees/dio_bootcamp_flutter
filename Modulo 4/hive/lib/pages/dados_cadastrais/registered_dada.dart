import 'package:flutter/material.dart';
import 'package:trilhaapp_inicial/repositories/languages_repository.dart';
import 'package:trilhaapp_inicial/repositories/lvl_reporitory.dart';
import 'package:trilhaapp_inicial/services/app_storage_service.dart';
import 'package:trilhaapp_inicial/shared/widgets/text_label.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({super.key});

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  AppStorageService storage = AppStorageService();

  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController bornController = TextEditingController(text: "");
  DateTime? bornDate;
  var lvlRepository = NivelRepository();
  var lvls = [];
  var selecLvl = "";

  var langRepository = LangRepository();
  var langs = [];
  List<String> selecLang = [];

  double selecWage = 0;
  int expeTime = 0;
  bool saving = false;

  final String REGISTEREDDATANAMEKEY = "registereddataname_key";
  final String REGISTEREDDATABORNKEY = "registereddataborn_key";
  final String REGISTEREDDATAEXPKEY = "registereddataexp_key";
  final String REGISTEREDDATALVLKEY = "registereddatalvl_key";
  final String REGISTEREDDATALANGKEY = "registereddataleng_key";
  final String REGISTEREDDATATIMEKEY = "registereddatatime_key";
  final String REGISTEREDDATASALARYKEY = "registereddatasalary_key";

  @override
  void initState() {
    // TODO: implement initState
    lvls = lvlRepository.returnLevel();
    langs = langRepository.returnLang();
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    nameController.text = await storage.getRegisteredDataName();
    bornController.text = await storage.getRegisteredDataBorn();
   if (bornController.text.isNotEmpty){
     bornDate = DateTime.parse(bornController.text);
   }
    selecLvl = await storage.getRegisteredDataLvl();
    selecLang = await storage.getRegisteredDataLang();
    expeTime = await storage.getRegisteredDataTime();
    selecWage = await storage.getRegistereDataSalary();
    setState(() {});
  }

  List<DropdownMenuItem<int>> returnItens(int maxQuant) {
    var items = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= maxQuant; i++) {
      items.add(DropdownMenuItem(
        value: i,
        child: Text(i.toString()),
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Meus dados"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: saving
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    children: [
                      const TextLabel(text: "Nome:"),
                      TextField(
                        controller: nameController,
                      ),
                      const TextLabel(text: "Data de nascimento:"),
                      TextField(
                        controller: bornController,
                        readOnly: true,
                        onTap: () async {
                          var data = await showDatePicker(
                            context: context,
                            initialDate: DateTime(2000, 1, 1),
                            firstDate: DateTime(1950, 5, 20),
                            lastDate: DateTime(2023, 10, 23),
                          );
                          if (data != null) {
                            bornController.text = data.toString();
                            bornDate = data;
                          }
                        },
                      ),
                      const TextLabel(text: "Nivel de experiencia:"),
                      Column(
                        children: lvls
                            .map((nivel) => RadioListTile(
                                dense: true,
                                selected: selecLvl == nivel,
                                title: Text(nivel.toString()),
                                value: nivel.toString(),
                                groupValue: selecLvl,
                                onChanged: (value) {
                                  setState(() {
                                    selecLvl = value.toString();
                                  });
                                }))
                            .toList(),
                      ),
                      const TextLabel(text: "Linguagens preferidas:"),
                      Column(
                          children: langs
                              .map((e) => CheckboxListTile(
                                    dense: true,
                                    title: Text(e),
                                    value: selecLang.contains(e),
                                    onChanged: (value) {
                                      if (value!) {
                                        setState(() {
                                          selecLang.add(e);
                                        });
                                      } else {
                                        setState(() {
                                          selecLang.remove(e);
                                        });
                                      }
                                    },
                                  ))
                              .toList()),
                      const TextLabel(text: "Tempo de experiencia:"),
                      DropdownButton(
                          value: expeTime,
                          isExpanded: true,
                          items: returnItens(15),
                          onChanged: (value) {
                            setState(() {
                              expeTime = int.parse(value.toString());
                            });
                          }),
                      TextLabel(
                        text:
                            "Pretençao Salarial: R\$ ${selecWage.roundToDouble().toString()}",
                      ),
                      Slider(
                        min: 0,
                        max: 10000,
                        value: selecWage,
                        onChanged: (double value) {
                          setState(() {
                            selecWage = value;
                          });
                        },
                      ),
                      TextButton(
                        onPressed: () async {
                          setState(() {
                            saving = false;
                          });
                          if (nameController.text.trim().length < 3) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("O nome deve ser preenchido!")));
                            return;
                          }
                          if (bornDate == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "A data de nascimento invalida!")));
                            return;
                          }
                          if (selecLvl.trim() == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("O nivel deve ser selecionado!")));
                            return;
                          }
                          if (selecLang.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Deve ser selecionado ao menos uma linguagem!")));
                            return;
                          }
                          if (expeTime == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Deve ter ao menos um ano de experiencia!")));
                            return;
                          }
                          if (selecWage == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "A pretençao salarial deve ser maior que zero!")));
                            return;
                          }
                          await storage
                              .setRegisteredDataName(nameController.text);
                          await storage.setRegisteredDataBorn(bornDate!);
                          await storage.setRegisteredDataLvl(selecLvl);
                          await storage.setRegisteredDataLang(selecLang);
                          await storage.setRegisteredDataTime(expeTime);
                          await storage.setRegisteredDataSalary(selecWage);
                          setState(() {
                            saving = true;
                          });
                          Future.delayed(const Duration(seconds: 3), () {
                            setState(() {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Dados salvos com sucesso!")));
                              saving = false;
                            });

                            Navigator.pop(context);
                          });
                        },
                        child: const Text("Salvar"),
                      ),
                    ],
                  ),
          )),
    );
  }
}
