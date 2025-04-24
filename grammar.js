/**
 * @file Motoko grammar for tree-sitter
 * @author Christoph Hegemann <christoph.hegemann@dfinity.org>
 * @license MIT
 */

/// <reference types="tree-sitter-cli/dsl" />
// @ts-check

module.exports = grammar({
  name: "motoko",
  extras: ($) => [/\s+/, $.line_comment, $.doc_comment],

  rules: {
    source_file: $ => "hello",
    line_comment: ($) => seq("//", /[^\n]*/),
    doc_comment: ($) => seq("///", /[^\n]*/),
  }
});
