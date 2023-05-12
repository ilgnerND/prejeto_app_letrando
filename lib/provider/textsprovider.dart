import 'package:flutter/material.dart';



import '../models/textosModel.dart';
import '../reposirory/textorepository.dart';

class TextsProvider with ChangeNotifier {
  List<TextosModel> _texts = [];
  final TextoRepository _textRepository = TextoRepository();

  List<TextosModel> get texts => _texts;

  Future<void> addText(TextosModel text) async {
    await _textRepository.insertTexto(text);
    TextosModel newText = TextosModel(
        id: text.id,
        img: text.img,
        titulo: text.titulo,
        autor: text.autor,
        genero: text.genero,
        dataPublicacao: text.dataPublicacao,
        tipoMidia: text.tipoMidia,
        statusLeitura: text.statusLeitura);
    _texts.add(newText);
    notifyListeners();
  }

  Future<void> updateText(TextosModel text) async {
    await _textRepository.updateTexto(text);
    int index = _texts.indexWhere((t) => t.id == text.id);
    _texts[index] = text;
    notifyListeners();
  }

  Future<void> deleteText(int id) async {
    await _textRepository.deleteTexto(id);
    _texts.removeWhere((t) => t.id == id);
    notifyListeners();
  }

  Future<void> loadTexts() async {
    final db = await _textRepository.database;
    List<TextosModel> texts = (await _textRepository.getTextos())
        .map((e) => TextosModel.fromMap(e as Map<String, dynamic>))
        .toList();
    _texts = texts;
    notifyListeners();
  }
}
/*
  Future<void> loadTexts() async {
    List<TextosModel> texts = await _textRepository.getTextos();
    _texts = texts;
    notifyListeners();
  }

  Future<void> loadTexts() async {
    await _textRepository.database; // aguarda a inicialização do banco de dados

    List<TextosModel> texts = await _textRepository.getTextos();
    _texts = texts;
    notifyListeners();
  }
  Future<void> loadTexts() async {
  await _textRepository.database().then((db) async {
    List<TextosModel> texts = await _textRepository.getTextos();
    _texts = texts;
    notifyListeners();
  });*/


