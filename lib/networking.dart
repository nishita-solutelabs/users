import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiData {
  String apiUrl = "https://api.github.com/users";

  Future getApiJsonData() async {
    http.Response response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }
}
