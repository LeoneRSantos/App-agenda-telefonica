import 'package:contatos/views/formulario.dart';
import 'package:flutter/material.dart';
import '../models/contato.dart';

class ComponenteContato extends StatelessWidget {
  const ComponenteContato({Key? key, required this.contato}) : super(key: key);

  final Contato contato;
  @override
  Widget build(BuildContext context) {
    final avatarAlternativo = contato.urlDoAvatar == null ||
            contato.urlDoAvatar!.isEmpty ||
            contato.urlDoAvatar == ''
        ? const CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(contato.urlDoAvatar!),
          );
    return ListTile(
      leading: avatarAlternativo,
      title: Text(contato.nome),
      subtitle: Text(contato.numero),
      trailing: SizedBox(
        width: 80.0,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const Formulario()),
                );
              },
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
