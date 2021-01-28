import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiProvider {
  /// Function for fetching [ List]
  Future<String> getListResponse() async {
    try {
      Response response = await http.get(
        'https://api.github.com/users/hadley/orgs',
      );

      var jsonObject = json.decode(response.body);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
