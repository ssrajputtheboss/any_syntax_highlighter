/*
this file contains the actual theme class for any syntax highlighter with more types of tokens
 */

import 'dart:ui';
import 'package:any_syntax_highlighter/themes/any_syntax_highlighter_base_theme.dart';
import 'package:flutter/material.dart';

/// Actual theme class with modern oops language tokens
/// contains all the tokens available in the base theme
class AnySyntaxHighlighterTheme extends AnySyntaxHighlighterBaseTheme {
  /// text styling for class style token
  final TextStyle classStyle;

  /// text styling for static identifier token
  /// for both static data member and method
  final TextStyle staticStyle;

  /// text styling for method token ( functions followed by a . operator)
  final TextStyle method;

  /// text styling for private token
  final TextStyle private;

  /// text styling for constructor token
  final TextStyle constructor;

  /// text styling for multiline comment token
  final TextStyle multilineComment;

  /// letter spacing and word spacing in final widget
  /// word spacing might not work as expected
  final double? letterSpacing, wordSpacing;

  /// font family
  final String? fontFamily;

  /// font features like slashed zero etc.
  final List<FontFeature> fontFeatures;

  /// text styling for line numbers
  final TextStyle lineNumber; // testing

  const AnySyntaxHighlighterTheme(
      {this.classStyle = const TextStyle(
        color: Colors.cyanAccent,
      ),
      this.staticStyle = const TextStyle(
        color: Colors.pinkAccent,
      ),
      this.constructor = const TextStyle(
        color: Colors.orangeAccent,
      ),
      this.multilineComment = const TextStyle(
        color: Colors.red,
        fontStyle: FontStyle.italic,
      ),
      this.method = const TextStyle(
        color: Colors.lightBlueAccent,
      ),
      this.private = const TextStyle(
        color: Colors.grey,
      ),
      final TextStyle comment = const TextStyle(
        color: Colors.red,
        fontStyle: FontStyle.italic,
      ),
      final TextStyle keyword = const TextStyle(
          color: Colors.blueAccent, fontWeight: FontWeight.bold),
      final TextStyle identifier = const TextStyle(
        color: Colors.white,
      ),
      final TextStyle function = const TextStyle(
        color: Colors.greenAccent,
      ),
      final TextStyle number = const TextStyle(
        color: Colors.yellowAccent,
      ),
      final TextStyle string = const TextStyle(
        color: Colors.lightGreen,
      ),
      final TextStyle operator = const TextStyle(
        color: Colors.deepOrange,
      ),
      final TextStyle separator = const TextStyle(
        color: Colors.white,
      ),
      final BoxDecoration boxDecoration =
          const BoxDecoration(color: Colors.black87),
      this.letterSpacing = 1,
      this.wordSpacing,
      this.fontFamily,
      this.fontFeatures = const [],
      this.lineNumber = const TextStyle(
          color: Colors.white, fontFeatures: [FontFeature.tabularFigures()])})
      : super(
            comment: comment,
            keyword: keyword,
            identifier: identifier,
            function: function,
            number: number,
            string: string,
            operator: operator,
            separator: separator,
            boxDecoration: boxDecoration);
}
