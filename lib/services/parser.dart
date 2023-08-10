import 'package:the_internet_folks/api_constants.dart';
import 'package:the_internet_folks/model/response.dart';
import 'package:the_internet_folks/services/fetcher.dart';

Future getResponse() async {
  // TODO: set url based on views
  return await loadData(getAllEvents);
}

Future deserializer() async {
  String jsonResponse = getResponse().toString();
  Response parsedObj = Response.fromJson(jsonResponse);
  return parsedObj;
}
