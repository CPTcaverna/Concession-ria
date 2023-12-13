import 'package:concessionaria/models/carro.dart';

abstract class CarroDao {
  List<Carro> listarTodos();
  Carro? selecionarPorId(int id);
  bool inserir(Carro carro);
  bool alterar(Carro carro);
  bool excluir(Carro carro);
  void getCarro();
  void postCarro();
}