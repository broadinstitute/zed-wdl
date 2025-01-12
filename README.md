WDL extension for Zed
=====================

This extension provides support for the [Workflow Description Language (WDL)](https://openwdl.org/) 
in the [Zed](https://zed.dev) code editor. Currently supports WDL versions 1.0 and WDL 1.1

## Features

* Syntax highlighting (including bash syntax highlighting in command blocks)
* Automatic indentation
* Automatic closing of brackets
* Integration with WDL language server (install separately, and needs to be available in $PATH)

## Preview

![Screenshot](doc/screenshot.png)

## Related repositories

* [tree-sitter-wdl](https://github.com/broadinstitute/tree-sitter-wdl): Tree-sitter grammar for WDL
* [wdl-lsp](https://github.com/broadinstitute/wdl-ide/tree/master/server): WDL language server

## Roadmap

I am considering to use the [`sprocket analyzer`](https://github.com/stjude-rust-labs/sprocket) LSP server for WDL.
However, it currently only supports pull diagnostics, which is 
[not yet supported by Zed](https://github.com/zed-industries/zed/pull/19230).