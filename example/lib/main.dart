import 'dart:ui';

import 'package:any_syntax_highlighter/any_syntax_highlighter.dart';
import 'package:any_syntax_highlighter/themes/any_syntax_highlighter_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

const fontStyles = <String, FontStyle>{
  'normal': FontStyle.normal,
  'italic': FontStyle.italic
};
const fontWeights = <String, FontWeight>{
  'bold': FontWeight.bold,
  'normal': FontWeight.normal,
  'w100': FontWeight.w100,
  'w200': FontWeight.w200,
  'w300': FontWeight.w300,
  'w400': FontWeight.w400,
  'w500': FontWeight.w500,
  'w600': FontWeight.w600,
  'w700': FontWeight.w700,
  'w800': FontWeight.w800,
  'w900': FontWeight.w900
};
void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
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
  late Map<String, Props> _theme;
  late Color _bgColor;
  _MainApp() {
    initializeTheme();
  }
  List<Widget> mainWidgets() => [
        Expanded(
            child: SingleChildScrollView(
                child: AnySyntaxHighlighter(
          _text,
          fontSize: Props.fontSize,
          letterSpacing: Props.letterSpacing,
          wordSpacing: Props.wordSpacing,
          fontFamily: Props.fontFamily,
          theme: AnySyntaxHighlighterTheme(
              classStyle: TextStyle(
                  color: _theme['classStyle']?.color,
                  fontWeight: fontWeights[_theme['classStyle']?.weight]!,
                  fontStyle: fontStyles[_theme['classStyle']?.style]!
              ),
              staticStyle: TextStyle(
                  color: _theme['staticStyle']?.color,
                  fontWeight: fontWeights[_theme['staticStyle']?.weight]!,
                  fontStyle: fontStyles[_theme['staticStyle']?.style]!,
              ),
              constructor: TextStyle(
                  color: _theme['constructor']?.color,
                  fontWeight: fontWeights[_theme['constructor']?.weight]!,
                  fontStyle: fontStyles[_theme['constructor']?.style]!,
              ),
              multilineComment: TextStyle(
                  color: _theme['multilineComment']?.color,
                  fontWeight: fontWeights[_theme['multilineComment']?.weight]!,
                  fontStyle: fontStyles[_theme['multilineComment']?.style]!,
              ),
              comment: TextStyle(
                  color: _theme['comment']?.color,
                  fontWeight: fontWeights[_theme['comment']?.weight]!,
                  fontStyle: fontStyles[_theme['comment']?.style]!,
              ),
              keyword: TextStyle(
                  color: _theme['keyword']?.color,
                  fontWeight: fontWeights[_theme['keyword']?.weight]!,
                  fontStyle: fontStyles[_theme['keyword']?.style]!,
              ),
              identifier: TextStyle(
                  color: _theme['identifier']?.color,
                  fontWeight: fontWeights[_theme['identifier']?.weight]!,
                  fontStyle: fontStyles[_theme['identifier']?.style]!,
              ),
              function: TextStyle(
                  color: _theme['function']?.color,
                  fontWeight: fontWeights[_theme['function']?.weight]!,
                  fontStyle: fontStyles[_theme['function']?.style]!,
              ),
              number: TextStyle(
                  color: _theme['number']?.color,
                  fontWeight: fontWeights[_theme['number']?.weight]!,
                  fontStyle: fontStyles[_theme['number']?.style]!,
              ),
              string: TextStyle(
                  color: _theme['string']?.color,
                  fontWeight: fontWeights[_theme['string']?.weight]!,
                  fontStyle: fontStyles[_theme['string']?.style]!,
              ),
              operator: TextStyle(
                  color: _theme['operator']?.color,
                  fontWeight: fontWeights[_theme['operator']?.weight]!,
                  fontStyle: fontStyles[_theme['operator']?.style]!,
              ),
              separator: TextStyle(
                  color: _theme['separator']?.color,
                  fontWeight: fontWeights[_theme['separator']?.weight]!,
                  fontStyle: fontStyles[_theme['separator']?.style]!,
              ),
              method: TextStyle(
                color: _theme['method']?.color,
                fontWeight: fontWeights[_theme['method']?.weight]!,
                fontStyle: fontStyles[_theme['method']?.style]!,
              ),
              private: TextStyle(
                color: _theme['private']?.color,
                fontWeight: fontWeights[_theme['private']?.weight]!,
                fontStyle: fontStyles[_theme['private']?.style]!,
              ),
              boxDecoration: BoxDecoration(color: _bgColor)),
        ))),
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
      ];
  @override
  Widget build(BuildContext context) {
    final isMobile = defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnySyntaxHighlighterLab'),
        actions: [
          Tooltip(
            message: 'Generate Code For This Theme',
            child: IconButton(
                onPressed: () => showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        actions: [
                          IconButton(
                              onPressed: ()=>Navigator.canPop(context)?Navigator.pop(context):{},
                              icon: const Icon(Icons.close)
                          )
                        ],
                        content:
                            AnySyntaxHighlighter(generateThemeCode(_theme, _bgColor),isSelectableText: true),
                      );
                    }),
                icon: const Icon(Icons.code,color: Colors.yellowAccent,)),
          )
        ],
      ),
      body: isMobile
          ? Column(children: mainWidgets())
          : Row(children: mainWidgets()),
      drawer: Drawer(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(
        controller: ScrollController(),
        children: _theme.entries
              .map((e) => Wrap(
                    children: [
                      Text(e.key),
                      TextButton(
                        child: Text('color',
                            style: TextStyle(
                                backgroundColor: e.value.color,
                                letterSpacing: 2
                            )
                        ),
                        onPressed: () => showDialog(
                            context: context,
                            builder: (ctx) {
                              return AlertDialog(
                                title: const Text('Pick A Color'),
                                actions: [
                                  IconButton(
                                      onPressed: ()=>Navigator.canPop(context)?Navigator.pop(context):{},
                                      icon: const Icon(Icons.close)
                                  )
                                ],
                                content: SingleChildScrollView(
                                  child: ColorPicker(
                                      pickerColor: e.value.color,
                                      onColorChanged: (newColor) {
                                        setState(() {
                                          e.value.color = newColor;
                                        });
                                      }),
                                ),
                              );
                            }),
                      ),
                      DropdownButton<String>(
                        value: e.value.style,
                        items: fontStyles.keys
                            .map<DropdownMenuItem<String>>(
                                (k) => DropdownMenuItem(value: k, child: Text(k)))
                            .toList(),
                        onChanged: (newStyle) {
                          setState(() {
                            e.value.style = newStyle!;
                          });
                        },
                      ),
                      DropdownButton<String>(
                        value: e.value.weight,
                        items: fontWeights.keys
                            .map<DropdownMenuItem<String>>(
                                (k) => DropdownMenuItem(value: k, child: Text(k)))
                            .toList(),
                        onChanged: (newWeight) {
                          setState(() {
                            e.value.weight = newWeight!;
                          });
                        },
                      )
                    ],
                  ))
              .toList()
            ..add(Wrap(
              children: [
                const Text('background color'),
                TextButton(
                  child: Text('change..',
                      style: TextStyle(backgroundColor: _bgColor)),
                  onPressed: () => showDialog(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          title: const Text('Pick A Color'),
                          actions: [
                            IconButton(
                                onPressed: ()=>Navigator.canPop(context)?Navigator.pop(context):{},
                                icon: const Icon(Icons.close)
                            )
                          ],
                          content: SingleChildScrollView(
                              child: ColorPicker(
                                  pickerColor: _bgColor,
                                  onColorChanged: (c) {
                                    setState(() => _bgColor = c);
                                  })),
                        );
                      }),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'LetterSpacing'),
                  maxLines: 1,
                  minLines: 1,
                  onSubmitted: (value) {
                    double? val;
                    try {
                      val = double.parse(value);
                    } catch (err) {
                      val = null;
                    }
                    setState(() {
                      Props.letterSpacing = val;
                    });
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'FontSize'),
                  maxLines: 1,
                  minLines: 1,
                  onSubmitted: (value) {
                    double? val;
                    try {
                      val = double.parse(value);
                    } catch (err) {
                      val = null;
                    }
                    setState(() {
                      Props.fontSize = val;
                    });
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'WordSpacing',
                  ),
                  maxLines: 1,
                  minLines: 1,
                  onSubmitted: (value) {
                    double? val;
                    try {
                      val = double.parse(value);
                    } catch (err) {
                      val = null;
                    }
                    setState(() {
                      Props.wordSpacing = val;
                    });
                  },
                ),
                TextField(
                  decoration: const InputDecoration(hintText: 'FontFamily'),
                  maxLines: 1,
                  minLines: 1,
                  onSubmitted: (value) {
                    setState(() {
                      Props.fontFamily = value;
                    });
                  },
                )
              ],
            )),
      ),
          )),
    );
  }

  void initializeTheme() {
    _bgColor = Colors.black;
    _theme = {
      'classStyle': Props(Colors.cyanAccent, 'normal', 'normal'),
      'staticStyle': Props(Colors.pinkAccent, 'normal', 'italic'),
      'constructor': Props(Colors.orangeAccent, 'normal', 'normal'),
      'multilineComment': Props(Colors.red, 'normal', 'italic'),
      'comment': Props(Colors.red, 'normal', 'italic'),
      'keyword': Props(Colors.blueAccent, 'bold', 'normal'),
      'identifier': Props(Colors.white, 'normal', 'normal'),
      'function': Props(Colors.greenAccent, 'normal', 'normal'),
      'number': Props(Colors.yellowAccent, 'normal', 'normal'),
      'string': Props(Colors.lightGreen, 'normal', 'normal'),
      'operator': Props(Colors.deepOrange, 'normal', 'normal'),
      'separator': Props(Colors.white, 'normal', 'normal'),
      'method': Props(Colors.lightBlueAccent,'normal','normal'),
      'private': Props(Colors.grey,'normal','normal')
    };
  }
}

class Props {
  Color color;
  String weight, style;
  static String? fontFamily;
  static double? letterSpacing, wordSpacing, fontSize;
  Props(this.color, this.weight, this.style);
}

String generateThemeCode(Map<String, Props> theme, Color bgColor) {
  StringBuffer s = StringBuffer('AnySyntaxHighlighterTheme(\n    ');
  theme.forEach((key, value) {
    s.write('''$key : TextStyle(
      color: Color.fromRGBO(${value.color.red}, ${value.color.green}, ${value.color.blue}, ${value.color.opacity}),
      fontWeight: FontWeight.${value.weight},
      fontStyle: FontStyle.${value.style},
    ),
    ''');
  });
  s.write('''boxDecoration: BoxDecoration( 
      color: Color.fromRGBO(${bgColor.red}, ${bgColor.green}, ${bgColor.blue}, ${bgColor.opacity})
    )
)''');
  return s.toString();
}
