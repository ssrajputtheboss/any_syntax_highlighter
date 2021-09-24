/*
collection of default themes
 */


import 'package:any_syntax_highlighter/themes/any_syntax_highlighter_theme.dart';
import 'package:flutter/cupertino.dart';

class AnySyntaxHighlighterThemeCollection {
  static const defaultTheme = AnySyntaxHighlighterTheme();
  static const githubWebTheme = AnySyntaxHighlighterTheme(
      classStyle : TextStyle(
        color: Color.fromRGBO(113, 176, 251, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      staticStyle : TextStyle(
        color: Color.fromRGBO(255, 255, 255, 0),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.italic,
      ),
      constructor : TextStyle(
        color: Color.fromRGBO(113, 176, 251, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      multilineComment : TextStyle(
        color: Color.fromRGBO(187, 174, 170, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      comment : TextStyle(
        color: Color.fromRGBO(187, 174, 170, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      keyword : TextStyle(
        color: Color.fromRGBO(251, 114, 116, 0.807843137254902),
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
      ),
      identifier : TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      function : TextStyle(
        color: Color.fromRGBO(200, 132, 251, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      number : TextStyle(
        color: Color.fromRGBO(113, 176, 251, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      string : TextStyle(
        color: Color.fromRGBO(113, 176, 251, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      operator : TextStyle(
        color: Color.fromRGBO(251, 114, 116, 0.807843137254902),
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
      ),
      separator : TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      method : TextStyle(
        color: Color.fromRGBO(200, 132, 251, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      private : TextStyle(
        color: Color.fromRGBO(255, 255, 255, 0),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      boxDecoration: BoxDecoration(
          color: Color.fromRGBO(30, 28, 28, 1)
      )
  );

}