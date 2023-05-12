import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/textosModel.dart';
import '../provider/textsprovider.dart';

class AddTextsViewr extends StatefulWidget {
  const AddTextsViewr({Key? key}) : super(key: key);

  @override
  _AddTextsViewrState createState() => _AddTextsViewrState();
}

class _AddTextsViewrState extends State<AddTextsViewr> {
  final _formKey = GlobalKey<FormState>();
  late String _img;
  late String _title;
  late String _author;
  late String _genre;
  late DateTime _publicationDate = DateTime.now();
  late String _mediaType;
  late String _readingStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Texto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Imagem'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma imagem válida.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _img = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Título'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um título válido.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Autor'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um autor válido.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _author = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Gênero'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um gênero válido.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _genre = value!;
                },
              ),
              SizedBox(height: 16.0),
              Text('Data de publicação: ${_publicationDate.toString()}'),
              ElevatedButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  ).then((value) {
                    if (value != null) {
                      setState(() {
                        _publicationDate = value;
                      });
                    }
                  });
                },
                child: Text('Selecionar data'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Tipo de mídia'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um tipo de mídia válido.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _mediaType = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Situação da leitura'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma situação de leitura válida.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _readingStatus = value!;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newText = TextosModel(
                      img: _img,
                      titulo: _title,
                      autor: _author,
                      genero: _genre,
                      dataPublicacao: _publicationDate,
                      tipoMidia: _mediaType,
                      statusLeitura: _readingStatus,
                    );
                    Provider.of<TextsProvider>(context, listen: false)
                        .addText(newText)
                        .then((_) {
                      Navigator.pop(context);
                    });
                  }
                },
                child: Text('Adicionar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
