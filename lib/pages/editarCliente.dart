import 'package:concessionaria/dao/clienteDao.dart';
import 'package:concessionaria/dao/memory/clienteDaoMemory.dart';
import 'package:concessionaria/models/cliente.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditarCliente extends StatelessWidget {
  EditarCliente({ Key? key }) : super(key: key);
  final TextEditingController idController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  ClienteDao carro = ClienteDaoMemory();

  @override
  Widget build(BuildContext context){

    void salvar() {
      final Cliente registro = ClienteDaoMemory().selecionarPorId(int.parse(idController.text))!;
      registro.nome = nomeController.text;
      registro.cpf = cpfController.text;
      registro.telefone = telefoneController.text;
      registro.email = emailController.text;

      carro.alterar(registro);
      carro.postCliente();
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Cliente'),
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
                controller: cpfController,
                style: TextStyle(

                ),
                decoration: InputDecoration(
                  labelText: 'CPF'
                ),
              ),
            ),
            const SizedBox(height: 40,),
            SizedBox(
              width: 400,
              child: TextField(
                controller: telefoneController,
                style: TextStyle(

                ),
                decoration: InputDecoration(
                  labelText: 'Telefone'
                ),
              ),
            ),
            const SizedBox(height: 40,),
            SizedBox(
              width: 400,
              child: TextField(
                controller: emailController,
                style: TextStyle(

                ),
                decoration: InputDecoration(
                  labelText: 'E-mail'
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