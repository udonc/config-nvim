return {
    "keaising/im-select.nvim",
    event = { "InsertEnter", "InsertLeave", "CmdlineEnter", "CmdlineLeave" },
    opts = {
        -- ノーマルモードで使用する入力メソッド（英語）
        default_im_select = "com.apple.keylayout.ABC",
        -- macOS では macism を使用
        default_command = "macism",
    },
}
