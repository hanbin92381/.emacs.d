;;; init-packages.el --- Packages, archives and more	 -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

;; 设置源
(require 'package)
;;(setq package-archives '(("gnu"    . "http://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")
;;			 ("nongnu" . "http://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/nongnu/")
;;                         ("melpa"  . "http://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/")))
(setq package-archives '(("melpa"  . "https://melpa.org/packages/")
 			 ("gnu"    . "https://elpa.gnu.org/packages/")
 			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

;; Initialize packages
(unless (bound-and-true-p package--initialized) ; To avoid warnings in 27
  (setq package-enable-at-startup nil)          ; To prevent initializing twice
  (package-initialize))  ;; whether conflicts with :defer?

;; 防止反复调用 package-refresh-contents 会影响加载速度
(unless package-archive-contents
  (package-refresh-contents))

;; Setup use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Should set before loading `use-package'
(eval-and-compile
  (setq use-package-always-ensure t)
  (setq use-package-always-defer t)
  (setq use-package-expand-minimally t)
  (setq use-package-enable-imenu-support t))

(require 'use-package)


(provide 'init-packages)

;;; init-packages.el ends here
