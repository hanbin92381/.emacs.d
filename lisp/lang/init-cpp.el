;;; init-cpp.el --- Initialize c configurations. -*- lexical-binding: t -*-

;;; Commentary:
;;
;; C/C++ configuration.
;;

;;; Code:

;; C/C++ Mode
(use-package cc-mode
  :ensure nil
  :mode ("\\.cxx\\'" . c++-mode)
  :hook (c-mode . (lambda ()
                    (setq comment-start "// "
                          comment-end "")))
  :custom
  (c-comment-prefix-regexp '((c-mode   . "//+!?\\|\\**")
                             (c++-mode . "//+!?\\|\\**")
                             (awk-mode . "#+")
                             (other    . "//+\\|\\**")))
  (c-doc-comment-style `((c-mode   . gtkdoc)
                         (c++-mode . ,(if (>= emacs-major-version 28) 'doxygen 'gtkdoc))))
  (c-basic-offset 4)
  (c-label-minimum-indentation 0))


(provide 'init-cpp)

;;; init-cpp.el ends here
