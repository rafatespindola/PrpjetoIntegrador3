import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:app_bar/model/Dados.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Exibicao extends StatefulWidget {
  @override
  _ExibicaoState createState() => _ExibicaoState();
}

class _ExibicaoState extends State<Exibicao> {

  String _url = "http://10.0.2.2:5000/api/v1/teste";

  Future<List<Dados>> _get() async {
    http.Response response = await http.get(_url);
    var dadosJson = json.decode(response.body);
    List<Dados> lDados = List();
    for(var aux in dadosJson){
      Dados d = Dados(aux["date"], aux["temp"], aux["uid"], aux["umidade"]);
      lDados.add( d );
    }
    return lDados;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<Dados>>(
        future: _get(),
        //ignore: missing_return
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none :
            case ConnectionState.waiting :
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active :
            case ConnectionState.done :
              List<double> _lTemp = List();
              List<double> _lUmid = List();
              for(int i=0; i<snapshot.data.length; i++){
                _lTemp.add(snapshot.data[i].temp);
                _lUmid.add(snapshot.data[i].umidade.toDouble());
              }
              return Column(
                children: <Widget>[
                  Text(
                    "Temperatura",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                  Container(
                    height: 200,
                    child: Sparkline(
                      data: _lTemp,
                      lineColor: Colors.black,
                      pointColor: Colors.blue,
                      pointsMode: PointsMode.all,
                      pointSize: 8.0,
                      fillMode: FillMode.below, //preenchimento abaixo
                      fillGradient: new LinearGradient(
                        colors: [Colors.red, Colors.blue],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Divider(
                    height: 16.0,
                    color: Colors.grey,
                    thickness: 2.0,
                  ),
                  Text(
                    "Umidade",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                  Container(
                    height: 200,
                    child: Sparkline(
                      data: _lUmid,
                      lineColor: Colors.black,
                      pointColor: Colors.blue,
                      pointsMode: PointsMode.all,
                      pointSize: 8.0,
                      fillMode: FillMode.below, //preenchimento abaixo
                      fillGradient: new LinearGradient(
                        colors: [Colors.blue, Colors.lightBlueAccent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  )
                ],
              );
          }
        },
      ),
    );
  }
}
