import 'package:flutter/material.dart';

void main() {
  //Quando não fazemos com widget statefull, não funciona o hot reload
  runApp(MaterialApp(
      //não preciso colocar new
      title: "Contador de Pessoas",
      home: Home()));
}

class Home extends StatefulWidget { //widget stateful, assim conseguimos usar o hotreload e o app passa a ter estado e variáveis também
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _infoText = "Pode Entrar!";

  void _changePeople(int delta) { //_ faz a função ser privada
    setState(() {
      _people+= delta; //refaz a tela com o set state atualizando o valor da variável. O interessante disso é que não refaz a tela inteira, somente o que foi alterado

      if(_people < 0) {
        _infoText = "Mundo invertido?!";
      } else if(_people <= 10) {
        _infoText = "Pode Entrar!";
      } else {
        _infoText = "Lotado!";
      }
    });

  }

  @override
  Widget build(BuildContext context) { //refazemos a tela através da função build
    return Stack(
      children: [
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //mesmo conceito do Flex Layout
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                        onPressed: () => {
                          _changePeople(1)
                        },
                        child: Text("+1",
                            style: TextStyle(
                                fontSize: 40, color: Colors.white)))),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                        onPressed: () => {
                          _changePeople(-1)
                        },
                        child: Text("-1",
                            style: TextStyle(
                                fontSize: 40, color: Colors.white)))),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}

