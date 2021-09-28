library any_syntax_highlighter;

/*
this file contains the widget that this package is going to provide AnySyntaxHighlighterText
 */


import 'dart:ui';

import 'package:any_syntax_highlighter/themes/any_syntax_highlighter_theme.dart';
import 'package:any_syntax_highlighter/utils/token_types.dart';
import 'package:any_syntax_highlighter/utils/tokenizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnySyntaxHighlighter extends StatelessWidget{
  final String text;
  final AnySyntaxHighlighterTheme theme;
  final bool isSelectableText; // for building SelectableText.rich() widget
  final double padding,margin;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final bool softWrap;
  final TextOverflow overflow;
  final double textScaleFactor;
  final int? maxLines;
  final Locale? locale;
  final StrutStyle? strutStyle;
  final TextWidthBasis textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final double? fontSize;

  const AnySyntaxHighlighter(this.text,{
    Key? key,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.softWrap = true,
    this.overflow = TextOverflow.clip,
    this.textScaleFactor = 1.0,
    this.maxLines,
    this.locale,
    this.strutStyle,
    this.textWidthBasis = TextWidthBasis.parent,
    this.textHeightBehavior,
    this.padding = 2,
    this.margin = 0,
    this.isSelectableText = false,
    this.theme = const AnySyntaxHighlighterTheme(),
    this.fontSize
  }) : super(key: key);

  /*
  assertions before building widget
   */
  void assertions(){
    assert(!text.contains('\x00'));
  }

  TextStyle _getStyleByTokenType(String type) {
    switch(type){
      case TokenTypes.keyword: return theme.keyword;
      case TokenTypes.number: return theme.number;
      case TokenTypes.classType: return theme.classStyle;
      case TokenTypes.function: return theme.function;
      case TokenTypes.identifier: return theme.identifier;
      case TokenTypes.staticType: return theme.staticStyle;
      case TokenTypes.constructor: return theme.constructor;
      case TokenTypes.comment: return theme.comment;
      case TokenTypes.string: return theme.string;
      case TokenTypes.operator: return theme.operator;
      case TokenTypes.separator: return theme.separator;
      case TokenTypes.method: return theme.method;
      case TokenTypes.private: return theme.private;
      case TokenTypes.multilineComment: return theme.multilineComment;
      default: return const TextStyle();
    }
  }

  List<TextSpan> _createSpans() => tokenizer(text).map((token) => TextSpan(text: token.value,style: _getStyleByTokenType(token.type))).toList();

  Widget _highlighter() => !isSelectableText ? RichText(
    text: TextSpan(
      text: '',
      style: TextStyle(
          fontSize: fontSize,
          fontFamily: theme.fontFamily,
          letterSpacing: theme.letterSpacing,
          wordSpacing: theme.wordSpacing,
          fontFeatures: theme.fontFeatures
      ),
      children: _createSpans(),
    ),
    textAlign: textAlign,
    textDirection: textDirection,
    softWrap: softWrap,
    overflow: overflow,
    textScaleFactor: textScaleFactor,
    maxLines: maxLines,
    locale: locale,
    strutStyle: strutStyle,
    textWidthBasis: textWidthBasis,
    textHeightBehavior: textHeightBehavior,
  ) :
  SelectableText.rich(
    TextSpan(
      text: '',
      style: TextStyle(
          fontSize: fontSize,
          fontFamily: theme.fontFamily,
          letterSpacing: theme.letterSpacing,
          wordSpacing: theme.wordSpacing,
          fontFeatures: theme.fontFeatures
      ),
      children: _createSpans(),
    ),
    textAlign: textAlign,
    textDirection: textDirection,
    textScaleFactor: textScaleFactor,
    maxLines: maxLines,
    strutStyle: strutStyle,
    textWidthBasis: textWidthBasis,
    textHeightBehavior: textHeightBehavior,
  );

  @override
  Widget build(BuildContext context) {
    // text must not contain \x00 character asserting before building
    assertions();
    return Container(
        padding: EdgeInsets.all(padding),
        margin: EdgeInsets.all(margin),
        decoration: theme.boxDecoration,
        child: _highlighter()
    );
  }
}