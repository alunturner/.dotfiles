; extends
; entry => e represents an item in anything that is list like
; array
(array ((_) @_start @custom_entry.inner . ","? @_end)(#make-range! "custom_entry.outer" @_start @_end))
; object
((object (pair key: (_) value: (_)) @_start @custom_entry.inner . ","? @_end)(#make-range! "custom_entry.outer" @_start @_end))

; quotations => q represents anything wrapped in " or ' or `
(string (["'" "\""] . (_) @_start (_)? @_end . ["'" "\""])(#make-range! "custom_quotation.inner" @_start @_end)) @custom_quotation.outer
(template_string ("`" . (_) @_start (_)? @_end . "`")(#make-range! "custom_quotation.inner" @_start @_end)) @custom_quotation.outer
