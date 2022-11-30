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

  // Adicionar contato
  void adicionarContato(Contato contato) {
    _itens.putIfAbsent(
      '$auxID',
      () => Contato(
        id: contato.id,
        nome: contato.nome,
        numero: contato.numero,
        urlDoAvatar: contato.urlDoAvatar,
      ),
    );
    debugPrint(
        'Contato adicionado -> nome: ${contato.nome}, número: ${contato.numero}, id: ${contato.id}');
    debugPrint('chave do contato: ${_itens.keys}');
    auxID++;

    notifyListeners();
  }

  // Atualizar contato
  void atualizarContato(Contato contato) {
    _itens.update(
        contato.id!,
        (_) => Contato(
            id: contato.id,
            nome: contato.nome,
            numero: contato.numero,
            urlDoAvatar: contato.urlDoAvatar));
    debugPrint(
        'Contato modificado -> nome: ${contato.nome}, número: ${contato.numero}, id: ${contato.id}');
    notifyListeners();
  }

  // Remover
  void removeContatos(Contato contato) {
    if (contato.id != null && contato.id!.isNotEmpty) {
      _itens.remove(contato.id);
      notifyListeners();
    }
  }
}
