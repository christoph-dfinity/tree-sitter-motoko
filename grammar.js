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

function semi_sep1(rule) {
  return seq(repeat(seq(rule, ";")), rule, optional(";"));
}

function _exp($, b) {
  return $[`_exp_${b}`]
}

function _exp_non_dec($, b) {
  return $[`_exp_non_dec_${b}`]
}

function _exp_bin($, b) {
  return $[`_exp_bin_${b}`]
}

function _exp_nullary($, b) {
  return $[`_exp_nullary_${b}`]
}

function _exp_unary($, b) {
  return $[`_exp_unary_${b}`]
}

function _exp_post($, b) {
  return $[`_exp_post_${b}`]
}

function assign_exp($, b) {
  return $[`assign_exp_${b}`]
}

function array_idx_exp($, b) {
  return $[`array_idx_exp_${b}`]
}

function proj_exp($, b) {
  return $[`proj_exp_${b}`]
}

function dot_exp($, b) {
  return $[`dot_exp_${b}`]
}

function call_exp($, b) {
  return $[`call_exp_${b}`]
}

function bang_exp($, b) {
  return $[`bang_exp_${b}`]
}

function system_exp($, b) {
  return $[`system_exp_${b}`]
}

function bin_exp($, b) {
  return $[`bin_exp_${b}`]
}

function annot_exp($, b) {
  return $[`annot_exp_${b}`]
}

function binassign_exp($, b) {
  return $[`binassign_exp_${b}`]
}

function mk_exp_nullary($, b) {
  if (b == "object") {
    return choice(
      $._exp_plain,
      $.var_exp,
      $.prim_exp,
      $.wild_exp,
      $.object_exp,
    );
  } else {
    return choice(
      $._exp_plain,
      $.var_exp,
      $.prim_exp,
      $.wild_exp,
    );
  }
}

// Inline me when we kill "all declarations are expressions"
function mk_exp_non_dec($, b) {
  return choice(
    _exp_bin($, b),
    assign_exp($, b),
    binassign_exp($, b),
    $.return_exp,
    $.async_exp,
    $.asyncstar_exp,
    $.assert_exp,
    $.label_exp,
    $.break_exp,
    $.continue_exp,
    $.debug_exp,
    $.if_exp,
    $.throw_exp,
    $.try_exp,
    $.switch_exp,
    $.while_exp,
    $.loop_exp,
    $.for_exp,
    $.ignore_exp,
    $.do_exp,
    $.do_quest_exp,
    $.func_exp,
  );
}

function mk_exp($, b) {
  // TODO: Declarations in expression position
  // return choice(
  //   _exp($, b),
  //   $._dec
  // )
  return _exp_non_dec($, b)
}

function mk_exp_bin($, b) {
  return choice(
    _exp_unary($, b),
    bin_exp($, b),
    annot_exp($, b),
  )
}

function mk_exp_unary($, b) {
  return choice(
    _exp_post($, b),
    // NOTE: I don't think parenthetical should be parameterized
    $.parenthetical_exp,
    $.hash_exp,
    $.quest_exp,
    $.unop_exp,
    $.unassign_exp,
    $.actor_exp,
    $.not_exp,
    $.debug_show_exp,
    $.to_candid_exp,
    $.from_candid_exp,
  );
}

function mk_exp_post($, b) {
  return choice(
    _exp_nullary($, b),
    $.array_exp,
    array_idx_exp($, b),
    proj_exp($, b),
    dot_exp($, b),
    call_exp($, b),
    bang_exp($, b),
    system_exp($, b),
  )
}

function mk_assign_exp($, b) {
  return seq(
    _exp_bin($, b),
    ":=",
    $._exp_object,
  )
}

function mk_array_idx_exp($, b) {
  return seq(
    _exp_post($, b),
    "[",
    $._exp_object,
    "]",
  )
}

function mk_proj_exp($, b) {
  return seq(
    _exp_post($, b),
    // TODO: token.immediate
    ".",
    $.int_literal,
  )
}

function mk_dot_exp($, b) {
  return seq(
    _exp_post($, b),
    ".",
    $.identifier,
  )
}

function mk_call_exp($, b) {
  return seq(
    _exp_post($, b),
    $.inst,
    $._exp_nullary_object,
  )
}

function mk_bang_exp($, b) {
  return seq(
    _exp_post($, b),
    "!"
  )
}

function mk_system_exp($, b) {
  return seq(
    "(",
    "system",
    _exp_post($, b),
    ".",
    $.identifier,
    ")",
  )
}

function mk_bin_exp($, b) {
  return prec.left(seq(
    bin_exp($, b),
    choice($.bin_op, $.rel_op),
    $._typ_no_bin,
  ))
}

