=========
pkg/unused2.mo
=========

import _Unused1 "mo:pkg/unused3"; // don't report package imports usage warning
import _Unused2 "unused4"; // do report relative imports usage warning

module {

  // a private, unused definition
  let unused2 = 1;

}

---

(source_file
  (import
    (var_pat
      (identifier))
    (text_literal))
  (line_comment)
  (import
    (var_pat
      (identifier))
    (text_literal))
  (line_comment)
  (obj_dec
    (obj_sort)
    (obj_body
      (line_comment)
      (dec_field
        (let_dec
          (var_pat
            (identifier))
          (lit_exp
            (int_literal)))))))
