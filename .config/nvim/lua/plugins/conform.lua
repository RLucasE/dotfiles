return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = { "pint" },
      },
      -- Opcional: Personalizar cómo se busca el ejecutable
      formatters = {
        pint = {
          command = "Backend/example-app/vendor/bin/pint",
        },
      },
    },
  },
}
