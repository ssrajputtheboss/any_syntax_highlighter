

import 'package:any_syntax_highlighter/utils/regex_collection.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('all regex tests', () {
    test('comment regex test', (){
      var re = RegExp(RegexCollection.hashComment);
      const hash = "#this is a cool comment";
      int c=0;
      re.allMatches(hash).forEach((e) => c++);
      expect(1, c);
      const comment = '//comment\noh yeah//';
      c=0;
      re = RegExp(RegexCollection.doubleSlashComment);
      re.allMatches(comment).forEach((e) => c++);
      expect(2, c);
      re = RegExp(RegexCollection.multilineComment);
      const multilineComment = '/*comment\n\n*/';
      expect(true, re.hasMatch(multilineComment));
    });

    test('identifier test', () {
      final re = RegExp(RegexCollection.identifier);
      const id = '_x = 5';
      expect(true, re.hasMatch(id));
      const nonId = '(){}';
      expect(false, re.hasMatch(nonId));
    });

    test('title test', () {
      final re = RegExp(RegexCollection.title);
      const v = 'variable';
      const title = 'Class';
      const dartClass = '_Class';
      expect(true, re.hasMatch(title));
      expect(true, re.hasMatch(dartClass));
      expect(false, re.hasMatch(v));
    });

    test('operator test', () {
      final re = RegExp(RegexCollection.operators);
      const op = '+++--=*&^%!~.-=?/<>@';
      expect('', op.replaceAll(re, ''));
      const sep = '{}[]';
      expect(false, sep.replaceAll(re, '') == '');
    });

    test('string test', () {
      final sqsRe = RegExp(RegexCollection.singleQuoteString);
      const sqs = "'this is a\\string'";
      expect(true, sqsRe.hasMatch(sqs));
      final dqsRe = RegExp(RegexCollection.doubleQuoteString);
      const dqs = '"this is a\\string"';
      expect(true, dqsRe.hasMatch(dqs));
      final tsqsRe = RegExp(RegexCollection.tripleSingleQuoteString);
      const tsqs = "r'''this is a\nstring\nwith many lines'''";
      expect(true, tsqsRe.hasMatch(tsqs));
      final tdqsRe = RegExp(RegexCollection.tripleDoubleQuoteString);
      const tdqs = '"""this "cool" is a\nstring\nwith many lines"""';
      expect(true, tdqsRe.hasMatch(tdqs));
    });

    test('number test', () {
      expect(true, RegExp(RegexCollection.number).hasMatch('37256372'));
    });
  });
}