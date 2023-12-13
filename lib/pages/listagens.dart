import 'package:flutter/material.dart';

class Listagens extends StatelessWidget {
const Listagens({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listagens'),
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
                  Navigator.of(context).pushNamed('/listagemClientes');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  "CLIENTE", 
                ),
              ),
            ),
            const SizedBox(height: 40,),
            SizedBox(
              width: 240,
              height: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/listagemFuncionarios');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  "FUNCIONARIO", 
                  
                ),
              ),
            ),
            const SizedBox(height: 40,),
            SizedBox(
              width: 240,
              height: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/listagemCarros');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  "CARRO", 
                  
                ),
              ),
            ),
            const SizedBox(height: 40,),
            SizedBox(
              width: 240,
              height: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/listagemAgendamentos');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  "AGENDAMENTOS", 
                  
                ),
              ),
            ),
          ]
        )
      )
    );
  }
}