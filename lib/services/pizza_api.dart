import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/app_parameter.dart';
import '../model/pizza.dart';

class PizzaApi {



  static Future<List<Pizza>?> getPizzas() async {
    try {


      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.get_pizzas);
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-RapidAPI-Key':'c5127b8c22msh47782285fac8527p1e05c5jsn134d2a6283a7',
        'X-RapidAPI-Host':'pizza-and-desserts.p.rapidapi.com'
      };

      http.Response response = await http.get(url, headers: headers);
      final json = jsonDecode(response.body);

      print(response.statusCode);
      print(json);
      if (response.statusCode == 200) {
        List<dynamic> plotsJson = json;
        List<Pizza> plots = plotsJson.map((e) => Pizza.fromJson(e)).toList();
        return plots;
      } else {
        print("lmachakil");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }


}
