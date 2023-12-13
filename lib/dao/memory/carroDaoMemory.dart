import 'dart:async';
import 'package:concessionaria/dao/carroDao.dart';
import 'package:concessionaria/models/carro.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CarroDaoMemory implements CarroDao {
  static final CarroDaoMemory _instance = CarroDaoMemory._();
  CarroDaoMemory._();
  static CarroDaoMemory get instance => _instance;
  factory CarroDaoMemory() => _instance;

  late final DatabaseReference carrosReference = FirebaseDatabase.instance.ref().child('carros');
  late StreamSubscription<DatabaseEvent> carrosSubscription;

  List<Carro> dados = [
    Carro(
      idCarro: 1,
      nome: 'Palio',
      modelo: 'Fiat',
      preco: 200,
      ano: 2023
    )
  ];

  @override
  bool alterar(Carro carro) {
    int ind = dados.indexOf(carro);
    print(dados.indexOf(carro));
    if (ind >= 0) {
      dados[ind] = carro;
      return true;
    }
    return false;
  }

  @override
  bool excluir(Carro carro) {
    int ind = dados.indexOf(carro);
    if (ind >= 0) {
      dados.removeAt(ind);
      return true;
    }
    return false;
  }

  @override
  bool inserir(Carro carro) {
    dados.add(carro);
    carro.idCarro = dados.length;
    return true;
  }

  @override
  List<Carro> listarTodos() {
    return dados;
  }

  @override
  Carro? selecionarPorId(int id) {
    for (int i = 0; i < dados.length; i++) {
      if (dados[i].idCarro == id) return dados[i];
    }
    return null;
  }
  
  @override
  void getCarro() async {
    try {
      final carroSnapshot = await carrosReference.get();
      Map carro;
      dados = [];
      for (var i = 1; i < (carroSnapshot.value as List<dynamic>).length; i++) {
        carro = (carroSnapshot.value as List<dynamic>)[i];
        dados.add(
          Carro(
            idCarro: i,
            nome: carro['nome'],
            modelo: carro['modelo'],
            preco: carro['preco'],
            ano: carro['ano']
          )
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void postCarro() async {
    Map<String, dynamic> mapDados = {};
    for (var carro in dados) {
      mapDados[carro.idCarro.toString()] = {
        'nome': carro.nome,
        'modelo': carro.modelo,
        'preco': carro.preco,
        'ano': carro.ano,
      };
    }
    await carrosReference.set(mapDados);
  }
}
