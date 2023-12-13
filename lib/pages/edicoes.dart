import 'package:flutter/material.dart';

class Edicoes extends StatelessWidget {
const Edicoes({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edições'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            SizedBox(
              width: 240,
              height: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/editarCliente');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  "EDITAR CLIENTE", 
                ),
              ),
            ),
            const SizedBox(height: 40,),
            SizedBox(
              width: 240,
              height: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/editarFuncionario');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  "EDITAR FUNCIONARIO", 
                  
                ),
              ),
            ),
            const SizedBox(height: 40,),
            SizedBox(
              width: 240,
              height: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/editarCarro');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  "EDITAR CARRO", 
                  
                ),
              ),
            ),
            const SizedBox(height: 40,),
            SizedBox(
              width: 240,
              height: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/editarAgendamento');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  "EDITAR AGENDAMENTOS", 
                  
                ),
              ),
            ),
          ]
        )
      )
    );
  }
}