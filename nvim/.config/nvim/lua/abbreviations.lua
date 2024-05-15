-- replaces the preceding word with a React component of that name
vim.cmd(
	"iab tsrc <Esc>bdiwitype Props = {};<cr><cr>export default function <C-o>p({}: Props) {<cr>return null<cr>}<Esc>?null<cr><Esc>"
)
vim.cmd("iab tbitd toBeInTheDocument()<Esc>")
-- jest boilerplate for a new component test file
vim.cmd(
	'iab tst import { render, screen } from "@/lib/testing-library/react";<cr><cr> import <C-r>=expand("%:t:r")<cr><Esc>byawea from "./<C-o>p";<cr><cr>it("", () => {})<Esc>F"i'
)
