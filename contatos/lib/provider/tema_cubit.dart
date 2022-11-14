import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

class TemaCubit extends Cubit<ThemeData> {
  TemaCubit() : super(ThemeData.light());

  bool _temaEscuro = false; 

  bool get getTema => _temaEscuro;

  void alterarTema() {  
    _temaEscuro = !_temaEscuro; 
    
    if (_temaEscuro==true) {
      emit(ThemeData.dark());
    }
    else if (_temaEscuro==false){ 
      emit(ThemeData.light());
    }
  }
}
