/*
this file contains a class token which is used to store details of a token
 */

class Token {
  /// will store string value of token
  String value;

  /// type of token must be one of TokenTypes
  dynamic type;

  /// if class context is true the upcoming identifier will
  /// be treated as a static identifier
  bool isClassContext;

  Token(this.value, this.type, this.isClassContext);

  /// for debugging and testing
  @override
  String toString() =>
      ' Token{type: $type,value: $value,isClassContext: $isClassContext} ';
}
