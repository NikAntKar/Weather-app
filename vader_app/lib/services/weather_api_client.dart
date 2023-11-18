import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vader_app/model/weather_model.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String? latPos, String? lonPos) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latPos&lon=$lonPos&exclude=-122.084&appid=8d46eadce825902d62dd1445fda3cb43&units=metric");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);

    return Weather.fromJson(body);
  }
}
