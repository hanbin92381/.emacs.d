;;; init-keybindings.el --- -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key (kbd "M-w") 'kill-region)
(global-set-key (kbd "C-w") 'kill-ring-save)
(global-set-key (kbd "C-c '") 'comment-or-uncomment-region)

;; 一些自定义函数
(defun next-ten-lines()
  "Move cursor to next 10 lines."
  (interactive)
  (next-line 10))

(defun previous-ten-lines()
  "Move cursor to previous 10 lines."
  (interactive)
  (previous-line 10))

(global-set-key (kbd "M-n") 'next-ten-lines)
(global-set-key (kbd "M-p") 'previous-ten-lines)

(global-set-key (kbd "C-j") 'nil) ; 解绑"C-j"
(global-set-key (kbd "C-j C-k") 'kill-whole-line)


(provide 'init-keybindings)
;;; init-keybindings.el ends here
