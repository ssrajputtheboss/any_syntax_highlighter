/*
collection of default themes
 */

import 'dart:ui';
import 'package:any_syntax_highlighter/themes/any_syntax_highlighter_theme.dart';
import 'package:flutter/material.dart';

/// default themes provided by this package
class AnySyntaxHighlighterThemeCollection {
  /// default theme used by AnySyntaxHighlighter widget
  static const defaultTheme = AnySyntaxHighlighterTheme();

  /// theme like github web
  static githubWebTheme() => const AnySyntaxHighlighterTheme(
      classStyle: TextStyle(
        color: Color.fromRGBO(113, 176, 251, 1),
      ),
      staticStyle: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 0),
      ),
      constructor: TextStyle(
        color: Color.fromRGBO(113, 176, 251, 1),
      ),
      multilineComment: TextStyle(
        color: Color.fromRGBO(187, 174, 170, 1),
      ),
      comment: TextStyle(
        color: Color.fromRGBO(187, 174, 170, 1),
      ),
      keyword: TextStyle(
        color: Color.fromRGBO(251, 114, 116, 0.807843137254902),
        fontWeight: FontWeight.bold,
      ),
      identifier: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      function: TextStyle(
        color: Color.fromRGBO(200, 132, 251, 1),
      ),
      number: TextStyle(
        color: Color.fromRGBO(113, 176, 251, 1),
      ),
      string: TextStyle(
        color: Color.fromRGBO(113, 176, 251, 1),
      ),
      operator: TextStyle(
        color: Color.fromRGBO(251, 114, 116, 0.807843137254902),
        fontWeight: FontWeight.bold,
      ),
      separator: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      method: TextStyle(
        color: Color.fromRGBO(200, 132, 251, 1),
      ),
      private: TextStyle(
        color: Color.fromRGBO(255, 255, 255, 0),
      ),
      boxDecoration: BoxDecoration(color: Color.fromRGBO(30, 28, 28, 1)),
      fontFeatures: [FontFeature.slashedZero()]);

  /// light theme
  static defaultLightTheme() => const AnySyntaxHighlighterTheme(
      classStyle: TextStyle(
        color: Color.fromRGBO(1, 86, 86, 1),
      ),
      staticStyle: TextStyle(
        color: Color.fromRGBO(168, 1, 57, 1),
        fontStyle: FontStyle.italic,
      ),
      constructor: TextStyle(
        color: Color.fromRGBO(129, 72, 0, 1),
      ),
      multilineComment: TextStyle(
        color: Color.fromRGBO(117, 103, 103, 1),
        fontStyle: FontStyle.italic,
      ),
      comment: TextStyle(
        color: Color.fromRGBO(117, 103, 103, 1),
        fontStyle: FontStyle.italic,
      ),
      keyword: TextStyle(
        color: Color.fromRGBO(4, 51, 129, 1),
        fontWeight: FontWeight.bold,
      ),
      identifier: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
      ),
      function: TextStyle(
        color: Color.fromRGBO(1, 121, 62, 1),
      ),
      number: TextStyle(
        color: Color.fromRGBO(69, 69, 1, 1),
      ),
      string: TextStyle(
        color: Color.fromRGBO(11, 63, 1, 1),
      ),
      operator: TextStyle(
        color: Color.fromRGBO(153, 4, 21, 1),
      ),
      separator: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
      ),
      method: TextStyle(
        color: Color.fromRGBO(77, 2, 140, 1),
      ),
      private: TextStyle(
        color: Color.fromRGBO(77, 57, 57, 1),
      ),
      lineNumber: TextStyle(color: Colors.white),
      boxDecoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0)),
      fontFeatures: [FontFeature.slashedZero()]);

  /// freeLine theme
  static AnySyntaxHighlighterTheme freeLineTheme() {
    const black = TextStyle(
      color: Colors.black,
    );
    const blackNBold =
        TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
    const comment = TextStyle(
      color: Color.fromRGBO(128, 119, 118, 1),
      fontStyle: FontStyle.italic,
    );
    return const AnySyntaxHighlighterTheme(
        classStyle: black,
        staticStyle: black,
        constructor: black,
        multilineComment: comment,
        comment: comment,
        keyword: blackNBold,
        identifier: black,
        function: black,
        number: TextStyle(
          color: Color.fromRGBO(99, 196, 178, 1),
        ),
        string: TextStyle(
          color: Color.fromRGBO(194, 34, 36, 1),
        ),
        operator: black,
        separator: black,
        method: black,
        private: black,
        lineNumber: TextStyle(color: Colors.black),
        boxDecoration: BoxDecoration(color: Color.fromRGBO(239, 245, 244, 1)),
        fontFeatures: [FontFeature.slashedZero()]);
  }
}
