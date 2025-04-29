=========
issue-875.mo
=========

let t = async t;

---

(source_file
  (let_dec
    (var_pat
      (identifier))
    (async_exp
      (var_exp
        (identifier)))))
