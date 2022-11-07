class Contato {
  final String? id;
  final String nome;
  final String numero;
  final String? urlDoAvatar;

  Contato(
      {required this.id,
      required this.nome,
      required this.numero,
      this.urlDoAvatar});
}
