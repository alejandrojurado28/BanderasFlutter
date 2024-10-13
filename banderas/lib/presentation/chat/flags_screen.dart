import 'package:banderas/config/helpers/flags_answer.dart';
import 'package:banderas/infraestructure/models/CountryModel.dart';
import 'package:flutter/material.dart'; 
import 'package:banderas/presentation/widgets/shared/search_box_field.dart';

class FlagsScreen extends StatefulWidget {
  const FlagsScreen({super.key});

  @override
  _FlagsScreenState createState() => _FlagsScreenState();
}

class _FlagsScreenState extends State<FlagsScreen> {
  final TextEditingController _textController = TextEditingController();
  CountriesModel? _country;
  bool _isLoading = false;
  String? _errorMessage;

  // Método para buscar un país
  Future<void> _searchCountry() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final countryName = _textController.text;

    try {
      final countryService = GetYesNoAnswer();
      final country = await countryService.getCountryByName(countryName);
      setState(() {
        _country = country;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Country not found or there was an error';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flags Screen'),
        centerTitle: false,
        leading: const Padding(
          padding: EdgeInsets.all(2.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://media.istockphoto.com/id/843748678/es/vector/icono-de-vector-planeta-tierra.jpg?s=612x612&w=0&k=20&c=3W7svdmKiXub7v8WgrgLtXZN8ofcyAPvhgOW6VAV32w=',
            ),
          ),
        ),
      ),
      body: _FlagsView(
        textController: _textController,
        onSearch: _searchCountry,
        country: _country,
        isLoading: _isLoading,
        errorMessage: _errorMessage,
      ),
    );
  }
}

class _FlagsView extends StatelessWidget {
  final TextEditingController textController;
  final VoidCallback onSearch;
  final CountriesModel? country;
  final bool isLoading;
  final String? errorMessage;

  const _FlagsView({
    required this.textController,
    required this.onSearch,
    this.country,
    required this.isLoading,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SearchBoxField(
            textController: textController,
            onSearch: onSearch,
          ),
          const SizedBox(height: 20),

          // Mostrar un indicador de carga mientras se realiza la búsqueda
          if (isLoading)
            const CircularProgressIndicator(),

          // Mostrar un mensaje de error si no se encuentra el país
          if (errorMessage != null)
            Text(errorMessage!, style: const TextStyle(color: Colors.red)),

          // Mostrar la información del país si está disponible
          if (country != null)
            Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  country!.name.common,  
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                
                Image.network(
                  country!.flags.png,
                  width: 200,
                  height: 100,
                ),
                const SizedBox(height: 10),

                Text(
                  'Capital: ${country!.capital.isNotEmpty ? country!.capital.first : 'N/A'}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
