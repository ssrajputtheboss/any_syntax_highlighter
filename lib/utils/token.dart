/*
this file contains a class token which is used to store details of a token
 */

class Token {
  String value;

  String type;

  bool isClassContext;

  Token(this.value, this.type, this.isClassContext);

  @override
  String toString() =>
      ' Token{type: $type,value: $value,isClassContext: $isClassContext} ';
}
