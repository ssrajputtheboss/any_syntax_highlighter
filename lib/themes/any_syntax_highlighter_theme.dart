/*
this file contains the actual theme class for any syntax highlighter with more types of tokens
 */

import 'package:any_syntax_highlighter/themes/any_syntax_highlighter_base_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnySyntaxHighlighterTheme extends AnySyntaxHighlighterBaseTheme{
  final TextStyle classStyle;
  final TextStyle staticStyle;
  final TextStyle constructor;
  final TextStyle multilineComment;
  const AnySyntaxHighlighterTheme({
    this.classStyle = const TextStyle(
      fontSize: defaultFontSize,
      color: Colors.cyanAccent ,
    ),
    this.staticStyle = const TextStyle(
      fontSize: defaultFontSize,
      color: Colors.pinkAccent ,
    ),
    this.constructor = const TextStyle(
      fontSize: defaultFontSize,
      color: Colors.orangeAccent ,
    ),
    this.multilineComment = const TextStyle(
      fontSize: defaultFontSize,
      color: Colors.red ,
      fontStyle: FontStyle.italic,
    ),
    final TextStyle comment = const TextStyle(
      fontSize: defaultFontSize,
      color: Colors.red ,
      fontStyle: FontStyle.italic,
    ),
    final TextStyle keyword = const TextStyle(
        fontSize: defaultFontSize,
        color: Colors.blueAccent ,
        fontWeight: FontWeight.bold
    ),
    final TextStyle identifier = const TextStyle(
      fontSize: defaultFontSize,
      color: Colors.white ,
    ),
    final TextStyle function = const TextStyle(
      fontSize: defaultFontSize,
      color: Colors.greenAccent ,
    ),
    final TextStyle number = const TextStyle(
      fontSize: defaultFontSize,
      color: Colors.yellowAccent ,
    ),
    final TextStyle string = const TextStyle(
        fontSize: defaultFontSize,
        color: Colors.lightGreen ,
    ),
    final TextStyle operator = const TextStyle(
        fontSize: defaultFontSize,
        color: Colors.deepOrange ,
    ),
    final TextStyle separator = const TextStyle(
      fontSize: defaultFontSize,
      color: Colors.white ,
    ),
    final BoxDecoration boxDecoration = const BoxDecoration(
        color: Colors.black87
    )
  }): super(
    comment: comment,
    keyword: keyword,
    identifier: identifier,
    function: function,
    number: number,
    string: string,
    operator: operator,
    separator: separator,
    boxDecoration: boxDecoration
  );
}