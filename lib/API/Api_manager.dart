import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newss_app/API/Models%20from%20Api/SoursesResponse.dart';

import 'Models from Api/NewsResonse.dart';

//-----------------------------------------------------------------------------------------------
class ApiManger {
  static const String BASE_URL = "newsapi.org";

  static const String API_KEY = "59c2b4bd36a740b18ea3619e95c924b7";

  //-----------------------------------------------------------------------------------------------
  static Future<SourcesResponse> getNewsSourses(String catId) async {
    var uri = Uri.https(BASE_URL, "/v2/top-headlines/sources", {
      "apiKey": API_KEY,
      "category": catId,
    });
    var response = await http.get(uri);
    var json = jsonDecode(response.body); //convert to json
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(
        json); //convert json to my dataclass (sources) ;
    return sourcesResponse;
  }

  //-----------------------------------------------------------------------------------------------
  static Future<NewsResponse> getNews(
      {int? page, String? sourceId, String? searchKeyword}) async {
    var uri = Uri.https(BASE_URL, 'v2/everything', {
      'page': '$page',
      'apiKey': API_KEY,
      'sources': sourceId,
      'q': searchKeyword,
      'pageSize': '20',
    }); // sourceId() ==> which i will send it to the function
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
// == == == ==  == == == == == == ==  == == == == == == ==  == == ==
}
