;;; init-edit.el --- Initialize editing configurations.	-*- lexical-binding: t -*-

;;; Commentary:
;;
;; Editing configurations.
;;

;;; Code:

(require 'init-const)

;; Framework for mode-specific buffer indexes
;;(use-package imenu
;;  :ensure nil
;;  :bind (("C-." . imenu)))

;; Jump to things in Emacs tree-style
(use-package avy
  :bind (("C-c j" . avy-goto-char-timer)
	 ("C-c k" . avy-goto-line))
  :hook (after-init . avy-setup-default))

;; Kill text between the point and the character CHAR
(use-package avy-zap
  :bind (("M-z" . avy-zap-to-char-dwim)
         ("M-Z" . avy-zap-up-to-char-dwim)))

;; Jump to Chinese characters
(use-package ace-pinyin
  :diminish
  :hook (after-init . ace-pinyin-global-mode))

;; Drag stuff (lines, words, region, etc...) around
;; (use-package drag-stuff
;;   :diminish
;;   :commands drag-stuff-define-keys
;;   :hook (after-init . drag-stuff-global-mode)
;;   :config
;;   (add-to-list 'drag-stuff-except-modes 'org-mode)
;;   (drag-stuff-define-keys))

;; expand-region

;; ;; Multiple cursors
;; (use-package multiple-cursors
;;   :bind (("C-S-c C-S-c"   . mc/edit-lines)
;;          ("C->"           . mc/mark-next-like-this)
;;          ("C-<"           . mc/mark-previous-like-this)
;;          ("C-c C-<"       . mc/mark-all-like-this)
;;          ("C-M->"         . mc/skip-to-next-like-this)
;;          ("C-M-<"         . mc/skip-to-previous-like-this)
;;          ("s-<mouse-1>"   . mc/add-cursor-on-click)
;;          ("C-S-<mouse-1>" . mc/add-cursor-on-click)
;;          :map mc/keymap
;;          ("C-|" . mc/vertical-align-with-space)))

;; Hungry deletion
(use-package hungry-delete
  :diminish
  :hook (after-init . global-hungry-delete-mode)
  :init (setq hungry-delete-chars-to-skip " \t\f\v"
              hungry-delete-except-modes
              '(help-mode minibuffer-mode minibuffer-inactive-mode calc-mode)))

;; Move to the beginning/end of line or code
(use-package mwim
  :bind (([remap move-beginning-of-line] . mwim-beginning-of-code-or-line)
         ([remap move-end-of-line] . mwim-end-of-code-or-line)))

;; Goto last change
(use-package goto-chg
  :bind ("C-," . goto-last-change))

;; undo-tree
;; (use-package undo-tree
;;   :ensure t
;;   :init (global-undo-tree-mode)
;;   :after hydra
;;   :bind ("C-x C-h u" . hydra-undo-tree/body)
;;   :hydra (hydra-undo-tree (:hint nil)
;;   "
;;   _p_: undo  _n_: redo _s_: save _l_: load   "
;;   ("p"   undo-tree-undo)
;;   ("n"   undo-tree-redo)
;;   ("s"   undo-tree-save-history)
;;   ("l"   undo-tree-load-history)
;;   ("u"   undo-tree-visualize "visualize" :color blue)
;;   ("q"   nil "quit" :color blue)))

;; Rectangle
;; (use-package rect
;;   :ensure nil
;;   :bind (:map text-mode-map
;;          ("<C-return>" . rect-hydra/body)
;;          :map prog-mode-map
;;          ("<C-return>" . rect-hydra/body))
;;   :init
;;   (with-eval-after-load 'org
;;     (bind-key "<s-return>" #'rect-hydra/body org-mode-map))
;;   (with-eval-after-load 'wgrep
;;     (bind-key "<C-return>" #'rect-hydra/body wgrep-mode-map))
;;   (with-eval-after-load 'wdired
;;     (bind-key "<C-return>" #'rect-hydra/body wdired-mode-map))
;;   :pretty-hydra
;;   ((:title (pretty-hydra-title "Rectangle" 'material "border_all" :height 1.2 :v-adjust -0.225)
;;     :color amaranth :body-pre (rectangle-mark-mode) :post (deactivate-mark) :quit-key ("q" "C-g"))
;;    ("Move"
;;     (("h" backward-char "←")
;;      ("j" next-line "↓")
;;      ("k" previous-line "↑")
;;      ("l" forward-char "→"))
;;     "Action"
;;     (("w" copy-rectangle-as-kill "copy") ; C-x r M-w
;;      ("y" yank-rectangle "yank")         ; C-x r y
;;      ("t" string-rectangle "string")     ; C-x r t
;;      ("d" kill-rectangle "kill")         ; C-x r d
;;      ("c" clear-rectangle "clear")       ; C-x r c
;;      ("o" open-rectangle "open"))        ; C-x r o
;;     "Misc"
;;     (("N" rectangle-number-lines "number lines")        ; C-x r N
;;      ("e" rectangle-exchange-point-and-mark "exchange") ; C-x C-x
;;      ("u" undo "undo")
;;      ("r" (if (region-active-p)
;;               (deactivate-mark)
;;             (rectangle-mark-mode 1))
;;       "reset")))))

;; ;; Pass a URL to a WWW browser
;; (use-package browse-url
;;   :ensure nil
;;   :defines dired-mode-map
;;   :bind (("C-c C-z ." . browse-url-at-point)
;;          ("C-c C-z b" . browse-url-of-buffer)
;;          ("C-c C-z r" . browse-url-of-region)
;;          ("C-c C-z u" . browse-url)
;;          ("C-c C-z e" . browse-url-emacs)
;;          ("C-c C-z v" . browse-url-of-file))
;;   :init
;;   (with-eval-after-load 'dired
;;     (bind-key "C-c C-z f" #'browse-url-of-file dired-mode-map)))

;; ;; Click to browse URL or to send to e-mail address
;; (use-package goto-addr
;;   :ensure nil
;;   :hook ((text-mode . goto-address-mode)
;;          (prog-mode . goto-address-prog-mode)))

;; Windows-scroll commands
;; (use-package pager
;;   :bind (([remap scroll-up-command] . pager-page-down)
;;          ([remap scroll-down-command] . pager-page-up)
;;          ([next]   . pager-page-down)
;;          ([prior]  . pager-page-up)
;;          ([M-up]   . pager-row-up)
;;          ([M-kp-8] . pager-row-up)
;;          ([M-down] . pager-row-down)
;;          ([M-kp-2] . pager-row-down)))

;; Preview when `goto-char'
;; (use-package goto-char-preview
;;   :bind ([remap goto-char] . goto-char-preview))

;; Preview when `goto-line'
;; (use-package goto-line-preview
;;   :bind ([remap goto-line] . goto-line-preview))

;; Smartly select region, rectangle, multi cursors
;; (use-package smart-region
;;   :hook (after-init . smart-region-on))

;; Increase selected region by semantic units
;; (use-package expand-region
;;   :bind ("C-=" . er/expand-region))

;; Handling capitalized subwords in a nomenclature
;; (use-package subword
;;   :ensure nil
;;   :diminish
;;   :hook ((prog-mode . subword-mode)
;;          (minibuffer-setup . subword-mode)))


(provide 'init-edit)

;;; init-edit.el ends here
