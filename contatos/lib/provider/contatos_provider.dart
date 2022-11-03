import 'package:contatos/data/mapa_contatos.dart';
import 'package:flutter/material.dart';
import '../models/contato.dart';

class ContatosProvider with ChangeNotifier {
  final Map<String, Contato> _itens = {...mapa_contatos};

  List<Contato> get getItens {
    return [..._itens.values];
  }

  int get quantidadeDeElementos {
    return _itens.length;
  }
}
