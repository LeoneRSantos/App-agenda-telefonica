import 'package:contatos/data/mapa_contatos.dart';
import 'package:flutter/material.dart';
import '../models/contato.dart';

class ContatosProvider with ChangeNotifier {
  Dados dados = Dados();

  List<Contato> get getItens {
    return [...Dados.mapa_contatos.values];
  }

  int get quantidadeDeElementos {
    return Dados.mapa_contatos.length;
  }

  Contato getIndex(int i) {
    return Dados.mapa_contatos.values.elementAt(i);
  }

  // Adicionar e atualizar
  void putContato(Contato contato) {
    if (contato.id != null &&
        contato.id!.trim().isNotEmpty &&
        Dados.mapa_contatos.containsKey(contato.id)) {
      atualizarContato(contato);
    } else {
      adicionarContato(contato);
    }
  }

  // Adicionar contato
  void adicionarContato(Contato contato) {
    Dados.mapa_contatos.putIfAbsent(
      '$auxID',
      () => Contato(
        id: '$auxID',
        nome: contato.nome,
        numero: contato.numero,
        urlDoAvatar: contato.urlDoAvatar,
      ),
    );
    debugPrint(
        'Contato adicionado -> nome: ${contato.nome}, número: ${contato.numero}, id: ${contato.id}');
    debugPrint('chave do contato: ${Dados.mapa_contatos.keys}');
    auxID++;

    notifyListeners();
  }

  // Atualizar contato
  void atualizarContato(Contato contato) {
    Dados.mapa_contatos.update(
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
      Dados.mapa_contatos.remove(contato.id);
      notifyListeners();
    }
  }
}
