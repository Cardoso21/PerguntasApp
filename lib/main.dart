import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual seu desenho favorito ?',
      'respostas': [
        {'texto': 'Dragon ball', 'nota': 10},
        {'texto': 'Naruto', 'nota': 5},
        {'texto': 'X-Man', 'nota': 3},
        {'texto': 'Pokemon', 'nota': 1},
      ]
    },
    {
      'texto': 'Qual seu esporte favorito ?',
      'respostas': [
        {'texto': 'Futebol', 'nota': 10},
        {'texto': 'Basquete', 'nota': 5},
        {'texto': 'Volei', 'nota': 3},
        {'texto': 'Handebol', 'nota': 1},
      ]
    },
    {
      'texto': 'Qual sua brincadeira favorita ?',
      'respostas': [
        {'texto': 'Pique-esconde', 'nota': 10},
        {'texto': 'policia e ladrão', 'nota': 5},
        {'texto': 'Bete', 'nota': 3},
        {'texto': 'garrafão', 'nota': 1},
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
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: temPerguntaSelecionada
              ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              quandoResponder: _responder)
              : Resultado(_pontuacaoTotal, _reiniciarQuest),
        ),
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
