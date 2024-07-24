import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onClick;

  Resposta(this.texto, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(140, 7, 127, 226),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          elevation: 5.0, // Altura da sombra
          shadowColor: const Color.fromARGB(255, 7, 193, 226)
        ),
        onPressed: onClick,
        child: Text(
          texto,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
