/**
 * @file Motoko grammar for tree-sitter
 * @author Christoph Hegemann <christoph.hegemann@dfinity.org>
 * @license MIT
 */

/// <reference types="tree-sitter-cli/dsl" />
// @ts-check

module.exports = grammar({
  name: "motoko",
  externals: $ => [ $.text_literal ],
  extras: $ => [/\s+/, $.doc_comment, $.line_comment, $.block_comment],

  rules: {
    source_file: $ => repeat1($.text_literal),

    // Comments
    doc_comment: $ => token(seq("///", /[^\n]*/)),
    line_comment: $ => token(seq("//", /[^\n]*/)),
    block_comment: $ => seq("/*", optional($.comment_text), "*/"),
    comment_text: $ => repeat1(/.|\n|\r/),
  }
});
