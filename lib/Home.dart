import 'package:app_bar/telas/DownloadBle.dart';
import 'package:app_bar/telas/Exibicao.dart';
import 'package:app_bar/telas/UploadHttp.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indice = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      DownloadBle(),
      UploadHttp(),
      Exibicao()
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Projeto integrado 3"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[this._indice],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._indice,
        onTap: (indice){
          setState(() {
            this._indice = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.white,
        backgroundColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            title: Text("Coletar"),
            icon: Icon(Icons.arrow_downward),
          ),
          BottomNavigationBarItem(
            title: Text("Enviar"),
            icon: Icon(Icons.arrow_upward)
          ),
          BottomNavigationBarItem(
            title: Text("Exibir"),
            icon: Icon(Icons.show_chart)
          )
        ],
      ),
    );
  }
}
