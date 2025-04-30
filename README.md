# tree-sitter-motoko

A tree-sitter grammar for the Motoko programming language.

## Why does this exist?

There is an existing grammar at https://github.com/polychromatist/tree-sitter-motoko

I wanted to re-familiarize myself with every corner of Motoko's syntax, so I decided to implement my own.
The existing grammar suffers from a [tree-sitter bug](https://github.com/tree-sitter/tree-sitter/issues/4091), which made it unsuitable for implementing parser based indentation in Emacs. This grammar works around that bug.

Additional differences:

- Doesn't require a custom scanner
- Covers some more recent syntax additions (parentheticals), and some of the weirder lexical productions
- Follows the compiler's grammar more closely by implementing parameterized expression productions.
- ~33% reduction in compiled output size
- Tested to successfully parse every .mo file in the compiler repository, as well as base
