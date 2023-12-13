import 'package:concessionaria/dao/agendamentoDao.dart';
import 'package:concessionaria/dao/carroDao.dart';
import 'package:concessionaria/dao/clienteDao.dart';
import 'package:concessionaria/dao/funcionarioDao.dart';
import 'package:concessionaria/dao/memory/agendamentoDaoMemory.dart';
import 'package:concessionaria/dao/memory/carroDaoMemory.dart';
import 'package:concessionaria/dao/memory/clienteDaoMemory.dart';
import 'package:concessionaria/dao/memory/funcionarioDaoMemory.dart';
import 'package:concessionaria/firebase_options.dart';
import 'package:concessionaria/pages/agendamentoTestDrive.dart';
import 'package:concessionaria/pages/cadastroCarro.dart';
import 'package:concessionaria/pages/cadastroCliente.dart';
import 'package:concessionaria/pages/cadastroFuncionario.dart';
import 'package:concessionaria/pages/cadastros.dart';
import 'package:concessionaria/pages/edicoes.dart';
import 'package:concessionaria/pages/editarAgendamento.dart';
import 'package:concessionaria/pages/editarCarro.dart';
import 'package:concessionaria/pages/editarCliente.dart';
import 'package:concessionaria/pages/editarFuncionario.dart';
import 'package:concessionaria/pages/listagemAgendamentos.dart';
import 'package:concessionaria/pages/listagemCarros.dart';
import 'package:concessionaria/pages/listagemClientes.dart';
import 'package:concessionaria/pages/listagemFuncionarios.dart';
import 'package:concessionaria/pages/listagens.dart';
import 'package:concessionaria/pages/login.dart';
import 'package:concessionaria/pages/menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ClienteDao clienteDao = ClienteDaoMemory();
  clienteDao.getCliente();

  CarroDao carroDao = CarroDaoMemory();
  carroDao.getCarro();

  FuncionarioDao funcionarioDao = FuncionarioDaoMemory();
  funcionarioDao.getFuncionario();

  AgendamentoeDao agendamentoDao = AgendamentoDaoMemory();
  agendamentoDao.getAgendamento();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Concessionaria JM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/menu': (context) => const Menu(),
        '/cadastros': (context) => const Cadastros(),
        '/cadastroCarro': (context) => CadastroCarro(),
        '/cadastroCliente': (context) => CadastroCliente(),
        '/cadastroFuncionario': (context) => CadastroFuncionario(),
        '/listagens': (context) => const Listagens(),
        '/listagemClientes': (context) => ListagemClientes(),
        '/listagemCarros': (context) => ListagemCarros(),
        '/listagemFuncionarios': (context) => ListagemFuncionarios(),
        '/listagemAgendamentos': (context) => ListagemAgendamentos(),
        '/agendamentoTestDrive': (context) => const AgendamentoTestDrive(),
        '/edicoes': (context) => const Edicoes(),
        '/editarCliente': (context) => EditarCliente(),
        '/editarFuncionario': (context) => EditarFuncionario(),
        '/editarCarro': (context) => EditarCarro(),
        '/editarAgendamento': (context) => EditarAgendamento(),
      }
    );
  }
}