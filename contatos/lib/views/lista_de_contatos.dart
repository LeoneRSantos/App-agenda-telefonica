import 'package:contatos/provider/contatos_provider.dart';
import 'package:contatos/provider/tema_cubit.dart';
import 'package:contatos/routes/rotas_do_app.dart';
import 'package:contatos/widgets/componente_contato.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ListaDeContatos extends StatelessWidget {
  const ListaDeContatos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContatosProvider contatos = Provider.of(context);
    final TemaCubit cubit = BlocProvider.of<TemaCubit>(
      context,
      listen: true,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              cubit.alterarTema();
            },
            icon: cubit.getTema
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  RotasDoApp.rotaFormulario,
                );
              },
              icon: const Icon(
                Icons.add,
                size: 28.0,
              ),
            ),
          )
        ],
        title: const Center(
          child: Text(
            'Contatos',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: contatos.quantidadeDeElementos,
          itemBuilder: (BuildContext contexto, int indice) =>
              ComponenteContato(contato: contatos.getIndex(indice))),
    );
  }
}
