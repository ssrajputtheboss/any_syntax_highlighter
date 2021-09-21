import 'package:any_syntax_highlighter/any_syntax_highlighter.dart';
import 'package:any_syntax_highlighter/themes/any_syntax_highlighter_theme_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainApp createState() => _MainApp();
}

class _MainApp extends State<MainApp> {
  String _text = '';
  @override
  Widget build(BuildContext context) {
    final isMobile = defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
    return Scaffold(
        body: isMobile
            ? Column(
                children: [
                  Expanded(
                      child: SingleChildScrollView(
                          child: AnySyntaxHighlighter(_text))),
                  Expanded(
                      child: TextField(
                    minLines: 1,
                    maxLines: 1000,
                    onChanged: (String v) {
                      setState(() {
                        _text = v;
                      });
                    },
                  ))
                ],
              )
            : Row(
                children: [
                  Expanded(
                      child: TextField(
                    minLines: 1,
                    maxLines: 1000,
                    onChanged: (String v) {
                      setState(() {
                        _text = v;
                      });
                    },
                  )),
                  Expanded(
                      child: SingleChildScrollView(
                          child: AnySyntaxHighlighter(
                    _text,
                    theme: AnySyntaxHighlighterThemeCollection.defaultTheme,
                  )))
                ],
              ));
  }
}
