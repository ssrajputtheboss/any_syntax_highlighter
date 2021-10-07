import 'package:any_syntax_highlighter/utils/token.dart';
import 'package:any_syntax_highlighter/utils/token_types.dart';
import 'package:any_syntax_highlighter/utils/tokenizer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('tokenizer test', () {
    const input = """void main(){
      String string = "#this is a string";
      #comment
      (Thread).run().curve();
      for(int i = 0;i<5;++i){
        print(i);
      }
    }""";
    List<Token> tokens = tokenizer(input);
    int c=0;
    for(Token token in tokens){
      token.type == TokenTypes.staticType ? c++ : 0;
    }
    expect(2, c);
  });
}