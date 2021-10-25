/*
this file provides a class RegexCollection which is collection
of regex strings on based of which we will tokenize our input
 */

/// Collection of regular expressions necessary for tokenization
class RegexCollection {
  // string regex

  /// regex string to match a single quote string
  static const singleQuoteString =
      r"[rf]?'((\{|\}).*?(\{|\})|(\\\n|(\\')|[^'\n])*?)*'";

  /// regex string to match a double quote string
  static const doubleQuoteString =
      r'[rf]?"((\{|\}).*?(\{|\})|(\\\n|\\"|[^"\n])*?)*"';

  /// regex string to match a triple double quote string
  static const tripleDoubleQuoteString =
      r'[rf]?"""((\{|\})(.|\n)*?(\{|\})|(.|\n)*?)*?"""';

  /// regex string to match a triple single quote string
  static const tripleSingleQuoteString =
      r"[rf]?'''((\{|\})(.|\n)*?(\{|\})|(.|\n)*?)*?'''";

  /// regex string to match a backtick string
  /// like javascript `hello world`
  static const backtickString = r'`((\{|\})(.|\n)*?(\{|\})|(.|\n)*?)*?`';

  /// any string used for testing if a given string is string or not
  static const anyString = r'''[rf]?("(.|\n)*"|'(.|\n)*')|`(.|\n)*`''';

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

  /// regular expression for title
  static final regExpTitle = RegExp(title);

  /// regular expression for number
  static final regExpNumber = RegExp(number);

  /// regular expression for any string
  static final regExpAnyString = RegExp(anyString);

  /// regular expression for null character
  static final regExpNullChar = RegExp(nullChar);

  /// regular expression object for identifier
  static final regExpIdentifier = RegExp(identifier);

  /// regular expression object for operators
  static final regExpOperators = RegExp(operators);

  /// regular expression object for any comment
  static final regExpAnyComment = RegExp([
    hashComment,
    doubleSlashComment,
    multilineComment,
    xmlComment
  ].join('|'));

  /// regular expression object for single line comment
  static final regExpSingleLineComment =
      RegExp([hashComment, doubleSlashComment].join("|"));

  /// regular expression object for private
  static final regExpPrivate = RegExp(private);

  /// regular expression object for string and comment
  static final regExpStringOrComment = RegExp([
    backtickString,
    tripleSingleQuoteString,
    tripleDoubleQuoteString,
    singleQuoteString,
    doubleQuoteString,
    hashComment,
    doubleSlashComment,
    multilineComment,
    xmlComment
  ].join('|'));

  /// regular expression object for tokenizing input
  static final regExpTokenizer =
      RegExp([nullChar, identifier, number, operators, except].join('|'));

  // functions for checking

  /// returns true if input token is an identifier and starts with capital letter
  static bool isTitle(String token) => regExpTitle.stringMatch(token) == token;

  /// returns true if input token is of type number
  static bool isNumber(String token) =>
      regExpNumber.stringMatch(token) == token;

  /// returns true if input token is of type string
  static bool isString(String token) =>
      regExpAnyString.stringMatch(token) == token;

  /// returns true if input token is a null character (i.e. \x00)
  static bool isNullChar(String token) => regExpNullChar.hasMatch(token);

  /// returns true if token is an identifier
  static bool isIdentifier(String token) =>
      regExpIdentifier.stringMatch(token) == token;

  /// returns true if input token is an operator
  static bool isOperator(String token) =>
      regExpOperators.stringMatch(token) == token;

  /// returns true if input matches regex of any comment single line or multiline
  static bool isComment(String token) =>
      regExpAnyComment.stringMatch(token) == token;

  /// returns true if input is a single line comment
  static bool isSingleLineComment(String token) =>
      regExpSingleLineComment.stringMatch(token) == token;

  /// returns true if input token is an identifier and starts with underscore(_)
  static bool isPrivate(String token) =>
      regExpPrivate.stringMatch(token) == token;
}
