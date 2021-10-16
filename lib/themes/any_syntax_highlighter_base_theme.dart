/*
this file contains the basic type of tokens that all programming languages do have
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

/// base theme reserved for future purpose
/// contains all the basic type of tokens common to almost all programming languages
abstract class AnySyntaxHighlighterBaseTheme {
  /// text styling for comment token
  final TextStyle comment;

  /// text styling for keyword token
  final TextStyle keyword;

  /// text styling for identifier token
  final TextStyle identifier;

  /// text styling for function token
  final TextStyle function;

  /// text styling for number token
  final TextStyle number;

  /// text styling for string token
  final TextStyle string;

  /// text styling for operator token
  final TextStyle operator;

  /// text styling for separator token
  final TextStyle separator;

  /// background box decoration
  /// to be passed to a Container widget
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
