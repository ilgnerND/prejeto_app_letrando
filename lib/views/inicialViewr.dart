import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';


import 'package:provider/provider.dart';

import '../provider/textsprovider.dart';
import 'addtextViewr.dart';

void exportar() {
  // código para exportar
}

void importar() {
  // código para importar
}

void sobre(BuildContext context) {
  // código para exibir informações sobre o aplicativo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Sobre'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Desenvolvido por: Ilgner Nunes'),
            Text('Versão: 0.5.0'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Fechar'),
          ),
        ],
      );
    },
  );
}

class InicialViewr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> _cards = List.generate(50, (i) => 'Card ${i + 1}');
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120.5),
          child: AppBar(
            title: Text('appLetrando'),
            titleSpacing: 0,
            leading: PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text('Exportar'),
                    value: 'exportar',
                  ),
                  PopupMenuItem(
                    child: Text('Importar'),
                    value: 'importar',
                  ),
                  PopupMenuItem(
                    child: Text('Sobre'),
                    value: 'sobre',
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 'exportar') {
                  exportar();
                } else if (value == 'importar') {
                  importar();
                } else if (value == 'sobre') {
                  sobre(context);
                }
              },
              icon: Icon(Icons.menu),
            ),
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddTextsViewr()));
                  },
                  icon: Icon(Icons.add)),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              )
            ],
            elevation: 0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 8, 48, 107),
                    Color.fromARGB(255, 33, 180, 249)
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            ),
            bottom: const TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              tabs: [
                Tab(icon: Icon(Icons.menu_book_outlined), text: 'Textos'),
                Tab(icon: Icon(Icons.favorite), text: 'Destaques'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            /*ListView.builder(
              itemCount: users.count,
              itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
            ),*/
            Column(
              children: [
                Consumer<TextsProvider>(
                  builder: (context, textsProvider, child) =>
                      textsProvider.texts.isEmpty
                          ? Center(child: Text('No texts added yet.'))
                          : ListWheelScrollView(
                              itemExtent: 200,
                              diameterRatio: 2,
                              children: textsProvider.texts
                                  .map(
                                    (text) => Card(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(text.img),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              text.titulo,
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(text.autor),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Year: ${text.dataPublicacao}',
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(text.genero),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(text.tipoMidia),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(text.statusLeitura),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                ),
                /*Expanded(
                  child: ListWheelScrollView(
                    itemExtent: 200,
                    physics: FixedExtentScrollPhysics(),
                    perspective: 0.001,
                    //diameterRatio: 6, // Altura de cada card
                    children: List.generate(
                      users.count,
                      (i) {
                        return Container(
                          color: Colors.lightBlue,
                          child: Card(
                            child: ListTile(
                              title: Text(users.byIndex(i).nome),
                              subtitle: Text(users.byIndex(i).email),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),*/
              ],
            ),
            //buildPageList('test'),
            //buildPage('home'),

            buildPageDetail('teste'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          //ListView.builder(
          //itemCount: users.count,
          ///itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
        ),
      ),
    );
  } //build Context

  Widget buildPage(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 28),
        ),
      );

  Widget buildPageDetail(String text) => DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(
              titleSpacing: 0,
              elevation: 0,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 8, 48, 107),
                      Color.fromARGB(255, 33, 180, 249)
                    ],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                ),
              ),
              bottom: const TabBar(
                indicatorColor: Colors.white,
                indicatorWeight: 2,
                //indicator: UnderlineTabIndicator(
                //borderSide: BorderSide(width: 3.0),
                //insets: EdgeInsets.symmetric(horizontal: 10.0)),
                tabs: <Widget>[
                  Tab(text: 'Textos'),
                  Tab(text: 'Anotações'),
                ],
              )),
        ),
        body: TabBarView(children: <Widget>[
          buildPage('Textos'),
          buildPage('Anotações'),
        ]),
      ));

  Widget buildPageList(String text) => Scaffold(
        body: ListWheelScrollView(
          itemExtent: 250,
          children: [],
        ),
      );
}

/*buildCard(String t) {
  ListView.builder(
    itemCount: users.count,
    itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
  );



              icon: Icon(Icons.menu),
              onPressed: () {},
  
}*/
