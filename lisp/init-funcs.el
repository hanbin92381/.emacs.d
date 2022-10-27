;;; init-funcs.el --- Define functions.	-*- lexical-binding: t -*-

;;; Commentary:
;;
;; Define functions.
;;

;;; Code:

(require 'init-const)

;; Font
(defun font-installed-p (font-name)
  "Check if font with FONT-NAME is available."
  (find-font (font-spec :name font-name)))

;; File
(defun delete-this-file ()
  "Delete the current file, and kill the buffer."
  (interactive)
  (let ((name (buffer-name))
	(filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (when (yes-or-no-p (format "Really delete '%s' ?"
			       (file-name-nondirectory filename)))
      (delete-file filename)
      (kill-this-buffer))))

(defun rename-this-file (new-name)
  "Rename both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
	(filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (progn
      (when (file-exists-p filename)
	(rename-file filename new-name 1))
      (set-visited-file-name new-name)
      (rename-buffer new-name))))

;; UI

;;Misc
(defun icon-displayable-p ()
  "Return non-nil if icons are displayable."
  (and (or (display-graphic-p) (daemonp))
       (or (featurep 'all-the-icons)
           (require 'all-the-icons nil t))))


(provide 'init-funcs)
;;; init-funcs.el ends here
