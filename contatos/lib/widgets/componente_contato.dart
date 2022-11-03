import 'package:flutter/material.dart';
import '../models/contato.dart';

class ComponenteContato extends StatelessWidget {
  const ComponenteContato({Key? key, required this.contato}) : super(key: key);

  final Contato contato;
  @override
  Widget build(BuildContext context) {
    final avatarAlternativo = contato.urlDoAvatar == null ||
            contato.urlDoAvatar.isEmpty ||
            contato.urlDoAvatar == ''
        ? CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(contato.urlDoAvatar),
          );
    return ListTile(
      leading: avatarAlternativo,
    );
  }
}
