import 'package:countries/models/countries.dart';

class ModelControllerCountries {
  bool? error;
  String? msg;
  List<ModelCountries>? listCountries;

  ModelControllerCountries({this.error, this.msg, this.listCountries});

  ModelControllerCountries.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    msg = json['msg'];
    if (json['data'] != null) {
      listCountries = <ModelCountries>[];
      json['data'].forEach((v) {
        listCountries!.add(ModelCountries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['msg'] = msg;
    if (listCountries != null) {
      data['data'] = listCountries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
