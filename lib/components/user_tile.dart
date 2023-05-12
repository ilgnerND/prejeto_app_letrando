import 'package:flutter/material.dart';

import '../models/user.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarURL == null || user.avatarURL.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarURL));
    return ListTile(
      leading: avatar,
      title: Text(user.nome),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit),
            color: Colors.lightBlue[200],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete),
            color: Colors.red,
          )
        ]),
      ),
    );
  }
}
