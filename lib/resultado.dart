import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int nota;
  final void Function() reiniciarQuest;

  Resultado(this.nota, this.reiniciarQuest);

  String get fraseResultado {
    if (nota < 8) {
      return 'Parabéns!';
    } else if (nota < 12) {
      return 'Você é bom!';
    } else if (nota < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Center(
          child: Text(
            'Sua nota é $nota.',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white60,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          onPressed: reiniciarQuest,
          child: Text('reiniciar',style: TextStyle(
            color: Colors.white30
          ),),
        )
      ],
    );
  }
}
