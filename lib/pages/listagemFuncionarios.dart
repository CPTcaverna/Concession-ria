import 'package:concessionaria/dao/memory/funcionarioDaoMemory.dart';
import 'package:concessionaria/models/funcionario.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListagemFuncionarios extends StatefulWidget {
  ListagemFuncionarios({ Key? key }) : super(key: key);

  @override
  State<ListagemFuncionarios> createState() => _ListagemFuncionariosState();
}

class _ListagemFuncionariosState extends State<ListagemFuncionarios> {
  List<DataRow> rows = [];

  List<Funcionario> funcionarios = FuncionarioDaoMemory().listarTodos();

  excluir(BuildContext context, Funcionario funcionario) {
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
                  FuncionarioDaoMemory().excluir(funcionario);
                  FuncionarioDaoMemory().postFuncionario();
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
    for(Funcionario i in funcionarios) {
      rows.add(DataRow(cells: [
        DataCell(Text(i.idFuncionario.toString())),
        DataCell(Text(i.nome)),
        DataCell(Text(i.cpf)),
        DataCell(Text(i.telefone)),
        DataCell(Text(i.email)),
      ],onLongPress: () => excluir(context, i)));
    }
    return rows;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Funcionarios'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          DataTable(
            columns: const [
              DataColumn(label: Text('Id')),
              DataColumn(label: Text('Nome')),
              DataColumn(label: Text('Cpf')),
              DataColumn(label: Text('Telefone')),
              DataColumn(label: Text('E-mail')),
            ], 
            rows: criarLinhas())
        ],
      ),
    );
  }
}