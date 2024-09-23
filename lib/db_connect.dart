import 'dart:convert';

import 'package:http/http.dart' as http;

class ConnectDatabase {
  getString() async {
    var result = await http.get(Uri.parse(''));
    if (result.statusCode == 200) {
      return jsonDecode(result.body);
    }
  }
}