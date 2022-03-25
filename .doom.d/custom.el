;;; custom.el ---                                    -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Aaron

;; Author: Aaron <b1250284002@hotmail.com>
;; Keywords:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(spinner gnu-elpa-keyring-update))
 '(safe-local-variable-values '((encoding . utf-8)))
  (setq default-text-properties '(line-spacing 0.25 line-height 1.3))

  (defun set-bigger-spacing ()
  (setq-local default-text-properties '(line-spacing 0.25 line-height 1.3)))
  (add-hook 'text-mode-hook 'set-bigger-spacing)
  (add-hook 'prog-mode-hook 'set-bigger-spacing)

)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
