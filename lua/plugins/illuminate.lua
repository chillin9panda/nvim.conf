return {
  "RRethy/vim-illuminate",
  config = function()
    require("illuminate").configure({
      options = {
        delay = 200,
      },
    })
  end,
}
