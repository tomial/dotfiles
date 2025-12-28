;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Aaron"
      user-mail-address "b1250284002@hotmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Ioskeley Mono" :size 16 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font" :size 16)
      doom-symbol-font (font-spec :family "Monocode" :size 16))
;; (setq doom-modeline-height 0.9)
(set-face-attribute 'mode-line nil :height 100)
(set-face-attribute 'mode-line-inactive nil :height 100)

;; disable mac's huge title bar
(add-hook 'doom-after-init-hook (lambda () (tool-bar-mode 1) (tool-bar-mode 0)))
;; disable line number in treemacs
(add-hook 'treemacs-mode-hook (lambda() (display-line-numbers-mode -1)))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'catppuccin)
(setq catppuccin-flavor 'mocha) ;; catppuccin theme: 'frappe, 'latte, 'macchiato, or 'mocha

;; (use-package! tree-sitter
;;   :hook (prog-mode . turn-on-tree-sitter-mode)
;;   :hook (tree-sitter-after-on . tree-sitter-hl-mode)
;;   :config
;;   (require 'tree-sitter-langs)
;;   ;; This makes every node a link to a section of code
;;   (setq tree-sitter-debug-jump-buttons t
;;         ;; and this highlights the entire sub tree in your code
;;         tree-sitter-debug-highlight-jump-region t))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; set init frame size
(setq initial-frame-alist '((top . 75) (left . 150) (width . 125) (height . 38)))
;; (setq lsp-auto-guess-root nil)

;; (after! projectile (setq projectile-project-root-files-bottom-up
;;                          (remove ".git" projectile-project-root-files-bottom-up)))
                                        ;(setq projectile-project-search-path '("~/Programming/ruby/project"))
(setq projectile-auto-discover nil)
(setq projectile-track-known-projects-automatically nil)
(setq projectile-ignored-projects '("~/"))

(setq-default tab-width 2)

(add-hook 'go-mode-hook
          (lambda ()
            (setq tab-width 4)))

(add-hook 'rust-mode-hook
          (lambda ()
            (setq tab-width 4)
            (setq indent-tabs-mode nil)
            (setq rust-indent-offset 4)
            (setq rustic-indent-offset 4)))

(add-hook 'c-mode-common-hook
          (lambda ()
            (setq tab-width 4)
            (setq c-basic-offset 4)))

(after! web-mode
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2))

;; format on save modes
;; (setq +format-on-save-enabled-modes '(rustic-mode))

(defun set-bigger-spacing ()
  (setq-default line-spacing 0.2))
(add-hook 'text-mode-hook 'set-bigger-spacing)
(add-hook 'prog-mode-hook 'set-bigger-spacing)

(setq +treemacs-git-mode 'deferred)
(setq evil-snipe-scope 'whole-buffer)

(after! corfu
  (map! :map corfu-map
        :i "<tab>" #'corfu-insert
        :i "TAB" #'corfu-insert))

(map! :i "TAB" #'tab-to-tab-stop)

;; [python LSP]
;; use ruff as formatter
(after! python
  (set-formatter! 'ruff '("ruff" "format" "-") :modes '(python-mode python-ts-mode)))
;; eglot调高ty优先级
(after! python
  (set-eglot-client! '(python-mode python-ts-mode) '("ty" "server")))
