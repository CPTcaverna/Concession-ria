import 'package:concessionaria/dao/carroDao.dart';
import 'package:concessionaria/dao/memory/carroDaoMemory.dart';
import 'package:concessionaria/models/carro.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditarCarro extends StatelessWidget {
  EditarCarro({ Key? key }) : super(key: key);

  final TextEditingController idController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController modeloController = TextEditingController();
  final TextEditingController precoController = TextEditingController();
  final TextEditingController anoController = TextEditingController();

  CarroDao carro = CarroDaoMemory();

  @override
  Widget build(BuildContext context){

    void salvar() {
      final Carro registro = CarroDaoMemory().selecionarPorId(int.parse(idController.text))!;
      registro.nome = nomeController.text;
      registro.modelo = modeloController.text;
      registro.preco = double.parse(precoController.text);
      registro.ano = int.parse(anoController.text);

      carro.alterar(registro);
      carro.postCarro();
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Carro'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            SizedBox(
              width: 400,
              child: TextField(
                controller: idController,
                style: TextStyle(

                ),
                decoration: InputDecoration(
                  labelText: 'Id'
                ),
              ),
            ),
            const SizedBox(height: 40,),
            SizedBox(
              width: 400,
              child: TextField(
                controller: nomeController,
                style: TextStyle(

                ),
                decoration: InputDecoration(
                  labelText: 'Nome'
                ),
              ),
            ),
            const SizedBox(height: 40,),
            SizedBox(
              width: 400,
              child: TextField(
                controller: modeloController,
                style: TextStyle(

                ),
                decoration: InputDecoration(
                  labelText: 'Modelo'
                ),
              ),
            ),
            const SizedBox(height: 40,),
            SizedBox(
              width: 400,
              child: TextField(
                controller: precoController,
                style: TextStyle(

                ),
                decoration: InputDecoration(
                  labelText: 'Preço'
                ),
              ),
            ),
            const SizedBox(height: 40,),
            SizedBox(
              width: 400,
              child: TextField(
                controller: anoController,
                style: TextStyle(

                ),
                decoration: InputDecoration(
                  labelText: 'Ano'
                ),
              ),
            ),
            const SizedBox(height: 40,),
            SizedBox(
              height: 50,
              width: 200,
              child: TextButton(
                onPressed: salvar, 
                child: Text('Salvar', style: TextStyle(color: Colors.white, fontSize: 20),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}