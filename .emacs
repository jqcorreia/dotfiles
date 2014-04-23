(setq inhibit-startup-screen t)
(setq make-backup-files nil) 

(add-to-list 'default-frame-alist '(font . "Inconsolata-11"))

(add-to-list 'load-path "~/.emacs.d/")

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; (global-linum-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)

(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:setup)

(add-hook 'after-init-hook 'my-after-init-hook)

(require 'ido)
(ido-mode t)

(defun my-after-init-hook ()
  (require 'color-theme-solarized)
  (color-theme-solarized-dark)
  ;; D Support 
  (require 'ac-dcd)
  (add-to-list 'ac-modes 'd-mode)
  (defun ac-d-mode-setup ()
    (setq ac-sources (append '(ac-source-dcd) ac-sources))
    (global-auto-complete-mode t))
  (add-hook 'd-mode-hook 'ac-d-mode-setup)

  (add-hook 'd-mode-hook 'flycheck-dmd-dub-set-include-path)
 )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("33c5a452a4095f7e4f6746b66f322ef6da0e770b76c0ed98a438e76c497040bb" "e26780280b5248eb9b2d02a237d9941956fc94972443b0f7aeec12b5c15db9f3" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-set-key [67108896] (quote completion-at-point))
(put 'upcase-region 'disabled nil)

(setq-default c-basic-offset 4)
(show-paren-mode 1)

;; Keybindings for move-text
(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)

(global-set-key (kbd "C-SPC") 'auto-complete)
; (load (expand-file-name "~/.emacs.d/cedet.el"))

(add-hook 'c-mode-common-hook '(lambda ()
  (local-set-key (kbd "RET") 'newline-and-indent)))

(add-hook 'python-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'newline-and-indent)))

(add-hook 'lisp-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'newline-and-indent)))

(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))

(global-set-key (kbd "C-/") 'comment-or-uncomment-region-or-line)


(provide '.emacs)
;;; .emacs ends here


