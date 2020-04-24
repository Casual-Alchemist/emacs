;; UI settings
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(menu-bar-mode 0)
(tool-bar-mode 0)
(toggle-scroll-bar 0)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wheatgrass)))
 '(inhibit-startup-screen t)
 '(python-shell-interpreter "python3")
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 165 :width normal)))))

;; (add-to-list 'load-path "~/.emacs.d/lisp/")
;; (load "~/.emacs.d/lisp/scons-mode")
(setq auto-mode-alist
      ;; for scons
      (cons '("SCons" . python-mode) auto-mode-alist))

(require 'package)
(add-to-list 'package-archives
             '("elpy" . "https://jorgenschaefer.github.io/packages/"))

(package-initialize)
(elpy-enable)

;; To open recent files
(require 'recentf)
(recentf-mode 1)
(global-set-key
 (kbd "C-c C-f") 'recentf-open-files)


;; Key bindings for comments
(global-set-key
 (kbd "C-c c") 'comment-region)
(global-set-key
 (kbd "C-c u") 'uncomment-region)

;; python3 configuration
(setq elpy-rpc-python-command "python3")

;; my custom settings
(add-hook 'text-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'electric-newline-and-maybe-indent)))
(defun text-indent-mode ()
 ;;(setq-default indent-tabs-mode nil)
 (setq-default tab-width 4)
 (setq indent-line-function 'insert-tab))
(add-hook 'text-mode-hook 'text-indent-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook #'hs-minor-mode)
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'show-paren-mode)
(global-set-key
 (kbd "C-c h") 'hs-hide-block)
(global-set-key
 (kbd "C-c s") 'hs-show-block)
(global-set-key
 (kbd "C-c C-a h") 'hs-hide-all)
(global-set-key
 (kbd "C-c C-a s") 'hs-show-all)
