import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual seu Orixar favorito ?',
      'respostas': [
        {'texto': 'Oxossi', 'nota': 10},
        {'texto': 'Ogun', 'nota': 5},
        {'texto': 'Xangô', 'nota': 3},
        {'texto': 'Iansã', 'nota': 1},
      ]
    },
    {
      'texto': 'Qual seu catiço favorito ?',
      'respostas': [
        {'texto': 'Boiadeiro', 'nota': 10},
        {'texto': 'Bahiano', 'nota': 5},
        {'texto': 'Marinheiro', 'nota': 3},
        {'texto': 'Ere', 'nota': 1},
      ]
    },
    {
      'texto': 'Qual seu exu faorito ?',
      'respostas': [
        {'texto': 'Quebra Galho', 'nota': 10},
        {'texto': 'Pinga Fogo', 'nota': 5},
        {'texto': 'Exu Omulo', 'nota': 3},
        {'texto': 'Sete Montanhas', 'nota': 1},
      ]
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuest(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define a cor principal
        hintColor: Colors.amber, // Define a cor de destaque
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black,
          ), // Personaliza o texto padrão
        ),
        appBarTheme: AppBarTheme(
          color: Colors.blue, // Define a cor da AppBar
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Perguntas')),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuest),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
