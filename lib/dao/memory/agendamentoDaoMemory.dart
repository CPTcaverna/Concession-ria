import 'dart:async';
import 'package:concessionaria/dao/agendamentoDao.dart';
import 'package:concessionaria/models/agendamento.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AgendamentoDaoMemory implements AgendamentoeDao {
  static final AgendamentoDaoMemory _instance = AgendamentoDaoMemory._();
  AgendamentoDaoMemory._();
  static AgendamentoDaoMemory get instance => _instance;
  factory AgendamentoDaoMemory() => _instance;

  late final DatabaseReference agendamentosReference = FirebaseDatabase.instance.ref().child('agendamentos');
  late StreamSubscription<DatabaseEvent> agendamentosSubscription;

  List<Agendamento> dados = [
    Agendamento(
      idAgendamento: 1,
      idCliente: 1,
      idCarro: 1,
      idFuncionario: 1,
      dataHora: DateTime(2023, 12, 31, 08, 00)
    )
  ];

  @override
  bool alterar(Agendamento agendamento) {
    int ind = dados.indexOf(agendamento);
    if (ind >= 0) {
      dados[ind] = agendamento;
      return true;
    }
    return false;
  }

  @override
  bool excluir(Agendamento agendamento) {
    int ind = dados.indexOf(agendamento);
    if (ind >= 0) {
      dados.removeAt(ind);
      return true;
    }
    return false;
  }

  @override
  bool inserir(Agendamento agendamento) {
    dados.add(agendamento);
    agendamento.idAgendamento = dados.length;
    return true;
  }

  @override
  List<Agendamento> listarTodos() {
    return dados;
  }

  @override
  Agendamento? selecionarPorId(int id) {
    for (int i = 0; i < dados.length; i++) {
      if (dados[i].idAgendamento == id) return dados[i];
    }
    return null;
  }
  
  @override
  void getAgendamento() async {
    try {
      final agendamentoSnapshot = await agendamentosReference.get();
      Map agendamento;
      dados = [];
      for (var i = 1; i < (agendamentoSnapshot.value as List<dynamic>).length; i++) {
        agendamento = (agendamentoSnapshot.value as List<dynamic>)[i];
        dados.add(
          Agendamento(
            idAgendamento: i,
            idCliente: agendamento['idCliente'],
            idCarro: agendamento['idCarro'],
            idFuncionario: agendamento['idFuncionario'],
            dataHora: DateTime.parse(agendamento['dataHora'])
          )
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void postAgendamento() async {
    Map<String, dynamic> mapDados = {};
    for (var agendamento in dados) {
      mapDados[agendamento.idAgendamento.toString()] = {
        'idCliente': agendamento.idCliente,
        'idCarro': agendamento.idCarro,
        'idFuncionario': agendamento.idFuncionario,
        'dataHora': agendamento.dataHora.toString(),
      };
    }
    await agendamentosReference.set(mapDados);
  }
}
