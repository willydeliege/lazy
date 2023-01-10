return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  dependencies = {
    "https://gitlab.com/schrieveslaach/nvim-jdtls-bundles",
    build = "./install-bundles.py",
    ft = { "java" },
  },
}
