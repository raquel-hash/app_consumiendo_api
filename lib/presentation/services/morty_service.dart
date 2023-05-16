import 'package:app_consumiendo_api/data/models/character_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MortyService extends ChangeNotifier {
  final List<Result> mortyResults = [];

  MortyService() {
    print("LLAMANDO AL SERVICIO");
  }

  getCharacters() async {
    const url = "https://rickandmortyapi.com/api/character";
    // 1. primer paso
    //Obtener la respuesta de la url
    final response = await http.get(Uri.parse(url));
    // 2. segundo paso
    // Tenemos que mapear la respesta obtenida
    if (response.statusCode == 200) {
      final resultResponse = characterModelFromJson(response.body);
      mortyResults.addAll(resultResponse.results);
    } else if (response.statusCode == 400) {
      print('object');
    }

    notifyListeners();
    // print(resultResponse.results[0]);
  }
}
