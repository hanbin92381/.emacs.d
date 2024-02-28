;;; init-keybindings.el --- -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key (kbd "C-c '") 'comment-or-uncomment-region)

;; 注意设置在emacs中屏蔽win键的全局快捷键
(global-set-key (kbd "s-a") 'mark-whole-buffer) ; 对应Windows上面的Ctrl-a 全选
(global-set-key (kbd "s-c") 'kill-ring-save)    ; 对应Windows上面的Ctrl-c 复制
(global-set-key (kbd "s-s") 'save-buffer)       ; 对应Windows上面的Ctrl-s 保存
(global-set-key (kbd "s-v") 'yank)              ; 对应Windows上面的Ctrl-v 粘贴
(global-set-key (kbd "s-z") 'undo)              ; 对应Windows上面的Ctrl-z 撤销
(global-set-key (kbd "s-x") 'kill-region)       ; 对应Windows上面的Ctrl-x 剪切

;; 一些自定义函数
(defun next-ten-lines()
  "Move cursor to next 10 lines."
  (interactive)
  (next-line 10))

(defun previous-ten-lines()
  "Move cursor to previous 10 lines."
  (interactive)
  (previous-line 10))

;; User-defined function key bindings
(global-set-key (kbd "<f2>") 'open-init-file)

(global-set-key (kbd "M-n") 'next-ten-lines)
(global-set-key (kbd "M-p") 'previous-ten-lines)

(global-set-key (kbd "C-j") 'nil) ; 解绑"C-j"
(global-set-key (kbd "C-j C-k") 'kill-whole-line)


(provide 'init-keybindings)
;;; init-keybindings.el ends here
