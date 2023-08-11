import 'package:flutter/foundation.dart';
import 'package:the_internet_folks/model/content.dart';
import 'package:the_internet_folks/model/meta.dart';
import 'package:the_internet_folks/model/response.dart';

import '../api_constants.dart';
import '../services/fetcher.dart';

class ResponseViewModel extends ChangeNotifier {
  bool _loading = false;

  Response _response = Response(
      content: Content(dataList: [], metadata: Meta(total: 0)), status: true);

  ResponseViewModel() {
    parser();
  }

  Response get response => _response;
  bool get loading => _loading;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  // String getViewExp(String view) {
  //   switch (view) {
  //     case "Home":
  //       return getAllEvents;
  //     case "Search":
  //       return searchAllEvents;
  //     default:
  //       return getEventDetails;
  //   }
  // }

  Future parser() async {
    setLoading(true);
    if (kDebugMode) {
      print(_loading);
    }

    try {
      //String exp = getViewExp(view);
      String fetchedResponse = await loadData(getAllEvents);

      // TODO: not able to parse, fix
      _response = Response.fromJson(fetchedResponse);

      if (kDebugMode) {
        print("Parsed Obj:\n");
        print(_response);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return e.toString();
    }

    setLoading(false);
    if (kDebugMode) {
      print(_loading);
    }
  }
}
