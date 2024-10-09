import 'package:banderas/domain/entities/flag.dart';
import 'package:banderas/infraestructure/models/country_model.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Flag> getAnswer() async {
    final response = await _dio.get('https://restcountries.com/v3.1/name/{name}');

    if (response.statusCode == 200) {
      final countryModel = CountriesModel.fromJson(response.data);
    }
  }
}