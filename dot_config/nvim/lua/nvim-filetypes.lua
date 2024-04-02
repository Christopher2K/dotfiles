local filetypes = {}

function filetypes.init()
  vim.filetype.add({
    extension = {
      mdx = 'mdx'
    }
  })
end

return filetypes
