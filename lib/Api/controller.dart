import 'dart:convert';

import 'package:countries/Api/handle_api.dart';
import 'package:countries/models/controller_Countries.dart';
import 'package:http/http.dart' as http;

class ApiController extends HandleApi {
  @override
  Future<ModelControllerCountries> getCountries() async {
    String _url =
        'https://countriesnow.space/api/v0.1/countries/info?returns=currency,flag,unicodeFlag,dialCode';
    late ModelControllerCountries _data;
    try {
      Uri _uri = Uri.parse(_url);
      http.Response data =
          await http.get(_uri).timeout(const Duration(seconds: 100));

      if (data.statusCode == 200) {
        var json = jsonDecode(data.body);
        _data = ModelControllerCountries.fromJson(json);
      } else {
        throw Exception('Failed To Fetch Data');
      }
    } catch (e) {
      print('General Error : $e');
    }
    return _data;
  }
}
