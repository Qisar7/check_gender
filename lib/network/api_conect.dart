import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:malefmale/model/m1.dart';

class Con {
  // String url = 'https://api.genderize.io?name=ali';

  // Future<Names> getdataa(String name) async {
  //   var response =
  //       await http.post(Uri.parse(url), body: json.encode({"name": "ali"}));

  //   if (response.statusCode == 201) {
  //     print(response.body);
  //     return Names.fromjson(jsonDecode(response.body));
  //   } else {
  //     throw Exception(' Failed to  get information  !!!');
  //   }
  // }

  Future getdataa({required String name}) async {
    var res = await http.get(Uri.parse('https://api.genderize.io/?name=$name'));

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      throw Exception('---------- field');
    }
  }
}
