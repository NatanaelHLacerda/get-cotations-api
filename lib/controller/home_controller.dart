import 'dart:convert';

import 'package:http/http.dart' as http;

class HomeController {
  Future<Map> getCotation() async {
    String url = 'http://api.hgbrasil.com/finance?format=json&key=60df7606';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map mapBody = jsonDecode(response.body);

      return mapBody;
    }
    return {};
  }
}
