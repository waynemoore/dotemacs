;; VISUAL

  ;; dark background, light foreground
  (invert-face 'default)

  ;; No toolbar
  (tool-bar-mode -1)

  ;; display buffer names uniquely
  (require 'uniquify)
  (setq
    uniquify-buffer-name-style 'post-forward
    uniquify-separator ":")


;; INPUT

  ;; keep alt as OS X behaviour, so that inserting hashes works
  (setq mac-option-modifier nil)

  ;; option key as emacs meta
  (setq mac-command-modifier 'meta)

;; CUSTOM KEYBINDINGS

  (global-set-key (kbd "C-c t") 'toggle-truncate-lines)
  (global-set-key (kbd "C-c r") 'revert-buffer)

;; OTHER

  ;; Display continuous lines
  (setq-default truncate-lines nil)

  ;; Do not use tabs for indentation
  (setq-default indent-tabs-mode nil)

  ;; Enable copy and pasting from clipboard
  (setq x-select-enable-clipboard t)

  ;; remove trailing whitespace on save
  (add-to-list 'write-file-functions 'delete-trailing-whitespace)

  ;; Disable backups
  (setq backup-inhibited t)

  ;; disable auto save
  (setq auto-save-default nil)

  ;; y/n instead of yes/no
  (defalias 'yes-or-no-p 'y-or-n-p)

  ;; keep mini-buffer history
  (savehist-mode 1)

  ;; no emacs startup message
  (setq inhibit-startup-message t)

  ;; start emacs server
  (server-start)

;; RUBY

  ;; Don't automatically insert encoding comment at the top of ruby files
  (setq ruby-insert-encoding-magic-comment nil)

;; FILE ASSOCIATIONS

  ;; Ruby
  (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))

;; PACKAGE CONFIG

  ;; bundler for emacs packages
  ;; https://github.com/cask/cask
  (require 'cask "/usr/local/Cellar/cask/0.7.2/cask.el")
  (cask-initialize)

  ;; maintain package installs in Caskfile
  ;; https://github.com/rdallasgray/pallet
  (require 'pallet)

  ;; copy shell path, useful for OSX GUI
  ;; https://github.com/purcell/exec-path-from-shell
  (require 'exec-path-from-shell)
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize))

  ;; intelligent auto-completion extension
  ;; https://github.com/auto-complete/auto-complete
  (require 'auto-complete-config)
  (ac-config-default)
  (setq ac-ignore-case nil)
  (add-to-list 'ac-modes 'enh-ruby-mode)
  (add-to-list 'ac-modes 'web-mode)

  ;; An Emacs frontend to ag, ("the silver searcher" ack replacment)
  ;; https://github.com/Wilfred/ag.el
  (require 'ag)

  ;; Emacs version of the Vim powerline.
  ;; https://github.com/milkypostman/powerline
  (require 'powerline)
  (powerline-default-theme)

  ;; Projectile project management
  ;; https://github.com/bbatsov/projectile
  (projectile-global-mode)

  ;; flx-ido
  ;; https://github.com/lewang/flx
  (require 'flx-ido)
  (flx-ido-mode 1)

  ;; magit
  ;; https://github.com/magit/magit
  (require 'magit)

  ;; goto-last-change
  (require 'goto-last-change)
  (global-set-key (kbd "C-.") 'goto-last-change)
