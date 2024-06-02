; extends
; entry
(array (_) @entry.inner ","? @_end (#make-range! "entry.outer" @entry.inner @_end))
(object (_) @entry.inner ","? @_end (#make-range! "entry.outer" @entry.inner @_end))

; string
(string (["'" "\""] . (_) @_start (_)? @_end . ["'" "\""])(#make-range! "custom_quotation.inner" @_start @_end)) @custom_quotation.outer
(template_string ("`" . (_) @_start (_)? @_end . "`")(#make-range! "custom_quotation.inner" @_start @_end)) @custom_quotation.outer
