# .emacs.d
自用Emacs配置，参考[Centaur Emacs](https://github.com/seagle0128/.emacs.d) 和[condy0919/.emacs.d](https://github.com/condy0919/.emacs.d.git)。
配置未完全，仅供参考，还在学习和完善😀。

# 可能需要的依赖
- `ripgrep(rg)` 更快的 `grep`，可在 `projectile` 中使用
- `fd` 更现代的 `find`， 可在 `projectile` 中使用
- `pandoc` 文本转换工具，`markdown-mode` 渲染需要
- `git` `gcc` 等

# 好用的插件
## minibuffer增强
- `marginalia` `vertico` `consult`，配合 `orderless` 使用
- `embark` （待配置
- `which-key` 快捷键命令提示
## 文本编辑
- `avy` 任意位置光标跳转
- `mwim` 智能行首/行尾光标跳转
- `undo-tree` 撤销操作优化（待配置
- `drag-stuff` （待配置
## 其他
- `ace-window` 窗口管理
- `hydra` 快捷键组织与提示

# prog-mode 
## 通用开发配置
- `company` 代码补全
- `flycheck` 语法检查
- `lsp-mode` 代码分析
- `dap-mode` 代码调试（待配置
- `projectile` 项目管理
- `magit` 版本管理（待配置
- `treemacs` 树形目录显示，工作区管理
## cc-mode
后端默认使用`clangd`，一般发行版可能会带
## python-mode
- `pyvenv` 管理虚拟环境
- `lsp-pyright` lsp后端
## rust-mode

> 无关记录: dwm ranger lazygit rime
