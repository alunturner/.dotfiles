; extends
; entry
(array (_) @entry.inner ","? @_end (#make-range! "entry.outer" @entry.inner @_end))
(object (_) @entry.inner ","? @_end (#make-range! "entry.outer" @entry.inner @_end))

; string
(string (["'" "\""] _* @custom_quotation.inner ["'" "\""])) @custom_quotation.outer
(template_string "`" _* @custom_quotation.inner "`") @custom_quotation.outer
