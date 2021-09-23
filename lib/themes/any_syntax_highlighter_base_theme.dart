/*
this file contains the basic type of tokens that all programming languages do have
 */


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
      color: Colors.red ,
      fontStyle: FontStyle.italic,
    ),
    this.keyword = const TextStyle(
      color: Colors.blueAccent ,
      fontWeight: FontWeight.bold
    ),
    this.identifier = const TextStyle(
        color: Colors.white ,
    ),
    this.function = const TextStyle(
        color: Colors.greenAccent ,
    ),
    this.number = const TextStyle(
        color: Colors.yellowAccent ,
    ),
    this.string = const TextStyle(
        color: Colors.lightGreen
    ),
    this.operator = const TextStyle(
        color: Colors.deepOrange
    ),
    this.separator = const TextStyle(
        color: Colors.white ,
    ),
    this.boxDecoration = const BoxDecoration(
      color: Colors.black87
    ),
  });
}
