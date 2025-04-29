default:
    watchexec -w grammar.js -w test/ just test

play:
    tree-sitter generate && tree-sitter build --wasm && tree-sitter playground

test:
    tree-sitter generate
    tree-sitter test

test-generate:
    rm -rf test/corpus/generated
    cd dev && cargo run
    tree-sitter generate
    tree-sitter test --update
    tree-sitter test

accept:
    tree-sitter generate
    tree-sitter test --update
