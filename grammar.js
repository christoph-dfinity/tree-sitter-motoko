/**
 * @file Motoko grammar for tree-sitter
 * @author Christoph Hegemann <christoph.hegemann@dfinity.org>
 * @license MIT
 */

/// <reference types="tree-sitter-cli/dsl" />
// @ts-check

function comma_sep(rule) {
  return seq(repeat(seq(rule, ",")), optional(rule));
}

function semi_sep(rule) {
  return seq(repeat(seq(rule, ";")), optional(rule));
}

module.exports = grammar({
  name: "motoko",
  extras: $ => [/\s+/, $.doc_comment, $.line_comment, $.block_comment],
  word: $ => $.identifier,

  rules: {
    source_file: $ => semi_sep($._dec),

    // Comments
    doc_comment: $ => token(seq("///", /[^\n]*/)),
    line_comment: $ => token(seq("//", /[^\n]*/)),
    block_comment: $ => seq("/*", optional($.comment_text), "*/"),
    comment_text: $ => repeat1(/.|\n|\r/),

    // Identifiers
    identifier: $ => /[a-zA-Z_][a-zA-Z_0-9]*/,
    privileged_identifier: $ => seq("@", token.immediate($.identifier)),

    // Literals
    text_literal: $ => /"(?:\\"|[^"])*"/,
    char_literal: $ => /'\\''|'[^']*'/,
    // TODO: scientific notation
    float_literal: $ => /[+-]?\d+\.\d+/,
    int_literal: $ => /[+-]?[0-9_]+/,
    hex_literal: $ => /[+-]?0x[0-9a-fA-F_]+/,
    bool_literal: $ => choice("true", "false"),
    null_literal: $ => "null",
    _literal: $ => choice(
      $.text_literal,
      $.char_literal,
      $.float_literal,
      $.int_literal,
      $.hex_literal,
      $.bool_literal,
      $.null_literal,
    ),

    // Declarations
    _dec: $ => choice(
      $._exp,
      $.let_dec,
      $.let_else_dec,
    ),

    let_dec: $ => seq(
      "let",
      $._pat,
      "=",
      $._exp,
    ),
    let_else_dec: $ => seq(
      $.let_dec,
      "else",
      $._exp
    ),

    // Expressions
    _exp: $ => choice(
      $._literal,
      $.var_exp,
    ),
    var_exp: $ => $.identifier,

    // Types
    _type: $ => choice(
      $.var_ty,
    ),
    var_ty: $ => $.identifier,

    // Patterns
    _pat: $ => choice(
      $.var_pat,
    ),
    var_pat: $ => $.identifier,
  }
});
