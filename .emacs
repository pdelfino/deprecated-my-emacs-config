;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(load (expand-file-name "~/.quicklisp/slime-helper.el"))

(setq inferior-lisp-program "sbcl")

(slime-setup '(slime-fancy slime-asdf slime-indentation slime-sbcl-exts slime-scratch))

(set-face-attribute 'default nil :height 150)

(global-set-key (kbd "C-c l") 'org-store-link) ; org-mode stuff
(global-set-key (kbd "C-c a") 'org-agenda)     ; org-mode stuff
(global-set-key (kbd "C-c c") 'org-capture)    ; org-mode stuff

;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; (require 'rainbow-blocks)

(setq show-paren-delay 0)
(show-paren-mode t) ;; enable show paren mode

;; Configure Paredit
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode) ;isso é para CL
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode) ;ativado via M-x
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'slime-repl-mode-hook 'enable-paredit-mode) ;ativar o paredit no slime    
(add-to-list 'load-path  "~/.emacs.d/elpa/slime-20210512.1220")

(require 'slime-autoloads)

(setq show-paren-style 'expression) ;; highlight whole expression

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(ido-mode (quote both) nil (ido))
 '(package-selected-packages
   (quote
    (org-drill visual-fill-column visual-fill org-bullets dracula-theme exwm golden-ratio hydra disable-mouse helm magit htmlize company helm-slime rainbow-delimiters transpose-frame paredit wakatime-mode)))
 '(safe-local-variable-values
   (quote
    ((eval cl-flet
           ((enhance-imenu-lisp
             (&rest keywords)
             (dolist
                 (keyword keywords)
               (add-to-list
                (quote lisp-imenu-generic-expression)
                (list
                 (purecopy
                  (concat
                   (capitalize keyword)
                   (if
                       (string=
                        (substring-no-properties keyword -1)
                        "s")
                       "es" "s")))
                 (purecopy
                  (concat "^\\s-*("
                          (regexp-opt
                           (list
                            (concat "define-" keyword))
                           t)
                          "\\s-+\\(" lisp-mode-symbol-regexp "\\)"))
                 2)))))
           (enhance-imenu-lisp "bookmarklet-command" "class" "command" "ffi-method" "function" "mode" "parenscript" "user-class"))
     (Syntax . ANSI-Common-Lisp)
     (Package . FSet)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Gain space, suggestions from Susam on "Getting started with Emacs"

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)

;; (load-theme 'wombat)

;; Use spaces, not tabs, for indentation.

(setq-default indent-tabs-mode nil)

;; Configure Rainbow Delimiters.

(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'ielm-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-interaction-mode-hook 'rainbow-delimiters-mode)
(add-hook 'slime-repl-mode-hook 'rainbow-delimiters-mode)

(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode lisp-mode
                                                     clojure-mode    scheme-mode
                                                     haskell-mode    ruby-mode
                                                     rspec-mode      python-mode
                                                     c-mode          c++-mode
                                                     objc-mode       latex-mode
                                                     plain-tex-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))                   

(put 'upcase-region 'disabled nil)

;; Helm

(global-set-key (kbd "M-x") 'helm-M-x)

(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x

;; ParEdit tinkering

(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "C->") 'paredit-forward-slurp-sexp)
     (define-key paredit-mode-map (kbd "C-<") 'paredit-forward-barf-sexp)
     (define-key paredit-mode-map (kbd "C-M-<") 'paredit-backward-slurp-sexp)
     (define-key paredit-mode-map (kbd "C-M->") 'paredit-backward-barf-sexp)
     (define-key paredit-mode-map (kbd "<C-right>") nil)
     (define-key paredit-mode-map (kbd "<C-left>") nil)))

(defun reverse-transpose-sexps (arg)
  (interactive "*p")
  (transpose-sexps (- arg))
  ;; when transpose-sexps can no longer transpose, it throws an error and code
  ;; below this line won't be executed. So, we don't have to worry about side
  ;; effects of backward-sexp and forward-sexp.
  (backward-sexp (1+ arg))
  (forward-sexp 1))

(global-set-key (kbd "C-M-y") 'reverse-tranpose-sexps)

;; Flyspell

(add-hook 'git-commit-setup-hook 'git-commit-turn-on-flyspell)

;; Mouse hacking -> enforce a keyboard driven experience

(mouse-wheel-mode 0)

(global-disable-mouse-mode)

;; Disable arrow keys to enforce C-n, C-p, C-f and C-b use

(global-unset-key (kbd "<left>") )
(global-unset-key (kbd "<right>") )
(global-unset-key (kbd "<up>") )
(global-unset-key (kbd "<down>") )

;; Apropos can sort results by relevancy. Not sure if Helm already does something

(setq apropos-sort-by-scores t)

;; Inserting wakatime in emacs

(global-wakatime-mode)
(setq wakatime-api-key "37bc2977-bd5e-4794-983d-c88624ec6b32")

;; John Mercouris centered point mode
;; Homepage: https://github.com/jmercouris/emacs-centered-point

(define-minor-mode centered-point-mode
  "Alaways center the cursor in the middle of the screen."
  :lighter "..."
  (cond (centered-point-mode (add-hook 'post-command-hook 'line-change))
	(t (remove-hook 'post-command-hook 'line-change))))

(defun line-change ()
  (when (eq (get-buffer-window)
            (selected-window))
    (recenter)))

(provide 'centeredpoint)

(centered-point-mode t)

;; Ido-mode everywhere

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Auto-fill mode active on every major modes

(setq-default auto-fill-function 'do-auto-fill)

;; Refresh the current buffer

(global-set-key (kbd "C-x C-M-r") 'revert-buffer)

;; Keybinding to jump to bookmarks

(global-set-key (kbd "C-x C-M-b") 'bookmark-jump)

;; Keybinding change Dabrev Expansion

(global-set-key (kbd "M-]") 'dabbrev-expand)

;; Refresh without asking for confirmation

(defun my-revert-buffer-noconfirm ()
  "Call `revert-buffer' with the NOCONFIRM argument set."
  (interactive)
  (revert-buffer nil t))

;; Make paste-and-replace work

(delete-selection-mode 1)

;; Make `C-x 2` create a better fit concerning windows space use

;; (defun my-split-window-below (&optional arg)
;;   "Split the current window 70/30 rather than 50/50.
;; A single-digit prefix argument gives the top window arg*10%."
;;   (interactive "P")
;;   (let ((proportion (* (or arg 7) 0.1)))
;;     (split-window-below (round (* proportion (window-height))))))

;; (global-set-key (kbd "C-x 2") 'my-split-window-below)

;; Use company for auto-complete

(add-hook 'after-init-hook 'global-company-mode)

;; Adding dracula theme to emacs

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)

;; Launch emacs as full screen

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Show org-mode hyperlink as plain text

(defun org-toggle-link-display ()
  "Toggle the literal or descriptive display of links."
  (interactive)
  (if org-descriptive-links
      (progn (org-remove-from-invisibility-spec '(org-link))
             (org-restart-font-lock)
             (setq org-descriptive-links nil))
    (progn (add-to-invisibility-spec '(org-link))
           (org-restart-font-lock)
           (setq org-descriptive-links t))))

;; Keybinding creation for org-toggle-link-display

(global-set-key (kbd "C-c C-x C-M-l") 'org-toggle-link-display)

;; Emacs development help to run Nyxt via Guix 
(load "/home/pedro/common-lisp/nyxt/build-scripts/nyxt-guix.el"
      :noerror)

;; insert EXWM configuration

;; (use-package exwm
;;              :ensure t
;;              :config
;;              (require 'exwm-config)
;;              (exwm-config-default))

;; (require 'exwm)
;; (require 'exwm-config)
;; (exwm-config-default)

;;teste

;; org-mode tinkering

;; (use-package org
;;              :hook (org-mode . dw/org-mode-setup)
;;              :config
;;              (setq org-ellipsis " ▾"
;;                    org-hide-emphasis-markers t))

;; (use-package org-bullets
;;   :after org
;;   :hook (org-mode . org-bullets-mode)
;;   :custom
;;   (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

;; ;; Replace list hyphen with dot
;; (font-lock-add-keywords 'org-mode
;;                         '(("^ *\\([-]\\) "
;;                            (0 (prog1 () (compose-region
;;                                          (match-beginning 1)
;;                                          (match-end 1) "•"))))))

;; (with-eval-after-load 'org-faces (dolist (face '((org-level-1 . 1.2)
;;                                                  (org-level-2 . 1.1)
;;                                                  (org-level-3 . 1.05)
;;                                                  (org-level-4 . 1.0)
;;                                                  (org-level-5 . 1.1)
;;                                                  (org-level-6 . 1.1)
;;                                                  (org-level-7 . 1.1)
;;                                                  (org-level-8 . 1.1)))
;;                                    (set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face))))

