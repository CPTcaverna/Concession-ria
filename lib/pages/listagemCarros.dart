import 'package:concessionaria/dao/memory/carroDaoMemory.dart';
import 'package:concessionaria/models/carro.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListagemCarros extends StatefulWidget {
  ListagemCarros({ Key? key }) : super(key: key);

  @override
  State<ListagemCarros> createState() => _ListagemCarrosState();
}

class _ListagemCarrosState extends State<ListagemCarros> {
  List<DataRow> rows = [];

  List<Carro> carros = CarroDaoMemory().listarTodos();

  excluir(BuildContext context, Carro carro) {
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
                  CarroDaoMemory().excluir(carro);
                  CarroDaoMemory().postCarro();
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
    for(Carro i in carros) {
      rows.add(DataRow(cells: [
        DataCell(Text(i.idCarro.toString())),
        DataCell(Text(i.nome)),
        DataCell(Text(i.modelo)),
        DataCell(Text(i.preco.toString())),
        DataCell(Text(i.ano.toString())),
      ],onLongPress: () => excluir(context, i)));
    }
    return rows;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carros'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          DataTable(
            columns: const [
              DataColumn(label: Text('Id')),
              DataColumn(label: Text('Nome')),
              DataColumn(label: Text('Modelo')),
              DataColumn(label: Text('Preço')),
              DataColumn(label: Text('Ano')),
            ], 
            rows: criarLinhas()
          )
        ],
      ),
    );
  }
}