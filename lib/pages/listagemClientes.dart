import 'package:concessionaria/dao/memory/clienteDaoMemory.dart';
import 'package:concessionaria/models/cliente.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListagemClientes extends StatefulWidget {
  ListagemClientes({ Key? key }) : super(key: key);

  @override
  State<ListagemClientes> createState() => _ListagemClientesState();
}

class _ListagemClientesState extends State<ListagemClientes> {
  List<DataRow> rows = [];

  List<Cliente> clientes = ClienteDaoMemory().listarTodos();

  excluir(BuildContext context, Cliente cliente) {
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
                  ClienteDaoMemory().excluir(cliente);
                  ClienteDaoMemory().postCliente();
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
    for(Cliente i in clientes) {
      rows.add(DataRow(cells: [
        DataCell(Text(i.idCliente.toString())),
        DataCell(Text(i.nome)),
        DataCell(Text(i.cpf)),
        DataCell(Text(i.telefone)),
        DataCell(Text(i.email)),
      ],onLongPress: () => excluir(context, i),));
    }
    return rows;
  }

  @override
  Widget build(BuildContext context){

    setState(() {
      
    });
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
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
            rows: criarLinhas()
          )
        ],
      ),
    );
  }
}