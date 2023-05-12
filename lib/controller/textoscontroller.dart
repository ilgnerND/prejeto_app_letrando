import 'package:flutter/material.dart';
import '../models/textosModel.dart';
import '../reposirory/textorepository.dart';
//import 'package:primeiro_projeto_flutter/repository/texto_repository.dart';

class TextosController extends ChangeNotifier {
  final TextoRepository _textoRepository;
  final _formKey = GlobalKey<FormState>();

  TextosController(this._textoRepository);

  List<TextosModel> _textos = [];

  List<TextosModel> get textos => [..._textos];

  Future<void> getTextos() async {
    final textosData = await _textoRepository.getTextos();
    _textos = textosData;
    notifyListeners();
  }

  Future<void> adicionarTexto(TextosModel novoTexto) async {
    await _textoRepository.insertTexto(novoTexto);
    await getTextos();
  }

  Future<void> atualizarTexto(TextosModel texto) async {
    await _textoRepository.updateTexto(texto);
    await getTextos();
  }

  Future<void> removerTexto(int id) async {
    await _textoRepository.deleteTexto(id);
    await getTextos();
  }
}
/*
  Future<void> getTextos() async {
    final textosData = await _textRepository.getTextos();
    _textos = textosData
        .map((e) => TextosModel.fromMap(e as Map<String, dynamic>))
        .toList();
    notifyListeners();
  }
*/
  /* Future<void> _saveText() async {
  if (_formKey.currentState.validate()) {
    final newText = TextosModel(
      img: _imgUrlController.text,
      titulo: _titleController.text,
      autor: _authorController.text,
      genero: _genreController.text,
      dataPublicacao: _publicationDateController.text.isEmpty
          ? null
          : DateTime.parse(_publicationDateController.text),
      tipoMidia: _mediaTypeController.text,
      statusLeitura: _readingStatusController.text,
    );

    await context.read<TextosProvider>().addText(newText);
    Navigator.pop(context);
  }
}*/

