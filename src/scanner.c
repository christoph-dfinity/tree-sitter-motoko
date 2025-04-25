#include "tree_sitter/parser.h"
#include "tree_sitter/alloc.h"
#include "tree_sitter/array.h"
#include <wctype.h>

enum TokenType {
  DUMMY
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
  return false;
}

void *tree_sitter_motoko_external_scanner_create() { return NULL; }
void tree_sitter_motoko_external_scanner_destroy(void *payload) {}
unsigned tree_sitter_motoko_external_scanner_serialize(void *payload, char *buffer) {
  return 0;
}
void tree_sitter_motoko_external_scanner_deserialize(void *payload, char *buffer, unsigned length) {}
