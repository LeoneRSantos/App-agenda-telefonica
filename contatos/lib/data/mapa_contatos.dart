import 'package:contatos/models/contato.dart';
import 'package:flutter/material.dart';

class Dados {
  static Map<String, Contato> mapa_contatos = {
    '1': Contato(
        id: '1',
        nome: 'Ana',
        numero: '(85) 99322-1455',
        urlDoAvatar:
            'https://cdn.pixabay.com/photo/2017/03/01/22/18/avatar-2109804_960_720.png'),
    '2': Contato(
        id: '2',
        nome: 'Pedro',
        numero: '(86) 99508-2274',
        urlDoAvatar:
            'https://cdn.pixabay.com/photo/2017/01/31/21/23/avatar-2027366_960_720.png'),
    '3': Contato(
        id: '3',
        nome: 'Fernanda',
        numero: '(92) 99423-1212',
        urlDoAvatar:
            'https://cdn.pixabay.com/photo/2017/01/31/19/07/avatar-2026510__340.png'),
    '4': Contato(
        id: '4',
        nome: 'Gabriel',
        numero: '(85) 98176-2322',
        urlDoAvatar:
            'https://cdn.pixabay.com/photo/2017/02/23/13/05/avatar-2092113__340.png'),
  };
}
