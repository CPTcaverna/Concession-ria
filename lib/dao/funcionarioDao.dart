import 'package:concessionaria/models/funcionario.dart';

abstract class FuncionarioDao {
  List<Funcionario> listarTodos();
  Funcionario? selecionarPorId(int id);
  bool inserir(Funcionario funcionario);
  bool alterar(Funcionario funcionario);
  bool excluir(Funcionario funcionario);
  void getFuncionario();
  void postFuncionario();
}