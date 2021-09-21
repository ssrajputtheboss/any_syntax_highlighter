
/*
this file provides a class RegexCollection which is collection
of regex strings on based of which we will tokenize our input
 */

class RegexCollection{

  // string regex
  static const singleQuoteString = r"[rf]?'(\\\n|(\\')|[^'\n])*'";
  static const doubleQuoteString = r'[rf]?"(\\\n|\\"|[^"\n])*"';
  static const tripleDoubleQuoteString = r'[rf]?"""(.|\n)*?"""';
  static const tripleSingleQuoteString = r"[rf]?'''(.|\n)*?'''";

  // any string used for testing if a given string is string or not
  static const anyString = r'''[rf]?("(.|\n)*"|'(.|\n)*')''';

  // single line comment regex
  static const hashComment = r'#.*';
  static const doubleSlashComment = r'//.*';

  // multiline comments regex
  static const multilineComment = r'/\*(.|\n)*?\*/';

  // null character
  static const nullChar = '\x00';

  // operators regex
  static const operators = r'[+-/*<>=&|\^%?!~@\.]+';

  // number regex
  static const number = r'\d+';

  // title regex ( this is to differentiate a class and normal variable or a function or constructor )
  static const title = r'_?[A-Z]\w*';

  // identifier
  static const identifier = r'[a-zA-Z_]\w*';

  // except this will catch all other characters
  static const except = r'[^\w\x00+-/*<>=&|\^%?@!~\.]+';

  // functions for checking

  static bool isTitle(String token) => RegExp(title).stringMatch(token) == token;

  static bool isNumber(String token) => RegExp(number).stringMatch(token) == token;

  static bool isString(String token) => RegExp(anyString).stringMatch(token) == token;

  static bool isNullChar(String token) => RegExp(nullChar).hasMatch(token);

  static bool isIdentifier(String token) => RegExp(identifier).stringMatch(token) == token;

  static bool isOperator(String token) => RegExp(operators).stringMatch(token) == token;

  static bool isComment(String token) => RegExp([hashComment,doubleSlashComment,multilineComment].join('|')).stringMatch(token) == token;

}