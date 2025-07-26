return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      stages = "fade_in_slide_out",
      timeout = 3000,
      render = "compact",
      top_down = false,
    })
  end
}
