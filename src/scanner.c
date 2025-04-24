#include "tree_sitter/parser.h"
#include "tree_sitter/alloc.h"
#include "tree_sitter/array.h"
#include <wctype.h>

enum TokenType {
  TEXT_LITERAL,
};

static bool eat(TSLexer *lexer, char c) {
  if (lexer->lookahead == c) {
    lexer->advance(lexer, false);
    return true;
  } else {
    return false;
  }
}

static void advance(TSLexer *lexer) {
  lexer->advance(lexer, false);
  return;
}

static void skip(TSLexer *lexer) {
  lexer->advance(lexer, true);
  return;
}

bool tree_sitter_motoko_external_scanner_scan(void *payload, TSLexer *lexer, const bool *valid_symbols) {
  while (iswspace(lexer->lookahead)) {
    skip(lexer);
  }

  if (valid_symbols[TEXT_LITERAL] && eat(lexer, '"')) {
    lexer->result_symbol = TEXT_LITERAL;
    while (!lexer->eof(lexer) && lexer->lookahead != '"') {
      advance(lexer);
    }
    eat(lexer, '"');
    return true;
  }
  return false;
}

// If we need to allocate/deallocate state, we do it in these functions.
void *tree_sitter_motoko_external_scanner_create() { return NULL; }
void tree_sitter_motoko_external_scanner_destroy(void *payload) {}

// If we have state, we should load and save it in these functions.
unsigned tree_sitter_motoko_external_scanner_serialize(void *payload, char *buffer) {
  return 0;
}
void tree_sitter_motoko_external_scanner_deserialize(void *payload, char *buffer, unsigned length) {}
