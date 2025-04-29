=========
type-error-imports.mo
=========

import _ "empty-module";
import {} "empty-module";

import (_, _) = "empty-module";

---

(source_file
  (import
    (wild_pat)
    (text_literal))
  (import
    (obj_pat)
    (text_literal))
  (import
    (tup_pat
      (wild_pat)
      (wild_pat))
    (text_literal)))
