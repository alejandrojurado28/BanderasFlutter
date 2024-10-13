import 'package:flutter/material.dart';

class SearchBoxField extends StatelessWidget {
  final TextEditingController textController;
  final VoidCallback onSearch;

  const SearchBoxField({super.key, required this.textController, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDecoration = InputDecoration(
      hintText: 'Search a country',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send),
        onPressed: onSearch, // Llama al método de búsqueda cuando se presione
      ),
    );

    return TextFormField(
      controller: textController,
      decoration: inputDecoration,
    );
  }
}
