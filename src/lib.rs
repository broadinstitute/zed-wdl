use zed::LanguageServerId;
use zed_extension_api::{self as zed, Result};

struct WDLExtension;

impl zed::Extension for WDLExtension {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &LanguageServerId,
        worktree: &zed::Worktree,
    ) -> Result<zed::Command> {
        let Some(lsp_exe) = worktree.which("wdl-lsp") else {
            return Err("Unable to find `wdl-lsp` binary. Make sure the PATH variable contains the directory where the wdl-lsp binary is located.".to_string());
        };
        
        Ok(zed::Command {
            command: lsp_exe.to_string(),
            args: vec![],
            env: Default::default(),
        })
    }
}

zed::register_extension!(WDLExtension);