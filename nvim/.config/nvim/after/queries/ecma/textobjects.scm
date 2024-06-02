; extends
; entry => e represents anything that is list like, array item, object item, argument item, parameter item
(array (_) @entry.inner ","? @_end (#make-range! "entry.outer" @entry.inner @_end))
(object (_) @entry.inner ","? @_end (#make-range! "entry.outer" @entry.inner @_end))

; quotations => q represents anything wrapped in " or ' or `
(string (["'" "\""] . (_) @_start (_)? @_end . ["'" "\""])(#make-range! "custom_quotation.inner" @_start @_end)) @custom_quotation.outer
(template_string ("`" . (_) @_start (_)? @_end . "`")(#make-range! "custom_quotation.inner" @_start @_end)) @custom_quotation.outer
