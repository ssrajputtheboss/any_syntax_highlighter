/*
this file contains the main tokenizer algorithm
 */

import 'package:any_syntax_highlighter/utils/common_keywords.dart';
import 'package:any_syntax_highlighter/utils/regex_collection.dart';
import 'package:any_syntax_highlighter/utils/token.dart';
import 'package:any_syntax_highlighter/utils/token_types.dart';

List<Token> tokenizer(String input){
  List<Token> tokens = [];
  List<String> stringCommentList = [];
  final stringOrComment = [
    RegexCollection.backtickString,
    RegexCollection.tripleSingleQuoteString,
    RegexCollection.tripleDoubleQuoteString,
    RegexCollection.singleQuoteString,
    RegexCollection.doubleQuoteString,
    RegexCollection.hashComment,
    RegexCollection.doubleSlashComment,
    RegexCollection.multilineComment,
    RegexCollection.xmlComment
  ].join('|');
  /*
  string and comment should be calculated at the beginning to avoid ambiguous matches later
   */
  RegExp(stringOrComment).allMatches(input).forEach((e) {
    stringCommentList.add(e.group(0)!);
    input = input.replaceFirst(e.group(0)!,RegexCollection.nullChar);
  });
  final tokenizerString = [
    RegexCollection.nullChar,
    RegexCollection.identifier,
    RegexCollection.number,
    RegexCollection.operators,
    RegexCollection.except
  ].join('|');
  /*
  some properties of a token depends upon the trailing and upcoming token
  we can keep track of previous and next token to find out the property
   */
  Token? previousToken,currentToken,nextToken;
  final tokenizerRe = RegExp(tokenizerString);
  final tokenList = tokenizerRe.allMatches(input).map((e) => e.group(0)!).toList();
  final listLength = tokenList.length;
  int p=0;
  if(listLength != 0) {
    if(RegexCollection.isNullChar(tokenList[0])){
      currentToken = getTokenByString(stringCommentList[p]);
      p++;
    }
    else {
      currentToken = getTokenByString(tokenList[0]);
    }
  }
  if(listLength > 1){
    if(RegexCollection.isNullChar(tokenList[1])){
      nextToken = getTokenByString(stringCommentList[p]);
      p++;
    }
    else {
      nextToken = getTokenByString(tokenList[1]);
    }
  }
  for (int i=0;i<listLength;++i) {
    if(currentToken?.type == TokenTypes.identifier){
      if(previousToken != null && previousToken.value.endsWith('.') && previousToken.isClassContext){
        //static
        currentToken?.type = TokenTypes.staticType;
        currentToken?.isClassContext = true;
      }else{
        if(nextToken != null && nextToken.value.trim().startsWith('(')){
          // function
          if(previousToken!=null && previousToken.value.endsWith('.')){
            currentToken?.isClassContext = false;
            currentToken?.type = TokenTypes.method;
          }else {
            currentToken?.isClassContext = false;
            currentToken?.type = TokenTypes.function;
          }
        }else {
          // identifier
          if (currentToken != null && RegexCollection.isPrivate(currentToken.value)) {
            currentToken.isClassContext = false;
            currentToken.type = TokenTypes.private;
          }else {
            currentToken?.isClassContext = false;
            currentToken?.type = TokenTypes.identifier;
          }
        }
      }
    }else if(currentToken?.type ==  TokenTypes.classType){
      if(nextToken!=null && nextToken.value.trim().startsWith('(')){
        // constructor
        currentToken?.type = TokenTypes.constructor;
        currentToken?.isClassContext = false;
      }else{
        // class
        currentToken?.type = TokenTypes.classType;
        currentToken?.isClassContext = true;
      }
    }else{
      if(currentToken!=null && ((currentToken.type == TokenTypes.operator && currentToken.value.endsWith('.')) || currentToken.type == TokenTypes.separator )){
        currentToken.isClassContext = previousToken == null ? false : previousToken.isClassContext;
      }else{
        currentToken?.isClassContext = false;
      }
    }
    tokens.add(currentToken!);
    if(currentToken.type != TokenTypes.separator){
      previousToken = currentToken;
    }
    currentToken = nextToken;
    if(i < (listLength-2)){
      if(RegexCollection.isNullChar(tokenList[i+2])){
        nextToken = getTokenByString(stringCommentList[p]);
        p++;
      }
      else {
        nextToken = getTokenByString(tokenList[i+2]);
      }
    }else{
      nextToken = null;
    }
  }
  return tokens;
}


/*
this functions initiates the starting properties of a token ,
rest of the properties are calculated on basis of previous and next
token
 */
Token getTokenByString(String value){
  if(RegexCollection.isString(value)){
    // String found
    return Token(value, TokenTypes.string, false);
  }else if(RegexCollection.isComment(value)){
    //comment found
    if(RegexCollection.isSingleLineComment(value)) {
      return Token(value, TokenTypes.comment, false);
    }else{
      return Token(value, TokenTypes.multilineComment, false);
    }
  }else if(RegexCollection.isNumber(value)){
    //number found
    return Token(value,TokenTypes.number,false);
  }else if(RegexCollection.isIdentifier(value)){
    if(isKeyword(value)) {
      // keyword found
      return Token(value,TokenTypes.keyword,false);
    }else if(RegexCollection.isTitle(value)){
      // class/constructor found
      return Token(value,TokenTypes.classType,true);
    }else{
      // identifier found
      return Token(value,TokenTypes.identifier,false);
    }
  }else if(RegexCollection.isOperator(value)){
    //operator found
    return Token(value, TokenTypes.operator, false);
  }else{
    // separator found
    return Token(value,TokenTypes.separator,false);
  }
}