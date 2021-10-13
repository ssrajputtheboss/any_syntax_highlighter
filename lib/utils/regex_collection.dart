/*
this file provides a class RegexCollection which is collection
of regex strings on based of which we will tokenize our input
 */

class RegexCollection {
  // string regex

  static const singleQuoteString = r"[rf]?'(\\\n|(\\')|[^'\n])*'";

  static const doubleQuoteString = r'[rf]?"(\\\n|\\"|[^"\n])*"';

  static const tripleDoubleQuoteString = r'[rf]?"""(.|\n)*?"""';

  static const tripleSingleQuoteString = r"[rf]?'''(.|\n)*?'''";

  static const backtickString = r'`(.|\n)*?`';

  // any string used for testing if a given string is string or not

  static const anyString = r'''[rf]?("(.|\n)*"|'(.|\n)*')|`(.|\n)*?`''';

  // single line comment regex

  static const hashComment = r'#.*';

  static const doubleSlashComment = r'//.*';

  // multiline comments regex

  static const multilineComment = r'/\*(.|\n)*?\*/';

  static const xmlComment = r'<!--(.|\n)*?-->';

  // null character

  static const nullChar = '\x00';

  // operators regex

  static const operators = r'[+-/*<>=&|\^%?!~@\.]+';

  // number regex

  static const number = r'\d+(\.\d+)?[lLfF]?|\d+e\d+';

  // title regex ( this is to differentiate a class and normal variable or a function or constructor )

  static const title = r'_*[A-Z]\w*';

  // private variable in python/dart starting with _

  static const private = r'_+\w*';

  // identifier

  static const identifier = r'[a-zA-Z_]\w*';

  // except this will catch all other characters

  static const except = r'[^\w\x00+-/*<>=&|\^%?@!~\.]+';

  // functions for checking

  /// returns true if input token is an identifier and starts with capital letter
  static bool isTitle(String token) =>
      RegExp(title).stringMatch(token) == token;

  /// returns true if input token is of type number
  static bool isNumber(String token) =>
      RegExp(number).stringMatch(token) == token;

  /// returns true if input token is of type string
  static bool isString(String token) =>
      RegExp(anyString).stringMatch(token) == token;

  /// returns true if input token is a null character (i.e. \x00)
  static bool isNullChar(String token) => RegExp(nullChar).hasMatch(token);

  /// returns true if token is an identifier
  static bool isIdentifier(String token) =>
      RegExp(identifier).stringMatch(token) == token;

  /// returns true if input token is an operator
  static bool isOperator(String token) =>
      RegExp(operators).stringMatch(token) == token;

  /// returns true if input matches regex of any comment single line or multiline
  static bool isComment(String token) =>
      RegExp([hashComment, doubleSlashComment, multilineComment, xmlComment]
              .join('|'))
          .stringMatch(token) ==
      token;

  /// returns true if input is a single line comment
  static bool isSingleLineComment(String token) =>
      RegExp([hashComment, doubleSlashComment].join("|")).stringMatch(token) ==
      token;

  /// returns true if input token is an identifier and starts with underscore(_)
  static bool isPrivate(String token) =>
      RegExp(private).stringMatch(token) == token;
}
