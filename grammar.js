/**
 * @file Motoko grammar for tree-sitter
 * @author Christoph Hegemann <christoph.hegemann@dfinity.org>
 * @license MIT
 */

/// <reference types="tree-sitter-cli/dsl" />
// @ts-check

module.exports = grammar({
  name: "motoko",
  extras: $ => [/\s+/, $.doc_comment, $.line_comment, $.block_comment],
  word: $ => $.identifier,

  rules: {
    source_file: $ => repeat1($._literal),

    // Comments
    doc_comment: $ => token(seq("///", /[^\n]*/)),
    line_comment: $ => token(seq("//", /[^\n]*/)),
    block_comment: $ => seq("/*", optional($.comment_text), "*/"),
    comment_text: $ => repeat1(/.|\n|\r/),

    // Literals
    text_literal: $ => /"(?:\\"|[^"])*"/,
    char_literal: $ => /'\\''|'[^']*'/,
    float_literal: $ => /[+-]?\d+\.\d+/,
    int_literal: $ => /[+-]?[0-9_]+/,
    hex_literal: $ => /[+-]?0x[0-9a-fA-F_]+/,
    _literal: $ => choice(
      $.text_literal,
      $.char_literal,
      $.float_literal,
      $.int_literal,
      $.hex_literal,
    ),

    // Identifiers
    identifier: $ => /[a-zA-Z_][a-zA-Z_0-9]*/,
    privileged_identifier: $ => seq("@", token.immediate($.identifier)),
  }
});
