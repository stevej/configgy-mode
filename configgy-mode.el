;;; configgy-mode.el --- a Configgy editing mode

;; Copyright (C) 2009  Steve Jenson

;; Author:  Steve Jenson <stevej@pobox.com>
;; Version:  See `configgy-mode-version'
;; Keywords:  config, configgy, configuration

;; This file is (not yet) part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; TODO:

;; To customize how it works:
;;   M-x customize-group RET configgy-mode RET

;; Notes:

;; This is extremely basic.

;; To use, add this to your .emacs file:

;; (add-to-list 'load-path "~/.emacs.d/vendor/configgy-mode")
;; (require 'configgy-mode)

;; Now simply open a .conf file and watch the magic happen!

;;; Code:


(eval-when-compile
  (require 'cl))

(defvar configgy-mode-version 20090814
  "Release number for `configgy-mode'.")

(defvar configgy-mode-hook nil)

(defvar configgy-mode-map
  (let ((configgy-mode-map (make-keymap)))
    ;;(define-key configgy-mode-map "\C-j" 'newline-and-indent)
    configgy-mode-map)
  "Keymap for configgy major mode")

(add-to-list 'auto-mode-alist '("\\.conf\\'" . configgy-mode))

; comments begin with #
(defvar configgy-font-lock-keywords-1
  (list
   '("^#.*" . font-lock-comment-face)
   )
  "Minimal highlighting expressions for configgy mode")

(defvar configgy-font-lock-keywords
  configgy-font-lock-keywords-1)

(defun configgy-mode ()
  "Major mode for editing Configgy files"
  (interactive)
  (kill-all-local-variables)
  (set (make-local-variable 'font-lock-defaults)
       '(configgy-font-lock-keywords))
  ;;(set-syntax-table configgy-mode-syntax-table)
  (use-local-map configgy-mode-map))

(provide 'configgy-mode)