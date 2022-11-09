import 'package:contatos/models/contato.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/contatos_provider.dart';

class Formulario extends StatelessWidget {
  Formulario({Key? key}) : super(key: key);
  final _inputFormulario = GlobalKey<FormState>();
  final Map<String, String?> _auxiliarFormulario = {};

  void _carregarDados(Contato contato) {
    if (contato != null) {
      _auxiliarFormulario['id'] = contato.id;
      _auxiliarFormulario['nome'] = contato.nome;
      _auxiliarFormulario['numero'] = contato.numero;
      _auxiliarFormulario['urlDoAvatar'] = contato.urlDoAvatar;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Center(
          child: Text(
            'Adicionar contato',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 8.0),
        child: Form(
          key: _inputFormulario,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  initialValue: _auxiliarFormulario['nome'],
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                  ),
                  validator: (valor) {
                    if (valor == null || valor.trim().isEmpty) {
                      return "Este campo está vazio.";
                    } else {
                      _inputFormulario.currentState!.save();
                    }
                  },
                  onSaved: (valorInserido) =>
                      _auxiliarFormulario['nome'] = valorInserido,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  initialValue: _auxiliarFormulario['numero'],
                  decoration: const InputDecoration(
                    labelText: 'Número',
                  ),
                  validator: (valor) {
                    if (valor == null || valor.trim().isEmpty) {
                      return "Este campo está vazio.";
                    } else {
                      _inputFormulario.currentState!.save();
                    }
                  },
                  onSaved: ((valorInserido) =>
                      _auxiliarFormulario['numero'] = valorInserido),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  initialValue: _auxiliarFormulario['urlDoAvatar'],
                  decoration: const InputDecoration(
                    labelText: 'URL do avatar',
                  ),
                  onSaved: (valorIserido) =>
                      _auxiliarFormulario['urlDoAvatar'] = valorIserido,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 24.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                  ),
                  onPressed: () {
                    final _valido = _inputFormulario.currentState?.validate();

                    if (_valido!) {
                      _inputFormulario.currentState?.save();

                      Provider.of<ContatosProvider>(context, listen: false)
                          .putContato(Contato(
                        id: _auxiliarFormulario['id'],
                        nome: _auxiliarFormulario['nome']!,
                        numero: _auxiliarFormulario['numero']!,
                        urlDoAvatar: _auxiliarFormulario['urlDoAvatar'],
                      ));
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Adicionar'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
