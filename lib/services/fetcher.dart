import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future loadData(String url) async {
  try {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String responseBody = response.body;
      if (kDebugMode) {
        print("Response body:");
        print(responseBody);
      }
      return responseBody;
    } else {
      if (kDebugMode) {
        print(response.statusCode);
      }
    }
  } catch (e) {
    return e.toString();
  }
}
