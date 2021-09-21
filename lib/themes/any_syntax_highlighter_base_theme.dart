/*
this file contains the basic type of tokens that all programming languages do have
 */


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

const defaultFontSize = 16.0;

class AnySyntaxHighlighterBaseTheme {
  final TextStyle comment;
  final TextStyle keyword;
  final TextStyle identifier;
  final TextStyle function;
  final TextStyle number;
  final TextStyle string;
  final TextStyle operator;
  final TextStyle separator;
  final BoxDecoration boxDecoration;
  const AnySyntaxHighlighterBaseTheme({
    this.comment = const TextStyle(
      fontSize: defaultFontSize,
      color: Colors.red ,
      fontStyle: FontStyle.italic,
    ),
    this.keyword = const TextStyle(
      fontSize: defaultFontSize,
      color: Colors.blueAccent ,
      fontWeight: FontWeight.bold
    ),
    this.identifier = const TextStyle(
        fontSize: defaultFontSize,
        color: Colors.white ,
    ),
    this.function = const TextStyle(
        fontSize: defaultFontSize,
        color: Colors.greenAccent ,
    ),
    this.number = const TextStyle(
        fontSize: defaultFontSize,
        color: Colors.yellowAccent ,
    ),
    this.string = const TextStyle(
        fontSize: defaultFontSize,
        color: Colors.lightGreen
    ),
    this.operator = const TextStyle(
        fontSize: defaultFontSize,
        color: Colors.deepOrange
    ),
    this.separator = const TextStyle(
        fontSize: defaultFontSize,
        color: Colors.white ,
    ),
    this.boxDecoration = const BoxDecoration(
      color: Colors.black87
    )
  });
}
