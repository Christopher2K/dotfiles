local ok_m, rust_tools = pcall(require, "rust-tools")

if ok_m then rust_tools.setup({}) end
