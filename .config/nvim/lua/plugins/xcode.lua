return {{
    "nvim-telescope/telescope.nvim",
    lazy=true
},{
  "wojciech-kulik/xcodebuild.nvim",
    lazy=true,
    cmd = {"XcodebuildSetup",
"XcodebuildPicker",
"XcodebuildBuild",
"XcodebuildCleanBuild",
"XcodebuildBuildRun",
"XcodebuildBuildForTesting",
"XcodebuildRun",
"XcodebuildCancel",
"XcodebuildCleanDerivedData",
"XcodebuildToggleLogs",
"XcodebuildOpenLogs",
"XcodebuildCloseLogs",
"XcodebuildOpenInXcode",
"XcodebuildQuickfixLine",
"XcodebuildCodeActions"},
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("xcodebuild").setup({ 
      code_coverage = {
        enabled = true,
      },
    })
 
  end,
}
}