function mk_annot_exp($, b) {
  return seq(
    _exp_bin($, b),
    ":",
    $._typ_no_bin,
  )
}

function mk_binassign_exp($, b) {
  return seq(
    _exp_bin($, b),
    $.binassign_op,
    $._exp_object,
  )
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
    _type_identifier: $ => alias($.identifier, $.type_identifier),
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
    typ_annot: $ => prec.right(seq(":", $._typ)),
    typ_path: $ => seq(
      repeat(seq($.identifier, ".")),
      $._type_identifier,
    ),
    path: $ => seq(
      repeat(seq($.identifier, ".")),
      $.identifier,
    ),

    unop: $ => choice(
      "+",
      "-",
      "^",
    ),
    unassign_op: $ => choice(
      "+=",
      "-=",
      "^=",
    ),
    binassign_op: $ => choice(
      "+=",
      "-=",
      "*=",
      "/=",
      "%=",
      "**-",
      "+%=",
      "-%=",
      "*%=",
      "**%=",
      "&=",
      "|=",
      "^=",
      "<<=",
      ">>=",
      "<<>=",
      "<>>=",
      "@=",
    ),
    rel_op: $ => choice(
      "==",
      "!-",
      token(" > "),
      token(" < "),
      "<=",
      ">=",
      "<<",
      token(" >>"),
      "<<>",
      "<>>",
    ),
    bin_op: $ => choice(
      "|>",
      "or",
      "and",
      "+",
      "-",
      "*",
      "/",
      "%",
      "+%",
      "-%",
      "*%",
      "|",
      "&",
      "^",
      "#",
      "**",
      "**%",
    ),
    // Declarations
    _dec: $ => choice(
      $.exp_dec,
      $.var_dec,
      $.let_dec,
      $.let_else_dec,
      $.typ_dec,
      $.func_dec,
      $.obj_dec,
      $.class_dec,
    ),

    exp_dec: $ => $._exp_object,

    var_dec: $ => seq(
      "var",
      $.var_pat,
      optional($.typ_annot),
      "=",
      $._exp_object,
    ),
    let_dec: $ => seq(
      "let",
      $._pat,
      "=",
      $._exp_object,
    ),
    let_else_dec: $ => seq(
      $.let_dec,
      "else",
      $._exp_nest,
    ),
    typ_dec: $ => seq(
      "type",
      $._type_identifier,
      optional($.typ_params),
      "=",
      $._typ,
    ),
    func_dec: $ => seq(
      optional("shared"),
      optional("composite"),
      optional("query"),
      "func",
      $.identifier,
      optional($.typ_params),
      $._pat_plain,
      optional($.typ_annot),
      $.func_body,
    ),

    obj_dec: $ => seq(
      $.obj_sort,
      optional($.identifier),
      optional($.typ_annot),
      optional("="),
      $.obj_body,
    ),

    class_dec: $ => seq(
      optional("shared"),
      optional("composite"),
      optional("query"),
      optional($.obj_sort),
      "class",
      optional($._type_identifier),
      optional($.typ_params),
      $._pat_plain,
      optional($.typ_annot),
      $.class_body,
    ),

    obj_sort: $ => choice(
      "object",
      "module",
      seq(optional("persistent"), "actor"),
    ),

    obj_body: $ => seq(
      "{",
      semi_sep($.dec_field),
      "}",
    ),
    class_body: $ => seq(
      optional(seq("=", optional($.identifier))),
      $.obj_body
    ),
    dec_field: $ => seq(optional($.vis), optional($.stab), $._dec),
    vis: $ => choice("private", "public", "system"),
    stab: $ => choice("flexible", "stable", "transient"),

    // Expressions
    _exp_block: $ => mk_exp($, "block"),
    _exp_object: $ => mk_exp($, "object"),

    _exp_non_dec_block: $ => mk_exp_non_dec($, "block"),
    _exp_non_dec_object: $ => mk_exp_non_dec($, "object"),

    _exp_post_block: $ => mk_exp_post($, "block"),
    _exp_post_object: $ => mk_exp_post($, "object"),

    _exp_nullary_block: $ => mk_exp_nullary($, "block"),
    _exp_nullary_object: $ => mk_exp_nullary($, "object"),

    _exp_unary_block: $ => mk_exp_unary($, "block"),
    _exp_unary_object: $ => mk_exp_unary($, "object"),

    _exp_bin_block: $ => mk_exp_bin($, "block"),
    _exp_bin_object: $ => mk_exp_bin($, "object"),

    _exp_nest: $ => choice(
      $.block_exp,
      $._exp_block,
    ),

    _exp_plain: $ => choice(
      $.lit_exp,
      $.par_exp,
    ),
    prim_exp: $ => seq("prim", $.text_literal),
    wild_exp: $ => "_",

    lit_exp: $ => $._literal,
    par_exp: $ => seq("(", $._exp_object, ")"),
    var_exp: $ => $.identifier,
    if_exp: $ => prec.right(seq(
      "if",
      "(",
      field("cond", $._exp_object),
      ")",
      field("then", $._exp_object),
      optional(seq(
        "else",
        field("else", $._exp_object),
      ))
    )),
    object_exp: $ => seq(
      "{",
      choice(
        semi_sep($.exp_field),
        // TODO
      ),
      "}",
    ),
    array_exp: $ => seq(
      "[",
      optional("var"),
      comma_sep($._exp_object),
      "]"
    ),
    block_exp: $ => seq(
      "{",
      semi_sep($._dec),
      "}"
    ),
    parenthetical_exp: $ => seq(
      $.parenthetical,
      $.call_exp_block,
    ),
    hash_exp: $ => seq(
      "#",
      $.identifier,
      optional($._exp_nullary_object),
    ),
    quest_exp: $ => seq("?", $._exp_unary_object),
    unop_exp: $ => seq(
      $.unop,
      $._exp_unary_object,
    ),
    unassign_exp: $ => seq(
      $.unassign_op,
      $._exp_unary_object,
    ),

    actor_exp: $ => seq(
      "actor",
      $._exp_plain,
    ),
    not_exp: $ => seq(
      "not",
      $._exp_unary_object,
    ),
    debug_show_exp: $ => seq(
      "debug_show",
      $._exp_unary_object,
    ),
    to_candid_exp: $ => seq(
      "to_candid",
      "(",
      comma_sep($._exp_object),
      ")",
    ),
    from_candid_exp: $ => seq(
      "from_candid",
      $._exp_unary_object,
    ),

    // TODO: Should be prec.nonassoc
    return_exp: $ => prec.left(seq(
      "return",
      optional($._exp_object),
    )),

    async_exp: $ => seq(
      optional($.parenthetical),
      "async",
      $._exp_nest,
    ),

    asyncstar_exp: $ => seq(
      "async*",
      $._exp_nest,
    ),

    assert_exp: $ => seq(
      "assert",
      $._exp_nest,
    ),

    label_exp: $ => seq(
      "label",
      $.identifier,
      optional($.typ_annot),
      $._exp_nest,
    ),

    break_exp: $ => seq(
      "break",
      $.identifier,
      optional($._exp_nullary_object),
    ),

    continue_exp: $ => seq("continue", $.identifier),
    debug_exp: $ => seq("debug", $._exp_nest),
    throw_exp: $ => seq("throw", $._exp_nest),
    // TODO: Should be prec.nonassoc (see https://github.com/tree-sitter/tree-sitter/issues/761)
    try_exp: $ => prec.right(seq(
      "try",
      $._exp_nest,
      optional($.catch),
      optional($.finally),
    )),
    ignore_exp: $ => seq("ignore", $._exp_nest),

    // TODO: Should be prec.nonassoc
    loop_exp: $ => prec.right(seq(
      "loop",
      $._exp_nest,
      optional(seq(
        "while",
        $._exp_nest,
      ))
    )),
    while_exp: $ => seq(
      "while",
      $._exp_nullary_object,
      $._exp_nest,
    ),
    for_exp: $ => seq(
      "for",
      "(",
      $._pat,
      "in",
      $._exp_object,
      ")",
      $._exp_nest,
    ),
    do_exp: $ => seq("do", $.block_exp),
    do_quest_exp: $ => seq("do", "?", $.block_exp),

    switch_exp: $ => seq(
      "switch",
      $._exp_nullary_object,
      "{",
      semi_sep($.case),
      "}",
    ),

    func_exp: $ => seq(
      optional("shared"),
      optional("composite"),
      optional("query"),
      "func",
      optional($.typ_params),
      $._pat_plain,
      optional($.typ_annot),
      $.func_body,
    ),

    func_body: $ => choice(
      seq("=", $._exp_object),
      $.block_exp,
    ),

    assign_exp_block: $ => mk_assign_exp($, "block"),
    assign_exp_object: $ => mk_assign_exp($, "object"),

    array_idx_exp_block: $ => mk_array_idx_exp($, "block"),
    array_idx_exp_object: $ => mk_array_idx_exp($, "object"),

    proj_exp_block: $ => mk_proj_exp($, "block"),
    proj_exp_object: $ => mk_proj_exp($, "object"),

    dot_exp_block: $ => mk_dot_exp($, "block"),
    dot_exp_object: $ => mk_dot_exp($, "object"),

    call_exp_block: $ => mk_call_exp($, "block"),
    call_exp_object: $ => mk_call_exp($, "object"),

    bang_exp_block: $ => mk_bang_exp($, "block"),
    bang_exp_object: $ => mk_bang_exp($, "object"),

    system_exp_block: $ => mk_system_exp($, "block"),
    system_exp_object: $ => mk_system_exp($, "object"),

    bin_exp_block: $ => mk_bin_exp($, "block"),
    bin_exp_object: $ => mk_bin_exp($, "object"),

    annot_exp_block: $ => mk_annot_exp($, "block"),
    annot_exp_object: $ => mk_annot_exp($, "object"),

    binassign_exp_block: $ => mk_binassign_exp($, "block"),
    binassign_exp_object: $ => mk_binassign_exp($, "object"),

    case: $ => seq(
      "case",
      $._pat_nullary,
      $._exp_nest,
    ),
    catch: $ => seq(
      "catch",
      $._pat_nullary,
      $._exp_nest,
    ),

    finally: $ => seq(
      "finally",
      $._exp_nest,
    ),

    inst: $ => seq(
      "<",
      optional("system"),
      comma_sep($._typ),
      ">",
    ),

    exp_field: $ => seq(
      optional("var"),
      $.identifier,
      optional($.typ_annot),
      optional(seq(
        "=",
        $._exp_object,
      ))
    ),

    parenthetical: $ => seq(
      "(",
      $._exp_post_object,
      "with",
      semi_sep($.exp_field),
      ")",
    ),

    // Types
    _typ_nullary: $ => choice(
      $.tup_typ,
      $.path_typ,
      $.array_typ,
      $.obj_typ,
      $.variant_typ,
    ),
    _typ_un: $ => choice(
      $._typ_nullary,
      $.quest_typ,
    ),
    _typ_pre: $ => choice(
      $._typ_un,
      $.prim_typ,
      $.async_typ,
      $.obj_sort_typ,
    ),
    _typ_no_bin: $ => choice(
      $._typ_pre,
      $.func_typ,
    ),
    _typ: $ => choice(
      $._typ_no_bin,
      $.and_typ,
      $.or_typ,
    ),
    and_typ: $ => prec.left(
      seq($._typ, "and", $._typ),
    ),
    or_typ: $ => prec.left(
      seq($._typ, "or", $._typ),
    ),
    tup_typ: $ => seq(
      "(",
      comma_sep($.typ_item),
      ")"
    ),
    path_typ: $ => seq(
      $.typ_path,
      optional(seq(
        "<",
        comma_sep($._typ),
        ">",
      )),
    ),
    array_typ: $ => seq(
      "[",
      optional("var"),
      $._typ,
      "]",
    ),
    obj_typ: $ => seq(
      "{",
      semi_sep($._typ_field),
      "}",
    ),
    variant_typ: $ => choice(
      seq("{", "#", "}"),
      seq(
        "{",
        semi_sep1($.typ_tag),
        "}",
      ),
    ),
    quest_typ: $ => seq("?", $._typ_un),
    prim_typ: $ => seq("prim", $.text_literal),
    async_typ: $ => seq(
      choice("async", "async*"),
      $._typ_pre,
    ),
    obj_sort_typ: $ => seq(
      choice("module", "actor", "object"),
      $.obj_typ,
    ),
    func_typ: $ => seq(
      optional("shared"),
      optional("composite"),
      optional("query"),
      optional($.typ_params),
      $._typ_un,
      "->",
      $._typ_no_bin,
    ),
    typ_item: $ => seq(
      optional(seq($.identifier, ':')),
      $._typ,
    ),
    typ_tag: $ => seq(
      "#",
      $.identifier,
      optional($.typ_annot),
    ),
    _typ_field: $ => choice(
      $.typ_tf,
      $.val_tf,
      $.func_tf,
    ),
    typ_tf: $ => seq(
      "type",
      $._type_identifier,
      optional($.typ_params),
      "=",
      $._typ,
    ),
    val_tf: $ => seq(
      optional("var"),
      $.identifier,
      ":",
      $._typ,
    ),
    func_tf: $ => seq(
      $.identifier,
      optional($.typ_params),
      $._typ_nullary,
      "=",
      $._typ,
    ),
    typ_params: $ => seq(
      "<",
      optional("system"),
      comma_sep($.typ_bind),
      ">",
    ),
    typ_bind: $ => seq(
      $._type_identifier,
      optional(seq(
        "<:",
        $._typ,
      )),
    ),

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
