import 'package:banderas/presentation/widgets/shared/search_box_field.dart';
import 'package:flutter/material.dart';

class FlagsScreen extends StatelessWidget {
  const FlagsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flags Screen'),
        centerTitle: false,
        leading: const Padding(
          padding: EdgeInsets.all(2.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://img.freepik.com/vector-gratis/todas-banderas-paises-eurocopa_1057-1259.jpg'),
          ),
        ),
      ),
      body: _FlagsView()
    );
  }
}

class _FlagsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          // Expanded(
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 10.0)
          //   )
          // ),
          SearchBoxField()
        ],
      )
    );
  }
}