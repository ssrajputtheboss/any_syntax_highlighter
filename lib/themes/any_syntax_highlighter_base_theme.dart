/*
this file contains the basic type of tokens that all programming languages do have
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

abstract class AnySyntaxHighlighterBaseTheme {
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
    required this.comment,
    required this.keyword,
    required this.identifier,
    required this.function,
    required this.number,
    required this.string,
    required this.operator,
    required this.separator,
    required this.boxDecoration,
  });
}
