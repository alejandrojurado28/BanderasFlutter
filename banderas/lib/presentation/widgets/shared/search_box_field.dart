import 'package:flutter/material.dart';

class SearchBoxField extends StatelessWidget {
  const SearchBoxField({super.key});

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
        icon: const Icon( Icons.send ),
        onPressed: () {
          // final textvalue = textController.value.text;
          print('button');
        }
      )
    );

    return TextFormField(
      decoration: inputDecoration,
    );
  }
}