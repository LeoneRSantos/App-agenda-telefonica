import 'package:flutter/material.dart';

class Formulario extends StatelessWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Center(
          child: Text(
            'Adicionar contato',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
