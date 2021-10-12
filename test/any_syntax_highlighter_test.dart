import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:any_syntax_highlighter/any_syntax_highlighter.dart';

void main() {
  const myApp = MaterialApp(
    home: Scaffold(
      body: AnySyntaxHighlighter('''for i in range:
  print(i)'''),
    ),
  );
  testWidgets('testing a python code ui', (tester) async {
    await tester.pumpWidget(myApp);
    expect(find.byType(AnySyntaxHighlighter), findsOneWidget); //err
    //expect(find.widgetWithText(TextSpan, 'for'), findsOneWidget);
  });
}
