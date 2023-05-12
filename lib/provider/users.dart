/*import 'dart:math';

import 'package:flutter/material.dart';
import 'package:primeiro_projeto_flutter/data/dummy_users.dart';
import 'package:primeiro_projeto_flutter/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, Users> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }
    
    
    //adiciona
    final id = Random().nextDouble().toString();
    _items.putIfAbsent(
        id,
        () => User(
            id: id,
            nome: user.nome,
            email: user.email,
            avatarURL: user.avatarURL));

    
    //ou altera

    notifyListeners();
  }
}*/
