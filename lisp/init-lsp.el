;;; init-lsp.el --- Initialize LSP configurations.	-*- lexical-binding: t -*-

;;; Commentary:
;;
;; Language Server Protocol (LSP) configurations.
;;

;;; Code:


;; lsp-mode
(use-package lsp-mode
  :hook (prog-mode . (lambda ()
		       (unless (derived-mode-p 'emacs-lisp-mode 'lisp-mode 'makefile-mode)
			 (lsp-deferred))))
  :bind (:map lsp-mode-map
         ("C-c f" . lsp-format-region)
         ("C-c d" . lsp-describe-thing-at-point)
         ("C-c a" . lsp-execute-code-action)
         ("C-c r" . lsp-rename))
  :config
  (with-no-warnings
    (lsp-enable-which-key-integration t))
  :custom
  (lsp-keymap-prefix "C-c l")
  (lsp-enable-links nil)                    ;; no clickable links
  (lsp-enable-folding nil)                  ;; use `hideshow' instead
  (lsp-enable-snippet nil)                  ;; no snippets, it requires `yasnippet'
  (lsp-enable-file-watchers nil)            ;; performance matters
  (lsp-enable-text-document-color nil)      ;; as above
  (lsp-enable-symbol-highlighting nil)      ;; as above
  (lsp-enable-on-type-formatting nil)       ;; as above
  (lsp-enable-indentation nil)              ;; don't change my code without my permission
  (lsp-semantic-tokens-apply-modifiers nil) ;; don't override token faces
  (lsp-headerline-breadcrumb-enable t)    ;; keep headline clean
  (lsp-modeline-code-actions-enable nil)    ;; keep modeline clean
  (lsp-modeline-diagnostics-enable nil)     ;; as above
  (lsp-log-io nil)                          ;; debug only
  (lsp-auto-guess-root t)                   ;; Yes, I'm using projectile
  (lsp-keep-workspace-alive nil)            ;; auto kill lsp server
  (lsp-eldoc-enable-hover nil))             ;; disable eldoc hover


(use-package lsp-treemacs
  :after (treemacs lsp))

(provide 'init-lsp)

;;; init-lsp.el ends here
