# any_syntax_highlighter

any_syntax_highlighter is a lightweight 'convention based' syntax highlighter which provides highlighting to input text code.

## Features

* add custom keywords or use default ones
* convention based highlighting 
    * identifiers starting with uppercase are considered as class/constructor
    * Class.abc => static variable
    * three types of comments are supported
        * single line comment staring with #
        * single line comment starting with //
        * multiline comment /*.....\*/
    * identifier starting with _ => private
    * functions after . operator => method (highlighting for function and method are different)
 * Use google fonts! (Thanks to [google_fonts](https://pub.dev/packages/google_fonts) library)

## Getting started

import package-
```dart
import 'package:any_syntax_highlighter/any_syntax_highlighter.dart';
```
![github_web_theme](https://ssrajputtheboss.github.io/testing/ashs3.png)
![default_theme_with_google_fonts](https://ssrajputtheboss.github.io/testing/ashgf.png)

The above image contains McLaren font provided by google_fonts.

## Usage

Basic usage
```dart
AnySyntaxHighlighter(
  '''Class Main{
  public static void main(String args[]){
    
  }
}'''
)
```

Usage with optional fields
```dart
AnySyntaxHighlighter(
          '#your code goes here',
          fontSize: 16,
          lineNumbers: false, // by default false
          theme: AnySyntaxHighlighterThemeCollection.githubWebTheme(), // you can create and pass custom theme using AnySyntaxHighlighterTheme class
          isSelectableText: true, // this creates a SelectableText.rich() widget, makes text selectable (by default false)
          useGoogleFont: 'Lato',
          copyIcon: const Icon(Icons.copy_rounded,color:Colors.black),// default is white colored icon
          hasCopyButton: true,// by default false
          /* other options are:- 
          padding,
          margin,
          textAlign,
          this.textDirection,
          softWrap,
          overflow,
          textScaleFactor,
          maxLines,
          locale,
          strutStyle,
          textWidthBasis,
          textHeightBehavior,
          */
)
```

## Using Google Fonts

You can add any of the google fonts available in google_fonts library. Just pass
a string name of google font you want to use to useGoogleFont property

```dart
AnySyntaxHighlighter(
  '// google fonts usage demo',
  useGoogleFont: 'Lato'
)
```

Don't forget to add appropriate License for the font you are using for more details
read [google_fonts documentation](https://pub.dev/packages/google_fonts).

## packages,classes and their definition

|package/classes|definition|
| :--: | :--- |
|AnySyntaxHighlighter|Widget that provides highlighting|
|AnySyntaxHighlighterBaseTheme|super class of AnySyntaxHighlighterTheme no use case for user|
|AnySyntaxHighlighterTheme|for making custom themes you can use this class and pass it to theme option of widget|
|AnySyntaxHighlighterThemeCollection|collection of default themes provided by this package|
|RegexCollection|collection of regular expression strings used to tokenize the input code, no or less use case for user|
|Token|token class for internal usage only|

## Additional information

Open for contribution, specially if you can create themes using our web tool [AnySyntaxHighlighterThemeLab](https://ssrajputtheboss.github.io/any_syntax_highlighter_web_app/)
For themes you need not necessarily need to raise an issue just build the theme, make sure you do these things:-
* your made changes to any_syntax_highlighter_theme_collection.dart file only
* you have dart formatted your code before making pull request

If you find any bug/suggestion feel free to raise an issue on [github repository](https://github.com/ssrajputtheboss/any_syntax_highlighter).
