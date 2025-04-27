default:
    watchexec -w grammar.js -w test/ just test

test:
    tree-sitter generate
    tree-sitter test

accept:
    tree-sitter generate
    tree-sitter test --update
