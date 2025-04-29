use std::{fs};

use camino::Utf8Path;
use anyhow::{Context, Result};
use walkdir::WalkDir;

fn main() {
    copy_moc_files(
        Utf8Path::new("/Users/christoph.hegemann/work/motoko"),
        Utf8Path::new("/Users/christoph.hegemann/code/tree-sitter-motoko")
    ).unwrap()
}

fn copy_moc_files(moc_base: &Utf8Path, ts_motoko_base: &Utf8Path) -> Result<()> {
    let moc_test_fail = moc_base.join("test").join("fail");
    let ts_motoko_fail = ts_motoko_base.join("test").join("corpus").join("fail");

    for entry in WalkDir::new(&moc_test_fail) {
        let entry = entry?;
        let path = Utf8Path::from_path(entry.path()).unwrap();
        if !path.is_file() || path.extension() != Some("mo") {
            continue;
        }
        if path.file_name().unwrap().starts_with("verification") {
            continue;
        }
        if path.file_name().unwrap().starts_with("syntax") {
            continue;
        }
        let test_name = path.strip_prefix(&moc_test_fail).expect(&format!("Found test not nested under test/fail? {path}"));
        let content = fs::read_to_string(path)?;
        let test = mk_test(test_name.as_str(), &content);
        let out_path = ts_motoko_fail.join(test_name).with_extension("mo");
        fs::create_dir_all(out_path.parent().unwrap())?;
        fs::write(&out_path, test).context(format!("Failed to create test at: {out_path}"))?
    }
    return Ok(())
}


fn mk_test(name: &str, content: &str) -> String {
    format!("=========\n{name}\n=========\n\n{content}\n---\n")
}
