class Agendamento {
  int idAgendamento; 
  int idCliente;
  int idCarro;
  int idFuncionario;
  DateTime dataHora;

  Agendamento({
    required this.idAgendamento,
    required this.idCliente,
    required this.idCarro,
    required this.idFuncionario,
    required this.dataHora
  });
}