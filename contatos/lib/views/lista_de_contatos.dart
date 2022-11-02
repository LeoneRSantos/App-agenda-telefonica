import 'package:contatos/data/mapa_contatos.dart';
import 'package:contatos/widgets/componente_contato.dart';
import 'package:flutter/material.dart';

class ListaDeContatos extends StatelessWidget {
  const ListaDeContatos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contatos = mapa_contatos;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Center(
          child: Text('Contatos'),
        ),
      ),
      body: ListView.builder(
          itemCount: contatos.length,
          itemBuilder: (BuildContext contexto, int indice) =>
              ComponenteContato(contato: contatos.values.elementAt(indice))),
    );
  }
}
