import 'dart:convert';
import 'package:http/http.dart' as http;

class ViaCEP {
  Future<Map<dynamic, dynamic>> returnCep(String cep) async {
    var uri = Uri.parse("https://viacep.com.br/ws/$cep/json/");
    var retur = await http.get(uri);
    var decodedResponse = jsonDecode(utf8.decode(retur.bodyBytes)) as Map;
    return decodedResponse;
  }
}
