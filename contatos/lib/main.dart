import 'package:contatos/provider/contatos_provider.dart';
import 'package:contatos/routes/rotas_do_app.dart';
import 'package:contatos/views/formulario.dart';
import 'package:contatos/views/lista_de_contatos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'models/temas.dart';
import 'provider/tema_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => TemaCubit(),
      )
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TemaCubit temaAtual = BlocProvider.of<TemaCubit>(context, listen: true);

    return ChangeNotifierProvider(
      create: ((context) => ContatosProvider()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: temaAtual.getTema ? Temas.temaEscuro : Temas.temaClaro,
        routes: {
          RotasDoApp.rotaHome: (context) => const ListaDeContatos(),
          RotasDoApp.rotaFormulario: (context) => Formulario(),
        },
      ),
    );
  }
}
