import 'package:contatos/provider/contatos_provider.dart';
import 'package:contatos/routes/rotas_do_app.dart';
import 'package:contatos/views/formulario.dart';
import 'package:contatos/views/lista_de_contatos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'provider/tema_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => ContatosProvider()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          RotasDoApp.rotaHome: (context) => const ListaDeContatos(),
          RotasDoApp.rotaFormulario: (context) => Formulario(),
        },
      ),
    );
  }
}
