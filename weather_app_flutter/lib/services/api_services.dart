import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_flutter/models/weather_model.dart';

class APIServices {
  final String _baseUrl = "https://open-weather13.p.rapidapi.com/city";

  Future<WeatherModel?>? getDataFromApi(String cityName) async {
    String url = "$_baseUrl/$cityName";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'X-RapidAPI-Key':
              "2f704ed354msh928945487f7ddb2p11caaajsn187055d64459",
          'X-RapidAPI-Host': "open-weather13.p.rapidapi.com",
        },
      );
      if (response.statusCode == 200) {
        debugPrint("Type: ${response.body}");
        var mainContent = jsonDecode(response.body);
        return WeatherModel.fromMap(
          mainContent['weather'][0],
        );
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("Exception is: $e");
      return null;
    }
  }
}
