import 'package:concessionaria/models/agendamento.dart';

abstract class AgendamentoeDao {
  List<Agendamento> listarTodos();
  Agendamento? selecionarPorId(int id);
  bool inserir(Agendamento agendamento);
  bool alterar(Agendamento agendamento);
  bool excluir(Agendamento agendamento);
  void getAgendamento();
  void postAgendamento();
}