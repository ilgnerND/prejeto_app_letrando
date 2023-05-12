class TextosModel {
  int? id;
  final String img;
  final String titulo;
  final String autor;
  final String genero;
  final DateTime dataPublicacao;
  final String tipoMidia;
  final String statusLeitura;

  TextosModel(
      {this.id,
      required this.img,
      required this.titulo,
      required this.autor,
      required this.genero,
      required this.dataPublicacao,
      required this.tipoMidia,
      required this.statusLeitura});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'img': img,
      'titulo': titulo,
      'autor': autor,
      'genero': genero,
      'dataPublicacao': dataPublicacao,
      'tipoMidia': tipoMidia,
      'statusLeitura': statusLeitura
    };
  }

  static TextosModel fromMap(Map<String, dynamic> map) {
    return TextosModel(
      id: map['id'] as int,
      img: map['img'] as String,
      titulo: map['titulo'] as String,
      autor: map['autor'] as String,
      genero: map['genero'] as String,
      dataPublicacao: DateTime.parse(map['dataPublicacao'] as String),
      tipoMidia: map['tipoMidia'] as String,
      statusLeitura: map['statusLeitura'] as String,
    );
  }
}
