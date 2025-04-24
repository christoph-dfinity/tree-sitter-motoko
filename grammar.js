/**
 * @file Motoko grammar for tree-sitter
 * @author Christoph Hegemann <christoph.hegemann@dfinity.org>
 * @license MIT
 */

/// <reference types="tree-sitter-cli/dsl" />
// @ts-check

module.exports = grammar({
  name: "motoko",
  extras: $ => [/\s+/, $.line_comment, $.doc_comment, $.block_comment],

  rules: {
    // Comments
    line_comment: $ => token(seq("//", /[^\n]*/)),
    doc_comment: $ => token(seq("///", /[^\n]*/)),
    block_comment: $ => seq('/*', optional($.comment_text), '*/'),
    comment_text: $ => repeat1(choice(/.|\n|\r/)),

    source_file: $ => "hello",
  }
});
