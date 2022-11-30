import 'package:contatos/data/mapa_contatos.dart';
import 'package:flutter/material.dart';
import '../models/contato.dart';

class ContatosProvider with ChangeNotifier {
  final Map<String, Contato> _itens = {...mapa_contatos};

  int auxID = 5;

  List<Contato> get getItens {
    return [..._itens.values];
  }

  int get quantidadeDeElementos {
    return _itens.length;
  }

  Contato getIndex(int i) {
    return _itens.values.elementAt(i);
  }

  // Adicionar e atualizar
  void putContato(Contato contato) {
    if (contato == null) {
      return null;
    }

    if (contato.id != null &&
        contato.id!.trim().isNotEmpty &&
        _itens.containsKey(contato.id)) {
      atualizarContato(contato);
    } else {
      adicionarContato(contato);
    }
  }

    _itens.putIfAbsent(
      'key',
      () => Contato(
        id: contato.id,
        nome: contato.nome,
        numero: contato.numero, 
        urlDoAvatar: contato.urlDoAvatar,
      ),
    );

    notifyListeners();
  }

  // Remover
  void removeContatos(Contato contato) {
    if (contato != null && contato.id != null && contato.id != '') {
      _itens.remove(contato.id);
      notifyListeners();
    }
  }
}
