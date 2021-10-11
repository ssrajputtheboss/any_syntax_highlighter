/*
collection of default themes
 */

import 'dart:ui';
import 'package:any_syntax_highlighter/themes/any_syntax_highlighter_theme.dart';
import 'package:flutter/cupertino.dart';

class AnySyntaxHighlighterThemeCollection {
  static const defaultTheme = AnySyntaxHighlighterTheme();

  static const githubWebTheme = AnySyntaxHighlighterTheme(
      classStyle: TextStyle(
        color: Color.fromRGBO(113, 176, 251, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      staticStyle: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 0),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.italic,
      ),
      constructor: TextStyle(
        color: Color.fromRGBO(113, 176, 251, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      multilineComment: TextStyle(
        color: Color.fromRGBO(187, 174, 170, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      comment: TextStyle(
        color: Color.fromRGBO(187, 174, 170, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      keyword: TextStyle(
        color: Color.fromRGBO(251, 114, 116, 0.807843137254902),
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
      ),
      identifier: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      function: TextStyle(
        color: Color.fromRGBO(200, 132, 251, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      number: TextStyle(
        color: Color.fromRGBO(113, 176, 251, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      string: TextStyle(
        color: Color.fromRGBO(113, 176, 251, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      operator: TextStyle(
        color: Color.fromRGBO(251, 114, 116, 0.807843137254902),
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
      ),
      separator: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      method: TextStyle(
        color: Color.fromRGBO(200, 132, 251, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      private: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 0),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      boxDecoration: BoxDecoration(color: Color.fromRGBO(30, 28, 28, 1)),
      fontFeatures: [FontFeature.slashedZero()]);

  static const defaultLightTheme = AnySyntaxHighlighterTheme(
      classStyle: TextStyle(
        color: Color.fromRGBO(1, 86, 86, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      staticStyle: TextStyle(
        color: Color.fromRGBO(168, 1, 57, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.italic,
      ),
      constructor: TextStyle(
        color: Color.fromRGBO(129, 72, 0, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      multilineComment: TextStyle(
        color: Color.fromRGBO(117, 103, 103, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.italic,
      ),
      comment: TextStyle(
        color: Color.fromRGBO(117, 103, 103, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.italic,
      ),
      keyword: TextStyle(
        color: Color.fromRGBO(4, 51, 129, 1),
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
      ),
      identifier: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      function: TextStyle(
        color: Color.fromRGBO(1, 121, 62, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      number: TextStyle(
        color: Color.fromRGBO(69, 69, 1, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      string: TextStyle(
        color: Color.fromRGBO(11, 63, 1, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      operator: TextStyle(
        color: Color.fromRGBO(153, 4, 21, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      separator: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      method: TextStyle(
        color: Color.fromRGBO(77, 2, 140, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      private: TextStyle(
        color: Color.fromRGBO(77, 57, 57, 1),
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
      boxDecoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0)),
      fontFeatures: [FontFeature.slashedZero()]);
}
