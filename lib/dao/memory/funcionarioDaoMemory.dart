import 'dart:async';
import 'package:concessionaria/dao/funcionarioDao.dart';
import 'package:concessionaria/models/funcionario.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FuncionarioDaoMemory implements FuncionarioDao {
  static final FuncionarioDaoMemory _instance = FuncionarioDaoMemory._();
  FuncionarioDaoMemory._();
  static FuncionarioDaoMemory get instance => _instance;
  factory FuncionarioDaoMemory() => _instance;

  late final DatabaseReference funcionariosReference = FirebaseDatabase.instance.ref().child('funcionarios');
  late StreamSubscription<DatabaseEvent> funcionariosSubscription;

  List<Funcionario> dados = [
    Funcionario(
      idFuncionario: 1,
      nome: 'João Paulo',
      cpf: '856.654.545-32',
      telefone: '(28) 54353-4543',
      email: 'joao@gmail.com'
    )
  ];

  @override
  bool alterar(Funcionario funcionario) {
    int ind = dados.indexOf(funcionario);
    if (ind >= 0) {
      dados[ind] = funcionario;
      return true;
    }
    return false;
  }

  @override
  bool excluir(Funcionario funcionario) {
    int ind = dados.indexOf(funcionario);
    if (ind >= 0) {
      dados.removeAt(ind);
      return true;
    }
    return false;
  }

  @override
  bool inserir(Funcionario funcionario) {
    dados.add(funcionario);
    funcionario.idFuncionario = dados.length;
    return true;
  }

  @override
  List<Funcionario> listarTodos() {
    return dados;
  }

  @override
  Funcionario? selecionarPorId(int id) {
    for (int i = 0; i < dados.length; i++) {
      if (dados[i].idFuncionario == id) return dados[i];
    }
    return null;
  }
  
  @override
  void getFuncionario() async {
    try {
      final funcionarioSnapshot = await funcionariosReference.get();
      Map funcionario;
      dados = [];
      for (var i = 1; i < (funcionarioSnapshot.value as List<dynamic>).length; i++) {
        funcionario = (funcionarioSnapshot.value as List<dynamic>)[i];
        dados.add(
          Funcionario(
            idFuncionario: i,
            nome: funcionario['nome'],
            cpf: funcionario['cpf'],
            telefone: funcionario['telefone'],
            email: funcionario['email']
          )
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void postFuncionario() async {
    Map<String, dynamic> mapDados = {};
    for (var funcionario in dados) {
      mapDados[funcionario.idFuncionario.toString()] = {
        'nome': funcionario.nome,
        'cpf': funcionario.cpf,
        'telefone': funcionario.telefone,
        'email': funcionario.email,
      };
    }
    await funcionariosReference.set(mapDados);
  }
}
