library any_syntax_highlighter;

/*
this file contains the widget that this package is going to provide AnySyntaxHighlighterText
 */

import 'package:any_syntax_highlighter/themes/any_syntax_highlighter_theme.dart';
import 'package:any_syntax_highlighter/utils/common_keywords.dart';
import 'package:any_syntax_highlighter/utils/regex_collection.dart';
import 'package:any_syntax_highlighter/utils/token.dart';
import 'package:any_syntax_highlighter/utils/token_types.dart';
import 'package:flutter/material.dart';
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

  /// set of reserved words for this instance of AnySyntaxHighlighter
  /// this allows to create language specific highlighting
  /// user can add desired reserved words for a language by using
  /// `ReservedWords.userReservedWords['language_name'] = {'keyword1', 'keyword2'}`
  /// make sure to import corresponding library before using it
  final Set<String> reservedWordSets;

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
      this.reservedWordSets = const {
        'java',
        'python',
        'c',
        'cpp',
        'c#',
        'dart',
        'go',
        'javascript',
        'r',
        'swift',
        'bash',
        'ruby'
      },
      this.lineNumbers = false})
      : super(key: key);

  /// assertions before building widget
  void assertions() {
    // text must not contain \x00 character asserting before building
    assert(!text.contains('\x00'));

    // line Numbers is for only RichText widget as of now
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

      case TokenTypes.lineNumber:
        return theme.lineNumber;

      default:
        // will never reach here in real case
        return const TextStyle();
    }
  }

  /// returns a fixed length string value for line number
  String _getLineValue(int value, int maxLength) =>
      '  ' + '  ' * (maxLength - '$value'.length) + '$value' + '  ';

  /// create and return TextSpans based on token inputs
  List<TextSpan> _createSpans() => tokenizer(text)
      .map((token) =>
          TextSpan(text: token.value, style: _getStyleByTokenType(token.type)))
      .toList();

  /// creates and returns list of tokens from String input
  List<Token> tokenizer(String input) {
    List<Token> tokens = [];

    List<String> stringCommentList = [];

    // string and comment should be calculated at the beginning to avoid ambiguous matches later

    RegexCollection.regExpStringOrComment.allMatches(input).forEach((e) {
      stringCommentList.add(e.group(0)!);

      input = input.replaceFirst(e.group(0)!, RegexCollection.nullChar);
    });

    /*
  some properties of a token depends upon the trailing and upcoming token
  we can keep track of previous and next token to find out the property
   */

    Token? previousToken, currentToken, nextToken;

    final tokenList = RegexCollection.regExpTokenizer
        .allMatches(input)
        .map((e) => e.group(0)!)
        .toList();

    final listLength = tokenList.length;

    int p = 0,
        currentLineNumber = 1,
        maxLength = '${text.split('\n').length + 1}'.length;

    if (listLength != 0) {
      if (RegexCollection.isNullChar(tokenList[0])) {
        currentToken = getTokenByString(stringCommentList[p]);
        p++;
      } else {
        currentToken = getTokenByString(tokenList[0]);
      }
    }

    if (listLength > 1) {
      if (RegexCollection.isNullChar(tokenList[1])) {
        nextToken = getTokenByString(stringCommentList[p]);

        p++;
      } else {
        nextToken = getTokenByString(tokenList[1]);
      }
    }

    if (lineNumbers) {
      tokens.add(Token(_getLineValue(currentLineNumber++, maxLength),
          TokenTypes.lineNumber, false));
    }

    for (int i = 0; i < listLength; ++i) {
      if (currentToken?.type == TokenTypes.identifier) {
        if (previousToken != null &&
            previousToken.value.endsWith('.') &&
            previousToken.isClassContext) {
          //static

          currentToken?.type = TokenTypes.staticType;

          currentToken?.isClassContext = true;
        } else {
          if (nextToken != null && nextToken.value.trim().startsWith('(')) {
            // function

            if (previousToken != null && previousToken.value.endsWith('.')) {
              currentToken?.isClassContext = false;

              currentToken?.type = TokenTypes.method;
            } else {
              currentToken?.isClassContext = false;

              currentToken?.type = TokenTypes.function;
            }
          } else {
            // identifier

            if (currentToken != null &&
                RegexCollection.isPrivate(currentToken.value)) {
              currentToken.isClassContext = false;

              currentToken.type = TokenTypes.private;
            } else {
              currentToken?.isClassContext = false;

              currentToken?.type = TokenTypes.identifier;
            }
          }
        }
      } else if (currentToken?.type == TokenTypes.classType) {
        if (nextToken != null && nextToken.value.trim().startsWith('(')) {
          // constructor

          currentToken?.type = TokenTypes.constructor;

          currentToken?.isClassContext = false;
        } else {
          // class

          currentToken?.type = TokenTypes.classType;

          currentToken?.isClassContext = true;
        }
      } else {
        if (currentToken != null &&
            ((currentToken.type == TokenTypes.operator &&
                    currentToken.value.endsWith('.')) ||
                currentToken.type == TokenTypes.separator)) {
          currentToken.isClassContext =
              previousToken == null ? false : previousToken.isClassContext;
        } else {
          currentToken?.isClassContext = false;
        }
      }

      if (currentToken != null &&
          currentToken.value.contains('\n') &&
          lineNumbers) {
        var tkns = <Token>[];
        final splits = currentToken.value.split('\n');
        tkns.add(
            Token(splits[0], currentToken.type, currentToken.isClassContext));
        for (int i = 1; i < splits.length; ++i) {
          tkns.add(Token('\n' + _getLineValue(currentLineNumber++, maxLength),
              TokenTypes.lineNumber, false));
          tkns.add(
              Token(splits[i], currentToken.type, currentToken.isClassContext));
        }
        tokens.addAll(tkns);
      } else {
        tokens.add(currentToken!);
      }

      if (currentToken.type != TokenTypes.separator) {
        previousToken = currentToken;
      }

      currentToken = nextToken;

      if (i < (listLength - 2)) {
        if (RegexCollection.isNullChar(tokenList[i + 2])) {
          nextToken = getTokenByString(stringCommentList[p]);

          p++;
        } else {
          nextToken = getTokenByString(tokenList[i + 2]);
        }
      } else {
        nextToken = null;
      }
    }

    return tokens;
  }

  /// this functions initiates the starting properties of a token ,
  /// rest of the properties are calculated on basis of previous and next token
  Token getTokenByString(String value) {
    if (RegexCollection.isString(value)) {
      // String found
      return Token(value, TokenTypes.string, false);
    } else if (RegexCollection.isComment(value)) {
      //comment found
      if (RegexCollection.isSingleLineComment(value)) {
        return Token(value, TokenTypes.comment, false);
      } else {
        return Token(value, TokenTypes.multilineComment, false);
      }
    } else if (RegexCollection.isNumber(value)) {
      //number found
      return Token(value, TokenTypes.number, false);
    } else if (RegexCollection.isIdentifier(value)) {
      if (ReservedWords.isReservedWord(reservedWordSets, value)) {
        // keyword found
        return Token(value, TokenTypes.keyword, false);
      } else if (RegexCollection.isTitle(value)) {
        // class/constructor found
        return Token(value, TokenTypes.classType, true);
      } else {
        // identifier found
        return Token(value, TokenTypes.identifier, false);
      }
    } else if (RegexCollection.isOperator(value)) {
      //operator found
      return Token(value, TokenTypes.operator, false);
    } else {
      // separator found
      return Token(value, TokenTypes.separator, false);
    }
  }

  /// creates main widget if isSelectableText is true returns RichText otherwise SelectableText.rich()
  Widget _highlighter() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: isSelectableText
            ? SelectableText.rich(
                TextSpan(
                  text: '',
                  style: useGoogleFont == null
                      ? TextStyle(
                          fontSize: fontSize,
                          fontFamily: theme.fontFamily,
                          letterSpacing: theme.letterSpacing,
                          wordSpacing: theme.wordSpacing,
                          fontFeatures: theme.fontFeatures)
                      : GoogleFonts.getFont(useGoogleFont!,
                          fontSize: fontSize,
                          letterSpacing: theme.letterSpacing,
                          wordSpacing: theme.wordSpacing,
                          fontFeatures: theme.fontFeatures),
                  children: _createSpans(),
                ),
                textAlign: textAlign,
                textDirection: textDirection,
                textScaleFactor: textScaleFactor,
                maxLines: maxLines,
                strutStyle: strutStyle,
                textWidthBasis: textWidthBasis,
                textHeightBehavior: textHeightBehavior,
              )
            : RichText(
                text: TextSpan(
                  text: '',
                  style: useGoogleFont == null
                      ? TextStyle(
                          fontSize: fontSize,
                          fontFamily: theme.fontFamily,
                          letterSpacing: theme.letterSpacing,
                          wordSpacing: theme.wordSpacing,
                          fontFeatures: theme.fontFeatures)
                      : GoogleFonts.getFont(useGoogleFont!,
                          fontSize: fontSize,
                          letterSpacing: theme.letterSpacing,
                          wordSpacing: theme.wordSpacing,
                          fontFeatures: theme.fontFeatures),
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
              ),
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
                style: useGoogleFont == null
                    ? TextStyle(
                        fontSize: fontSize,
                      )
                    : GoogleFonts.getFont(useGoogleFont!,
                        fontSize: fontSize,
                        backgroundColor: Colors.transparent)),
          ),
        ]),
        Expanded(child: _highlighter())
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
        child: _highlighter());
  }
}
