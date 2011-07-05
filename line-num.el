<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: line-num.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=line-num.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: line-num.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=line-num.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for line-num.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=line-num.el" />
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-2101513-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22line-num.el%22">line-num.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/line-num.el">Download</a></p><pre class="code"><span class="linecomment">;;; line-num.el --- Display line numbers in left-margin of buffer.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Filename: line-num.el</span>
<span class="linecomment">;; Description: Display line numbers in left-margin of buffer.</span>
<span class="linecomment">;; Author: (Darryl Okahata) darrylo@hpsrdmo, Drew Adams</span>
<span class="linecomment">;; Maintainer: Drew Adams</span>
<span class="linecomment">;; Copyright (C) 1999-2011, Drew Adams, all rights reserved.</span>
<span class="linecomment">;; Copyright (C) 1989, Hewlett-Packard, all rights reserved.</span>
<span class="linecomment">;; Created: Wed Mar 31 16:18:24 1999</span>
<span class="linecomment">;; Version: 21.0</span>
<span class="linecomment">;; Last-Updated: Tue Jan  4 11:03:41 2011 (-0800)</span>
<span class="linecomment">;;           By: dradams</span>
<span class="linecomment">;;     Update #: 209</span>
<span class="linecomment">;; URL: http://www.emacswiki.org/cgi-bin/wiki/line-num.el</span>
<span class="linecomment">;; Keywords: local</span>
<span class="linecomment">;; Compatibility: GNU Emacs: 20.x, 21.x, 22.x, 23.x</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Features that might be required by this library:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   None</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    Display line numbers in left-margin of buffer.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; New functions defined here:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;    `display-line-numbers', `toggle-line-numbers-display',</span>
<span class="linecomment">;;    `turn-on-line-numbers-display', `turn-off-line-numbers-display'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; NOTE: `setnu.el' now provides similar, but generally better,</span>
<span class="linecomment">;; functionality.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Original author was Darryl Okahata darrylo@hpsrdmo: The copy on</span>
<span class="linecomment">;; which the current (Adams) modifications were made was obtained from</span>
<span class="linecomment">;; Rick Kunin (rickk@sperdk).</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Change log:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 2004/11/26 dadams</span>
<span class="linecomment">;;     Replaced decf with setq...1+.</span>
<span class="linecomment">;;     turn-off-line-numbers-display: Error if not displaying line #s.</span>
<span class="linecomment">;;     Removed calls to `fit-frame' (and require of fit-frame.el).</span>
<span class="linecomment">;; 2000/11/01 dadams</span>
<span class="linecomment">;;     1. Added: toggle-line-numbers-display, turn-on-line-numbers-display,</span>
<span class="linecomment">;;               turn-off-line-numbers-display.</span>
<span class="linecomment">;;     2. Added global vars: displaying-line-numbers-p,</span>
<span class="linecomment">;;        display-line-numbers-format-string, display-line-numbers-first-line,</span>
<span class="linecomment">;;        display-line-numbers-count, display-line-numbers-buffer-name,</span>
<span class="linecomment">;;        display-line-numbers-modified-p.</span>
<span class="linecomment">;; 1999/04/14 dadams</span>
<span class="linecomment">;;     Commented out assignment to unused free var: insert-end.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is free software; you can redistribute it and/or modify</span>
<span class="linecomment">;; it under the terms of the GNU General Public License as published by</span>
<span class="linecomment">;; the Free Software Foundation; either version 2, or (at your option)</span>
<span class="linecomment">;; any later version.</span>

<span class="linecomment">;; This program is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>

<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program; see the file COPYING.  If not, write to</span>
<span class="linecomment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="linecomment">;; Floor, Boston, MA 02110-1301, USA.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Code:</span>

<span class="linecomment">;;&gt;&gt; Problem:  Tabs at beginning of lines</span>


(and (&lt; emacs-major-version 20) (eval-when-compile (require 'cl))) <span class="linecomment">;; when, unless</span>

<span class="linecomment">;;;;;;;;;;;;;</span>


<span class="linecomment">;;;###autoload</span>
(defun display-line-numbers ()
  "<span class="quote">Temporarily display line numbers in left margin of current buffer.</span>"
  (interactive)
  (or (eq (current-buffer) (window-buffer (selected-window)))
      (error "<span class="quote">Current buffer, %s, is not the selected window's buffer</span>"
             (buffer-name)))
  (let ((buffer-read-only nil)
        (modified (buffer-modified-p))
        (name buffer-file-name)
        (point (point-marker))
        format-string
        line-number
        (count 0)
        nlines
        first-line)
    (save-restriction
      (widen)
      (save-excursion
        (setq first-line (window-start (selected-window)))
        (goto-char first-line)
        (setq line-number (1+ (count-lines (point-min) (point))))
        (move-to-window-line -1)
        (beginning-of-line)
        (setq nlines (count-lines first-line (point)))
        (let ((max (+ line-number nlines)))
          (setq format-string (cond ((&lt; max 100) "<span class="quote">%2d </span>")
                                    ((&lt; max 1000) "<span class="quote">%3d </span>")
                                    ((&lt; max 10000) "<span class="quote">%4d </span>")
                                    (t "<span class="quote">%7d </span>"))))))
    (save-excursion
      (unwind-protect
          (progn
            (goto-char first-line)
            <span class="linecomment">;; defeat file locking... don't try this at home, kids!</span>
            (setq buffer-file-name nil)
            (while (&lt;= count nlines)
              (insert-before-markers (format format-string line-number))
              <span class="linecomment">;;;(setq insert-end (point)) THIS VAR IS FREE - AND UNUSED!</span>
              (setq line-number (1+ line-number))
              (setq count (1+ count))
              (forward-line 1))
            (set-window-start (selected-window) first-line)
            (goto-char point)
            (set-buffer-modified-p modified)
            (message "<span class="quote">&lt;&lt;&lt; Press SPACE to continue &gt;&gt;&gt;</span>")
            (let ((char (read-char)))
              (or (eql char ?\  )
                  (setq unread-command-events (list char))))
            )
        (goto-char first-line)
        (let ((n (1+ (- (aref format-string 1) ?0))))
          (while (&gt; count 0)
            (setq count (1- count))
            (delete-char n)
            (forward-line 1)))
        (setq buffer-file-name name)
        (set-buffer-modified-p modified)))))

<span class="linecomment">;;;-----------------------------------------------------------------</span>

(defvar displaying-line-numbers-p nil)
(make-variable-buffer-local 'displaying-line-numbers-p)
(defvar display-line-numbers-format-string nil)
(make-variable-buffer-local 'display-line-numbers-format-string)
(defvar display-line-numbers-first-line nil)
(make-variable-buffer-local 'display-line-numbers-first-line)
(defvar display-line-numbers-count 0)
(make-variable-buffer-local 'display-line-numbers-count)
(defvar display-line-numbers-buffer-name nil)
(make-variable-buffer-local 'display-line-numbers-buffer-name)
(defvar display-line-numbers-modified-p nil)
(make-variable-buffer-local 'display-line-numbers-modified-p)

<span class="linecomment">;;;###autoload</span>
(defun toggle-line-numbers-display (arg)
  "<span class="quote">Display/clear line numbers in left margin of current buffer.
With prefix ARG, just number lines in current window, not all lines in
buffer.</span>"
  (interactive "<span class="quote">P</span>")
  (if displaying-line-numbers-p
      (turn-off-line-numbers-display)
    (turn-on-line-numbers-display arg)))

<span class="linecomment">;;;###autoload</span>
(defun turn-on-line-numbers-display (arg)
  "<span class="quote">Display line numbers in left margin of current buffer.
With prefix ARG, just number lines in current window, not all lines in
buffer.</span>"
  (interactive "<span class="quote">P</span>")
  (or (eq (current-buffer) (window-buffer (selected-window)))
      (error "<span class="quote">Current buffer, %s, is not the selected window's buffer</span>"
             (buffer-name)))
  (let ((buffer-read-only nil)
        (point (point-marker))
        line-number
        nlines)
    (setq display-line-numbers-buffer-name buffer-file-name)
    (setq display-line-numbers-modified-p (buffer-modified-p))
    (save-restriction
      (widen)
      (save-excursion
        (setq display-line-numbers-first-line
              (if arg
                  (window-start (selected-window))
                (point-min)))
        (goto-char display-line-numbers-first-line)
        (setq line-number (1+ (count-lines (point-min) (point))))
        (if arg
            (move-to-window-line -1)
          (goto-char (point-max)))
        (beginning-of-line)
        (setq nlines (count-lines display-line-numbers-first-line (point)))
        (let ((max (+ line-number nlines)))
          (setq display-line-numbers-format-string (cond ((&lt; max 100) "<span class="quote">%2d </span>")
                                    ((&lt; max 1000) "<span class="quote">%3d </span>")
                                    ((&lt; max 10000) "<span class="quote">%4d </span>")
                                    (t "<span class="quote">%7d </span>"))))))
    (save-excursion
      (condition-case nil
          (progn
            (goto-char display-line-numbers-first-line)
            (setq buffer-file-name nil) <span class="linecomment">; To prevent saving with line numbers etc.</span>
            (setq displaying-line-numbers-p t)
            (while (&lt;= display-line-numbers-count nlines)
              (insert-before-markers
               (format display-line-numbers-format-string line-number))
              (setq line-number (1+ line-number))
              (setq display-line-numbers-count (1+ display-line-numbers-count))
              (forward-line 1))
            (when arg
              (set-window-start (selected-window) display-line-numbers-first-line))
            (goto-char point)
            (set-buffer-modified-p display-line-numbers-modified-p))
    (error
     (progn
           (goto-char display-line-numbers-first-line)
           (let ((n (1+ (- (aref display-line-numbers-format-string 1) ?0))))
             (while (&gt; display-line-numbers-count 0)
               (setq display-line-numbers-count (1- display-line-numbers-count))
               (delete-char n)
               (forward-line 1)))
           (setq buffer-file-name display-line-numbers-buffer-name)
           (set-buffer-modified-p display-line-numbers-modified-p)
           (setq displaying-line-numbers-p nil))))))
  (let ((curr-line (count-lines (window-start) (point))))
    (when (&gt; curr-line 0) (setq curr-line (1+ curr-line)))
    (recenter curr-line)))

<span class="linecomment">;;;###autoload</span>
(defun turn-off-line-numbers-display ()
  "<span class="quote">Clear displayed line numbers from left margin of current buffer.</span>"
  (interactive)
  (unless (eq (current-buffer) (window-buffer (selected-window)))
    (error "<span class="quote">Current buffer, `%s', is not the selected window's buffer</span>"
             (buffer-name)))
  (unless displaying-line-numbers-p
    (error "<span class="quote">Not displaying line numbers in buffer `%s'</span>" (buffer-name)))
  (let ((buffer-read-only nil))
    (save-excursion
      (when (boundp 'display-line-numbers-buffer-name)
        (setq buffer-file-name display-line-numbers-buffer-name))
      (goto-char display-line-numbers-first-line)
      (let ((n (1+ (- (aref display-line-numbers-format-string 1) ?0))))
        (while (&gt; display-line-numbers-count 0)
          (setq display-line-numbers-count (1- display-line-numbers-count))
          (delete-char n)
          (forward-line 1)))
      (when (boundp 'display-line-numbers-modified-p)
        (set-buffer-modified-p display-line-numbers-modified-p))
      (setq displaying-line-numbers-p nil))))


<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;</span>

(provide 'line-num)

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;; line-num.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=line-num.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=line-num.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=line-num.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=line-num.el">Administration</a></span><span class="time"><br /> Last edited 2011-01-04 19:04 UTC by <a class="author" title="from inet-hqmc06-o.oracle.com" href="http://www.emacswiki.org/emacs/DrewAdams">DrewAdams</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=line-num.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
