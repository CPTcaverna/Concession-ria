import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
const Menu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
                  Navigator.of(context).pushNamed('/cadastros');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  "CADASTROS", 
                  
                ),
              ),
            ),
            const SizedBox(height: 40,),
            SizedBox(
              width: 240,
              height: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/listagens');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  "LISTAGENS", 
                  
                ),
              ),
            ),
            const SizedBox(height: 40,),
            SizedBox(
              width: 240,
              height: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/edicoes');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  "EDIÇÕES", 
                  
                ),
              ),
            ),
            const SizedBox(height: 40,),
            SizedBox(
              width: 240,
              height: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/agendamentoTestDrive');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  "TEST DRIVE", 
                  
                ),
              ),
            ),
            const SizedBox(height: 40,),
            SizedBox(
              width: 240,
              height: 40,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/login');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  "SAIR", 
                  
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}