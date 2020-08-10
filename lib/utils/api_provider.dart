import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:AnyHow/product/reponse/fetch_photo_reponse.dart';

class ApiProvider {
  static Future<FetchPhotoResponse> fetchPhotoByKeyword(String keyword) async {
    final response = await http.get(
      'https://api.pexels.com/v1/search?query=$keyword&per_page=50&page=1',
      headers: {
        HttpHeaders.authorizationHeader:
            "563492ad6f91700001000001d5641958d9a140c9815624d68be16fb5"
      },
    );

    final responseJson = await json.decode(response.body);
    return FetchPhotoResponse.fromJson(responseJson);
  }
}
