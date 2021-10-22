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
import 'package:google_fonts/google_fonts.dart';

/// widget AnySyntaxHighlighter this widget will provide the syntax highlighting to input text
class AnySyntaxHighlighter extends StatelessWidget {
  /// input text code
  final String text;

  /// theme for highlighting code
  final AnySyntaxHighlighterTheme theme;

  /// if set true will build a SelectableText.rich() widget, builds RichText otherwise
  final bool isSelectableText; // for building SelectableText.rich() widget

  /// padding and margin for outer container widget
  final double padding, margin;

  /// to be passed as textAlign parameter of RichText widget
  final TextAlign textAlign;

  /// to be passed as textDirection parameter of RichText widget
  final TextDirection? textDirection;

  /// to be passed as softWrap parameter of RichText widget
  final bool softWrap;

  /// to be passed as textOverflow parameter of RichText widget
  /// default value is TextOverflow.clip
  final TextOverflow overflow;

  /// to be passed as textScaleFactor parameter of RichText widget
  final double textScaleFactor;

  /// to be passed as maxLines parameter of RichText widget
  final int? maxLines;

  /// to be passed as locale parameter of RichText widget
  final Locale? locale;

  /// to be passed as strutStyle parameter of RichText widget
  final StrutStyle? strutStyle;

  /// to be passed as textWidthBasis parameter of RichText widget
  final TextWidthBasis textWidthBasis;

  /// to be passed as textHeightBehavior parameter of RichText widget
  final TextHeightBehavior? textHeightBehavior;

  /// set fontSize using this parameter
  final double? fontSize;

  /// if true an additional line numbers widget will appear in left hand side
  final bool lineNumbers;

  /// choose google fonts you wish to use
  /// if it's value is null no google fonts will be used
  /// if not null it will use GoogleFonts.getFont(useGoogleFont) to get
  /// that font
  final String? useGoogleFont;

  /// AnySyntaxHighlighter Widget constructor
  const AnySyntaxHighlighter(this.text,
      {Key? key,
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
      this.fontSize,
      this.useGoogleFont,
      this.lineNumbers = false})
      : super(key: key);

  /// assertions before building widget
  void assertions() {
    // text must not contain \x00 character asserting before building
    assert(!text.contains('\x00'));

    // line Numbers is for only RichText widget
    // so both isSelectableText and lineNumbers can't be true one must be false
    assert((lineNumbers && isSelectableText) == false);
  }

  /// returns the TextStyle defined in theme for a particular type of token
  TextStyle _getStyleByTokenType(dynamic type) {
    switch (type) {
      case TokenTypes.keyword:
        return theme.keyword;

      case TokenTypes.number:
        return theme.number;

      case TokenTypes.classType:
        return theme.classStyle;

      case TokenTypes.function:
        return theme.function;

      case TokenTypes.identifier:
        return theme.identifier;

      case TokenTypes.staticType:
        return theme.staticStyle;

      case TokenTypes.constructor:
        return theme.constructor;

      case TokenTypes.comment:
        return theme.comment;

      case TokenTypes.string:
        return theme.string;

      case TokenTypes.operator:
        return theme.operator;

      case TokenTypes.separator:
        return theme.separator;

      case TokenTypes.method:
        return theme.method;

      case TokenTypes.private:
        return theme.private;

      case TokenTypes.multilineComment:
        return theme.multilineComment;

      default:
        // will never reach here in real case
        return const TextStyle();
    }
  }

  /// returns a fixed length string value for line number
  String _getLineValue(int value, int maxLength) =>
      '  ' + '  ' * (maxLength - '$value'.length) + '$value';

  /// create and return TextSpans based on token inputs
  List<TextSpan> _createSpans() => tokenizer(text)
      .map((token) => TextSpan(
          text: token.value,
          style: _getStyleByTokenType(token.type) ) )
      .toList();

  /// creates main widget if ifSelectableText is true returns RichText otherwise SelectableText.rich()
  Widget _highlighter() => !isSelectableText
      ? RichText(
          text: TextSpan(
            text: '',
            style: useGoogleFont == null ? TextStyle(
                fontSize: fontSize,
                fontFamily: theme.fontFamily,
                letterSpacing: theme.letterSpacing,
                wordSpacing: theme.wordSpacing,
                fontFeatures: theme.fontFeatures):
            GoogleFonts.getFont(
                useGoogleFont!,
                fontSize: fontSize,
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
        )
      : SelectableText.rich(
          TextSpan(
            text: '',
            style: useGoogleFont == null ? TextStyle(
                fontSize: fontSize,
                fontFamily: theme.fontFamily,
                letterSpacing: theme.letterSpacing,
                wordSpacing: theme.wordSpacing,
                fontFeatures: theme.fontFeatures):
            GoogleFonts.getFont(
                useGoogleFont!,
                fontSize: fontSize,
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

  /// creates line number widget, only when lineNumbers is set to true
  Widget _lineNumberWidget() {
    final int lineCount = text.split('\n').length + 1;

    final maxLength = '$lineCount'.length;

    var lineNumberWidgets = <InlineSpan>[];

    for (int i = 1; i <= lineCount; ++i) {
      lineNumberWidgets.add(TextSpan(
        text: _getLineValue(i, maxLength) + '\n',
        style: theme.lineNumber,
      ));
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(children: [
          RichText(
            text: TextSpan(
                text: '',
                children: lineNumberWidgets,
                style: useGoogleFont == null ? TextStyle(
                  fontSize: fontSize,
                ): GoogleFonts.getFont(useGoogleFont!, fontSize: fontSize, backgroundColor: Colors.transparent )),
          ),
        ]),
        Expanded(
          child: SingleChildScrollView(
            // controller: ScrollController(),
            scrollDirection: Axis.horizontal,
            child: _highlighter(),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    assertions();

    return Container(
        padding: EdgeInsets.all(padding),
        margin: EdgeInsets.all(margin),
        decoration: theme.boxDecoration,
        child: lineNumbers
            ? _lineNumberWidget()
            : SingleChildScrollView(
                // controller: ScrollController(),
                scrollDirection: Axis.horizontal,
                child: _highlighter(),
              ));
  }
}
