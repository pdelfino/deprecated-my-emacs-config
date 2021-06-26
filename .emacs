
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
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;(require 'rainbow-blocks)

(setq show-paren-delay 0)
(show-paren-mode t) ;; enable show paren mode

; Configure Paredit
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
 '(package-selected-packages
   (quote
    (helm magit htmlize company helm-slime rainbow-delimiters transpose-frame paredit wakatime-mode ##)))
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

;;;;;;;;;;;;;;;;;;;;

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
(load-theme 'wombat)

;; Use spaces, not tabs, for indentation.
(setq-default indent-tabs-mode nil)


; Configure Rainbow Delimiters.
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

;;;;;;;;;;;;;;;;; helm

(global-set-key (kbd "M-x") 'helm-M-x)

(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
