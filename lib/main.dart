import 'package:flutter/material.dart';

//import 'package:primeiro_projeto_flutter/provider/users.dart';

import 'package:provider/provider.dart';

import 'provider/textsprovider.dart';
import 'views/inicialViewr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => TextsProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: InicialViewr(),
      ),
    );
  }
}
