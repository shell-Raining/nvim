return {
  filetypes = { "python" },
  single_file_support = true,
  cmd = { "pyright-langserver", "--stdio" },
  ---@diagnostic disable-next-line: deprecated
  handlers = {
    -- If you want to disable pyright's diagnostic prompt, open the code below
    -- ["textDocument/publishDiagnostics"] = function(...) end,
    -- If you want to disable pyright from diagnosing unused parameters, open the function below
  },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off", -- off, basic, strict
        useLibraryCodeForTypes = true,
        autoImportCompletions = true,
        diagnosticMode = "workspace",
        -- https://github.com/microsoft/pyright/blob/main/docs/configuration.md#type-check-diagnostics-settings
        diagnosticSeverityOverrides = {
          strictListInference = true,
          strictDictionaryInference = true,
          strictSetInference = true,
          reportUnusedImport = "warning",
          reportUnusedClass = "warning",
          reportUnusedFunction = "warning",
          reportUnusedVariable = "warning",
          reportUnusedCoroutine = "warning",
          reportDuplicateImport = "warning",
          reportPrivateUsage = "warning",
          reportUnusedExpression = "warning",
          reportConstantRedefinition = "error",
          reportIncompatibleMethodOverride = "error",
          reportUndefinedVariable = "error",
          reportAssertAlwaysTrue = "error",
        },
      }
    }
  },
}
