;; search engine

(defvar *my-search-engines*
  (list
   '("google" "https://www.google.com/search?q=~a" "https://www.google.com/")
   '("wiki" "https://en.wikipedia.org/w/index.php?search=~a" "https://en.wikipedia.org/")))

(define-configuration buffer
  ((search-engines (append (mapcar (lambda (engine) (apply 'make-search-engine engine))
                                   *my-search-engines*)
                           %slot-default%))))

;; keybindings: small emacs experience in CUA (default mode) of Nyxt

(define-configuration buffer
  ((override-map (let ((map (make-keymap "override-map")))
                   (define-key map
                      "C-space" 'nothing
                      "M-x" 'execute-command
                      "C-n" 'nyxt/web-mode:scroll-down
                      "C-p" 'nyxt/web-mode:scroll-up
                      "C-f" 'nyxt/web-mode:scroll-right
                      "C-b" 'nyxt/web-mode:scroll-left
                      "C-g" 'query-selection-in-search-engine
                      "M-s->" 'nyxt/web-mode:scroll-to-bottom
                      "M-s-<" 'nyxt/web-mode:scroll-to-top
                      "C-s" 'nyxt/web-mode:search-buffer
                      "C-x C-c" 'quit
                      "C-S" 'nyxt/web-mode:search-buffers
                      "C-x C-s" 'editor-write-file
                      ;"M-w" 'nyxt/web-mode:copy
                      ;"C-y" 'nyxt/web-mode:paste
                      ;"C-Y" 'nyxt/web-mode:paste-from-clipboard-ring
                     )))))

(define-configuration (prompt-buffer)
    ((default-modes (append '(emacs-mode) %slot-default%))
     (hide-suggestion-count-p t)))

;; (define-configuration bookmark-frequent-visits-mode
;;   ((threshold 10)))

(define-configuration buffer
  ((default-modes (append '(blocker-mode) %slot-default%))))

;; Mimicking John

;; (defun my-format-status (window)
;;   (let ((buffer (current-buffer window)))
;;     (markup:markup
;;      (:div :id "container"
;;            (:div :id "controls" :class "arrow-right"
;;                  (markup:raw (format-status-buttons)))
;;            (:div :id "url"
;;                  (markup:raw
;;                   (format-status-load-status buffer)
;;                   (format-status-url buffer)))))))

;; (define-configuration window
;;   ((status-formatter #'my-format-status)))

(define-configuration nyxt/web-mode::web-mode
  ((nyxt/web-mode::hints-alphabet "asdfghjklqwertyuiop")))

(define-bookmarklet-command hack-youtube-speed 
  "Tweak Youtube videos' speed beyond the UI options and limits." 
  "(function() {
    const rate = prompt('Set the new playback rate', 2.5);
    if (rate != null) {
        const video =
            document.getElementsByTagName('video')[0];
        video.playbackRate = parseFloat(rate);
    }})();")
