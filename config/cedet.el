;;; minimial-cedet-config.el --- Working configuration for CEDET from bzr

;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords: cedet, C++, Java
;; Requirements: CEDET from bzr (http://cedet.sourceforge.net/bzr-repo.shtml)

;; Do checkout of fresh CEDET, and use this config (don't forget to change path below)

;; (setq cedet-root-path (file-name-as-directory "/usr/share/emacs/24.3/lisp/cedet"))

;; (load-file (concat cedet-root-path "cedet-devel-load.el"))
;; (add-to-list 'load-path (concat cedet-root-path "contrib"))

;; select which submodes we want to activate
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)

;; Activate semantic
(semantic-mode t)

;; customisation of modes
(defun alexott/cedet-hook ()
    (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
      (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
      (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
      (local-set-key "\C-c=" 'semantic-decoration-include-visit)

      (local-set-key "\C-cj" 'semantic-ia-fast-jump)
      (local-set-key "\C-cq" 'semantic-ia-show-doc)
      (local-set-key "\C-cs" 'semantic-ia-show-summary)
      (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))

(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
;; (add-hook 'emacs-lisp-mode-hook 'alexott/cedet-hook)
;; (add-hook 'haskell-mode-hook 'alexott/cedet-hook)
;; (add-hook 'python-mode-hook 'alexott/cedet-hook)

(defun alexott/c-mode-cedet-hook ()
    (local-set-key "\C-ct" 'eassist-switch-h-cpp)
    (local-set-key "\C-xt" 'eassist-switch-h-cpp)
    (local-set-key "\C-ce" 'eassist-list-methods)
    (local-set-key "\C-c\C-r" 'semantic-symref))

(add-hook 'c-mode-common-hook 'alexott/c-mode-cedet-hook)

(semanticdb-enable-gnu-global-databases 'c-mode t)
(semanticdb-enable-gnu-global-databases 'c++-mode t)

;;; minimial-cedet-config.el ends here
