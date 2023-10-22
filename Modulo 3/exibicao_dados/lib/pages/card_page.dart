import 'package:flutter/material.dart';
import 'package:trilhaapp_inicial/pages/card_detail_page.dart';
import 'package:trilhaapp_inicial/repositories/card_reporitory.dart';

import '../models/card_detail.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _Page1State();
}

class _Page1State extends State<CardPage> {
  CardDetail? cardDetail;
  CardRepository cardRepository = CardRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    cardDetail = await cardRepository.get();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: cardDetail == null
                ? const LinearProgressIndicator()
                : InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CardDetailPage(
                                    cardDetail: cardDetail!,
                                  )));
                    },
                    child: Hero(
                      tag: cardDetail!.id,
                      child: Card(
                        elevation: 8,
                        shadowColor: Colors.deepPurple,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    cardDetail!.url,
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    cardDetail!.title,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                cardDetail!.text,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Container(
                                  width: double.infinity,
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Ler mais",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline),
                                      )))
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
      ],
    );
  }
}
