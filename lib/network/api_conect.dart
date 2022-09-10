import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:malefmale/model/m1.dart';

class Con {
  String url = 'https://api.genderize.io?name=ali';

  Future<Names> getdataa(String name) async {
    var response =
        await http.post(Uri.parse(url), body: json.encode({"name": "ali"}));

    if (response.statusCode == 201) {
      print(response.body);
      return Names.fromjson(jsonDecode(response.body));
    } else {
      throw Exception(' Failed to  get info  !!!');
    }
  }
}
