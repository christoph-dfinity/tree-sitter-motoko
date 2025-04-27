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

    // Misc
    typ_annot: $ => seq(":", $._type),

    // Declarations
    _dec: $ => choice(
      $.exp_dec,
      $.var_dec,
      $.let_dec,
      $.let_else_dec,
    ),

    exp_dec: $ => $._exp,

    var_dec: $ => seq(
      "var",
      $.var_pat,
      optional($.typ_annot),
      "=",
      $._exp,
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
      $.lit_exp,
      $.par_exp,
      $.var_exp,
      $.if_exp,
    ),
    lit_exp: $ => $._literal,
    par_exp: $ => seq("(", $._exp, ")"),
    var_exp: $ => $.identifier,
    if_exp: $ => prec.right(seq(
      "if",
      "(",
      field("cond", $._exp),
      ")",
      field("then", $._exp),
      optional(seq(
        "else",
        field("else", $._exp),
      ))
    )),

    // Types
    _type: $ => choice(
      $.var_ty,
    ),
    var_ty: $ => $.identifier,

    // Patterns
    _pat: $ => $._pat_bin,

    _pat_plain: $ => choice(
      $.wild_pat,
      $.var_pat,
      $.lit_pat,
      $.tup_pat,
    ),
    _pat_nullary: $ => choice(
      $._pat_plain,
      $.obj_pat,
    ),
    _pat_un: $ => choice(
      $._pat_nullary,
      $.tag_pat,
      $.quest_pat,
    ),
    _pat_bin: $ => choice(
      $._pat_un,
      $.alt_pat,
      $.annot_pat,
    ),

    wild_pat: $ => "_",
    var_pat: $ => $.identifier,
    lit_pat: $ => $._literal,
    tup_pat: $ => seq(
      "(",
      comma_sep($._pat_bin),
      ")",
    ),
    obj_pat: $ => seq(
      "{",
      semi_sep($.pat_field),
      "}",
    ),
    tag_pat: $ => seq(
      "#",
      $.identifier,
      optional($._pat_nullary),
    ),
    quest_pat: $ => seq(
      "?",
      $._pat_un,
    ),
    alt_pat: $ => prec.left(2, seq(
      $._pat_bin,
      "or",
      $._pat_bin,
    )),
    annot_pat: $ => seq($._pat_bin, $.typ_annot),
    pat_field: $ => seq(
      $.identifier,
      optional($.typ_annot),
      optional(seq("=", $._pat))
    ),
  }
});
