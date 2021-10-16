/*
this file provides a class RegexCollection which is collection
of regex strings on based of which we will tokenize our input
 */

class RegexCollection {
  // string regex

  /// regex string to match a single quote string
  static const singleQuoteString = r"[rf]?'(\\\n|(\\')|[^'\n])*'";

  /// regex string to match a double quote string
  static const doubleQuoteString = r'[rf]?"(\\\n|\\"|[^"\n])*"';

  /// regex string to match a triple double quote string
  static const tripleDoubleQuoteString = r'[rf]?"""(.|\n)*?"""';

  /// regex string to match a triple single quote string
  static const tripleSingleQuoteString = r"[rf]?'''(.|\n)*?'''";

  /// regex string to match a backtick string
  /// like javascript `hello world`
  static const backtickString = r'`(.|\n)*?`';

  /// any string used for testing if a given string is string or not
  static const anyString = r'''[rf]?("(.|\n)*"|'(.|\n)*')|`(.|\n)*?`''';

  // single line comment regex

  /// regex string to match a single line hash comment
  static const hashComment = r'#.*';

  /// regex string to match a single line double slash comment
  static const doubleSlashComment = r'//.*';

  // multiline comments regex

  /// regex string to match a /*......*/ comment
  static const multilineComment = r'/\*(.|\n)*?\*/';

  /// regex string to match a xml comment
  /// for ex. <!-- comment  -->
  static const xmlComment = r'<!--(.|\n)*?-->';

  /// null character
  static const nullChar = '\x00';

  /// operators regex
  static const operators = r'[+-/*<>=&|\^%?!~@\.]+';

  /// number regex
  static const number = r'\d+(\.\d+)?[lLfF]?|\d+e\d+';

  /// title regex ( this is to differentiate a class and normal variable or a function or constructor )
  static const title = r'_*[A-Z]\w*';

  /// private variable in python/dart starting with _
  static const private = r'_+\w*';

  /// identifier regex
  static const identifier = r'[a-zA-Z_]\w*';

  /// except this will catch all other remaining characters
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
