/*
this file contains the actual theme class for any syntax highlighter with more types of tokens
 */

import 'package:any_syntax_highlighter/themes/any_syntax_highlighter_base_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnySyntaxHighlighterTheme extends AnySyntaxHighlighterBaseTheme{
  final TextStyle classStyle;
  final TextStyle staticStyle;
  final TextStyle method;
  final TextStyle private;
  final TextStyle constructor;
  final TextStyle multilineComment;
  const AnySyntaxHighlighterTheme({
    this.classStyle = const TextStyle(
      color: Colors.cyanAccent ,
    ),
    this.staticStyle = const TextStyle(
      color: Colors.pinkAccent ,
    ),
    this.constructor = const TextStyle(
      color: Colors.orangeAccent ,
    ),
    this.multilineComment = const TextStyle(
      color: Colors.red ,
      fontStyle: FontStyle.italic,
    ),
    this.method = const TextStyle(
      color: Colors.lightBlueAccent,
    ),
    this.private = const TextStyle(
      color: Colors.grey,
    ),
    final TextStyle comment = const TextStyle(
      color: Colors.red ,
      fontStyle: FontStyle.italic,
    ),
    final TextStyle keyword = const TextStyle(
        color: Colors.blueAccent ,
        fontWeight: FontWeight.bold
    ),
    final TextStyle identifier = const TextStyle(
      color: Colors.white ,
    ),
    final TextStyle function = const TextStyle(
      color: Colors.greenAccent ,
    ),
    final TextStyle number = const TextStyle(
      color: Colors.yellowAccent ,
    ),
    final TextStyle string = const TextStyle(
        color: Colors.lightGreen ,
    ),
    final TextStyle operator = const TextStyle(
        color: Colors.deepOrange ,
    ),
    final TextStyle separator = const TextStyle(
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