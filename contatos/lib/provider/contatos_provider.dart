import 'package:contatos/data/mapa_contatos.dart';
import 'package:flutter/material.dart';
import '../models/contato.dart';

class ContatosProvider with ChangeNotifier {
  Dados dados = Dados();

  List<Contato> get getItens {
    return [...dados.getDados.values];
  }

  int get quantidadeDeElementos {
    return dados.getDados.length;
  }

  Contato getIndex(int i) {
    return dados.getDados.values.elementAt(i);
  }

  // Adicionar e atualizar
  void putContato(Contato contato) {
    if (contato.id != null &&
        contato.id!.trim().isNotEmpty &&
        dados.getDados.containsKey(contato.id)) {
      atualizarContato(contato);
    } else {
      adicionarContato(contato);
    }
  }

  // Adicionar contato
  void adicionarContato(Contato contato) {
    dados.adicionar(contato);

    notifyListeners();
  }

  // Atualizar contato
  void atualizarContato(Contato contato) {
    dados.atualizar(contato);
    notifyListeners();
  }

  // Remover
  void removeContatos(Contato contato) {
    if (contato.id != null && contato.id!.isNotEmpty) {
      dados.remover(contato);
      notifyListeners();
    }
  }
}
