import 'package:banderas/infraestructure/models/CountryModel.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<CountriesModel> getCountryByName(String countryName) async {
    try {
      final response = await _dio.get('https://restcountries.com/v3.1/name/$countryName');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        // Asegurarse de que hay al menos un país en la lista
        if (data.isNotEmpty) {
          return CountriesModel.fromJson(data[0]);
        } else {
          throw Exception('No se encontraron países con ese nombre');
        }
      } else {
        throw Exception('Error en la respuesta del servidor');
      }
    } catch (e) {
      throw Exception('Error al obtener los datos del país: $e');
    }
  }
}
