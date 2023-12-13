import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatelessWidget {
  Login({ Key? key }) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context){

    void login() async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: senhaController.text,
        );
        if(userCredential.user != null) {
          Navigator.of(context).pushNamed('/menu');
        }
      } on FirebaseAuthException catch (e) {
        print(e.code);
        print("Erro");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Faça o Login'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            SizedBox(
              width: 400,
              child: TextField(
                controller: emailController,
                style: TextStyle(

                ),
                decoration: InputDecoration(
                  labelText: 'E-mail',
                ),
              ),
            ),
            const SizedBox(height: 50,),
            SizedBox(
              width: 400,
              child: TextField(
                controller: senhaController,
                obscureText: true,
                style: TextStyle(
                  
                ),
                decoration: InputDecoration(
                  labelText: 'Senha',
                ),
              ),
            ),
            const SizedBox(height: 50,),
            SizedBox(
              width: 200,
              child: TextButton(
                onPressed: login,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  "LOGIN", 
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}