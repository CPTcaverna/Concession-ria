import 'package:concessionaria/dao/memory/agendamentoDaoMemory.dart';
import 'package:concessionaria/dao/memory/carroDaoMemory.dart';
import 'package:concessionaria/dao/memory/clienteDaoMemory.dart';
import 'package:concessionaria/dao/memory/funcionarioDaoMemory.dart';
import 'package:concessionaria/models/agendamento.dart';
import 'package:concessionaria/models/carro.dart';
import 'package:concessionaria/models/cliente.dart';
import 'package:concessionaria/models/funcionario.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListagemAgendamentos extends StatefulWidget {
  const ListagemAgendamentos({ Key? key }) : super(key: key);

  @override
  State<ListagemAgendamentos> createState() => _ListagemAgendamentosState();
}

class _ListagemAgendamentosState extends State<ListagemAgendamentos> {
  List<DataRow> rows = [];

  List<Agendamento> agendamentos = AgendamentoDaoMemory().listarTodos();

  late Cliente cliente;

  late Carro carro;

  late Funcionario funcionario;

  excluir(BuildContext context, Agendamento agendamento) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Exclusão'),
          content: Text('Deseja Excluir?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Não'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  AgendamentoDaoMemory().excluir(agendamento);
                  AgendamentoDaoMemory().postAgendamento();
                  Navigator.of(context).pop();
                });
              },
              child: Text('Sim'),
            ),
          ],
        );
      },
    );
  }

  List<DataRow> criarLinhas() {
    rows = [];
    for(Agendamento i in agendamentos) {
      cliente = ClienteDaoMemory().selecionarPorId(i.idCliente) as Cliente;
      carro = CarroDaoMemory().selecionarPorId(i.idCliente) as Carro;
      funcionario = FuncionarioDaoMemory().selecionarPorId(i.idFuncionario) as Funcionario;
      rows.add(DataRow(cells: [
        DataCell(Text(i.idAgendamento.toString())),
        DataCell(Text(cliente.nome)),
        DataCell(Text(carro.nome)),
        DataCell(Text(funcionario.nome)),
        DataCell(Text('${i.dataHora.day}/${i.dataHora.month}/${i.dataHora.year}')),
        DataCell(Text('${i.dataHora.hour.toString().padLeft(2, '0')}:${i.dataHora.minute.toString().padLeft(2, '0')}')),
      ],onLongPress: () => excluir(context, i)));
    }
    return rows;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendamentos'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          DataTable(
            columns: const [
              DataColumn(label: Text('Id')),
              DataColumn(label: Text('Cliente')),
              DataColumn(label: Text('Carro')),
              DataColumn(label: Text('Funcionario')),
              DataColumn(label: Text('Data')),
              DataColumn(label: Text('Hora')),
            ], 
            rows: criarLinhas())
        ],
      ),
    );
  }
}