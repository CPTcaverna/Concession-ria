import 'package:concessionaria/dao/agendamentoDao.dart';
import 'package:concessionaria/dao/memory/agendamentoDaoMemory.dart';
import 'package:concessionaria/dao/memory/carroDaoMemory.dart';
import 'package:concessionaria/dao/memory/clienteDaoMemory.dart';
import 'package:concessionaria/dao/memory/funcionarioDaoMemory.dart';
import 'package:concessionaria/models/agendamento.dart';
import 'package:concessionaria/models/carro.dart';
import 'package:concessionaria/models/cliente.dart';
import 'package:concessionaria/models/funcionario.dart';
import 'package:flutter/material.dart';

class AgendamentoTestDrive extends StatefulWidget {
const AgendamentoTestDrive({ Key? key }) : super(key: key);

  @override
  State<AgendamentoTestDrive> createState() => _AgendamentoTestDriveState();
}

class _AgendamentoTestDriveState extends State<AgendamentoTestDrive> {

  final TextEditingController dataController = TextEditingController();
  final TextEditingController horaController = TextEditingController();

  late List<Cliente> clientes = ClienteDaoMemory().listarTodos();
  late List<Funcionario> funcionarios = FuncionarioDaoMemory().listarTodos();
  late List<Carro> carros = CarroDaoMemory().listarTodos();

  late List<String> nomesClientes = clientes.map((cliente) => cliente.nome).toList();
  late List<String> nomesFuncionarios = funcionarios.map((funcionario) => funcionario.nome).toList();
  late List<String> nomesCarros = carros.map((carro) => carro.nome).toList();

  late Cliente cliente = Cliente(idCliente: 0, nome: '', cpf: '',telefone: '', email: '');
  late Funcionario funcionario = Funcionario(idFuncionario: 0, nome: '', cpf: '',telefone: '', email: '');
  late Carro carro = Carro(idCarro: 0, nome: '', modelo: '', preco: 0, ano: 0);

  late AgendamentoeDao agendamento = AgendamentoDaoMemory();

  @override
  Widget build(BuildContext context){

    void salvar() {
      final Agendamento registro = Agendamento(idAgendamento: 0, idCliente: 0, idCarro: 0, idFuncionario: 0, dataHora: DateTime(0));

      registro.idCliente = cliente.idCliente;
      registro.idCarro = carro.idCarro;
      registro.idFuncionario = funcionario.idFuncionario;

      List<String> divisaoData = dataController.text.split('/');
      int day = int.parse(divisaoData[0]);
      int mouth = int.parse(divisaoData[1]);
      int year = int.parse(divisaoData[2]);

      List<String> divisaoHora = horaController.text.split(':');
      int hour = int.parse(divisaoData[0]);
      int minute = int.parse(divisaoHora[1]);

      registro.dataHora = DateTime(year, mouth, day, hour, minute);
      print(registro.dataHora);
      agendamento.inserir(registro);
      agendamento.postAgendamento();
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Drive'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            SizedBox(
              width: 400,
              child: DropdownButton(
                hint: Text(cliente.nome == "" ? "Clientes" : cliente.nome, 
                style: TextStyle(
                  fontSize: 15
                  ),
                ),
                items: nomesClientes.asMap().entries.map((e) {
                  int i = e.key;
                  String nome = e.value;
                  return DropdownMenuItem(
                    value: i,
                    child: Text(nome),
                  );
                }).toList(), 
                onChanged: (value) {
                  setState(() {
                    cliente = ClienteDaoMemory().selecionarPorId((value as int) + 1) as Cliente;
                  });
                }
                )
              ),
            const SizedBox(height: 40,),
            SizedBox(
              width: 400,
              child: DropdownButton(
                hint: Text(funcionario.nome == "" ? "Funcionarios" : funcionario.nome, 
                style: TextStyle(
                  fontSize: 15
                  ),
                ),
                items: nomesFuncionarios.asMap().entries.map((e) {
                  int i = e.key;
                  String nome = e.value;
                  return DropdownMenuItem(
                    value: i,
                    child: Text(nome),
                  );
                }).toList(), 
                onChanged: (value) {
                  setState(() {
                    funcionario = FuncionarioDaoMemory().selecionarPorId((value as int) + 1) as Funcionario;
                  });
                }
                )
              ),
            const SizedBox(height: 40,),
            SizedBox(
              width: 400,
              child: DropdownButton(
                hint: Text(carro.nome == "" ? "Carros" : carro.nome, 
                style: TextStyle(
                  fontSize: 15
                  ),
                ),
                items: nomesCarros.asMap().entries.map((e) {
                  int i = e.key;
                  String nome = e.value;
                  return DropdownMenuItem(
                    value: i,
                    child: Text(nome),
                  );
                }).toList(),  
                onChanged: (value) {
                  setState(() {
                    carro = CarroDaoMemory().selecionarPorId((value as int) + 1) as Carro;
                  });
                }
                )
              ),
            const SizedBox(height: 40,),
            SizedBox(
              width: 400,
              child: TextField(
                controller: dataController,
                style: TextStyle(

                ),
                decoration: InputDecoration(
                  labelText: 'Data'
                ),
              ),
            ),
            const SizedBox(height: 40,),
            SizedBox(
              width: 400,
              child: TextField(
                controller: horaController,
                style: TextStyle(

                ),
                decoration: InputDecoration(
                  labelText: 'Hora'
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