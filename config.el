(tool-bar-mode -1)
(menu-bar-mode -1)

(setq inhibit-startup-message t)

(global-subword-mode 1)

(setq display-time-24hr-format t)
(display-time-mode 1)

(setq make-backup-file nil)
(setq auto-save-default nil)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq ring-bell-function 'ignore)

(when window-system (global-prettify-symbols-mode t))

(when window-system (global-hl-line-mode t))

(setq scroll-conservatively 100)

(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

(global-set-key (kbd "<s-return>") 'ansi-term)

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(setq org-src-window-setup 'current-window)
(add-to-list 'org-structure-template-alist
	     '("el" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC"))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents . 10)))
  (setq dashboard-banner-logo-title "It's Time to Code, Exy!"))

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator (quote arrow))
  (spaceline-spacemacs-theme))

(use-package  diminish
  :ensure t
  :init
  (diminish 'hungry-delete-mode)
  (diminish 'beacon-mode)
  (diminish 'subword-mode)
  (diminish 'which-key-mode))

(setq ido-enable-flex-matching nil)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere t)
(ido-mode 1)

(use-package ido-vertical-mode
  :ensure t
  :init
  (ido-vertical-mode 1))
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind
  ("M-x" . smex))

(global-set-key (kbd "C-x b") 'ido-switch-buffer)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(use-package avy
  :ensure t
  :bind
  ("M-s" . avy-goto-char))

(defun config-visit ()
  (interactive)
  (find-file "~/.emacs.d/config.org"))
(global-set-key (kbd "C-c e") 'config-visit)

(defun config-reload ()
  (interactive)
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))
(global-set-key (kbd "C-c r") 'config-reload)

(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

(use-package sudo-edit
  :ensure t
  :bind ("s-e" . sudo-edit))

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-model))
