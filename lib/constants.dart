import 'package:flutter/material.dart';

class Constants {
  //Ele pode ser utilizado em várias ocasiões, por exemplo quando se quer definir um conjunto de cores padrão para o app ou quando se quer
  //definir as Strings de titulo do app

  MaterialColor _corAppBar = Colors.lightBlue;
  Color _corButton = Colors.greenAccent;
  Color _corText = Colors.lightGreen;

  final String title = "produtos";

  Color get getCorAppBar => _corAppBar;

  set setCorAppBar(MaterialColor cor) {
    _corAppBar = cor;
  }

  set corButton(Color cor) {
    _corButton = cor;
  }

  set corText(Color cor) {
    _corText = cor;
  }

}
