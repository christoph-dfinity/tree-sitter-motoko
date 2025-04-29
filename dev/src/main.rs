use std::{fs};

use camino::Utf8Path;
use anyhow::{Context, Result};
use walkdir::WalkDir;

/// Tests for parse errors not labeled as syntax-*
const TEST_FAIL_EXCLUDES: [&str; 15] = [
    "par-bad-asyncstar.mo",
    "obj-empty-with.mo",
    "lexer-offset-1504.mo",
    "multiline-text-line-number.mo",
    "syntax1.mo",
    "syntax2.mo",
    "syntax3.mo",
    "syntax3.mo",
    "syntax4.mo",
    "syntax5.mo",
    "syntax6.mo",
    "syntax7.mo",
    "syntax8.mo",
    "verification-asserts.mo",
    "verification-implies.mo",
];

fn main() {
    copy_test_cases(
        Utf8Path::new("/Users/christoph.hegemann/work/motoko/test/fail"),
        Utf8Path::new("/Users/christoph.hegemann/code/tree-sitter-motoko"),
        "fail",
        &TEST_FAIL_EXCLUDES
    ).unwrap();

    copy_test_cases(
        Utf8Path::new("/Users/christoph.hegemann/work/new-motoko-base/src"),
        Utf8Path::new("/Users/christoph.hegemann/code/tree-sitter-motoko"),
        "new-base-src",
        &[],
    ).unwrap();

    copy_test_cases(
        Utf8Path::new("/Users/christoph.hegemann/work/new-motoko-base/test"),
        Utf8Path::new("/Users/christoph.hegemann/code/tree-sitter-motoko"),
        "new-base-test",
        &[],
    ).unwrap();

    copy_test_cases(
        Utf8Path::new("/Users/christoph.hegemann/work/new-motoko-base/bench"),
        Utf8Path::new("/Users/christoph.hegemann/code/tree-sitter-motoko"),
        "new-base-bench",
        &[],
    ).unwrap();
}

fn copy_test_cases(mo_base: &Utf8Path, ts_base: &Utf8Path, prefix: &str, excludes: &[&str]) -> Result<()> {
    let test_dir = ts_base.join("test").join("corpus").join(prefix);
    for entry in WalkDir::new(&mo_base) {
        let entry = entry?;
        let path = Utf8Path::from_path(entry.path()).unwrap();
        if !path.is_file() || path.extension() != Some("mo") {
            continue;
        }
        let file_name = path.file_name().unwrap();
        // if file_name.starts_with("verification") {
        //     continue;
        // }
        // if file_name.starts_with("syntax") {
        //     continue;
        // }
        if excludes.contains(&file_name) {
            continue;
        }
        let test_name = path.strip_prefix(&mo_base).unwrap();
        let content = fs::read_to_string(path)?;
        let test = mk_test(test_name.as_str(), &content);
        let out_path = test_dir.join(test_name).with_extension("mo");
        fs::create_dir_all(out_path.parent().unwrap())?;
        fs::write(&out_path, test).context(format!("Failed to create test at: {out_path}"))?
    }
    return Ok(())
}



fn mk_test(name: &str, content: &str) -> String {
    format!("=========\n{name}\n=========\n\n{content}\n---\n")
}
