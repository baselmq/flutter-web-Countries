import 'package:countries/models/controller_Countries.dart';

abstract class HandleApi {
  // * get Countries list
  Future<ModelControllerCountries> getCountries();
}
