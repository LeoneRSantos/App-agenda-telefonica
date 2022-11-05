import 'package:contatos/provider/contatos_provider.dart';
import 'package:contatos/widgets/componente_contato.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaDeContatos extends StatelessWidget {
  const ListaDeContatos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContatosProvider contatos = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          )
        ],
        title: const Center(
          child: Text('Contatos'),
        ),
      ),
      body: ListView.builder(
          itemCount: contatos.quantidadeDeElementos,
          itemBuilder: (BuildContext contexto, int indice) =>
              ComponenteContato(contato: contatos.getIndex(indice))),
    );
  }
}
