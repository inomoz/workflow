https://ztlevi.github.io/posts/The-Minimal-Spacemacs-Tweaks-for-Jetbrain-IDES/

```
SPC f c   	copy current file to a different location	
SPC f D   	delete a file and the associated buffer (ask for confirmation)	
SPC f E   	open a file with elevated privileges (sudo edit)	
SPC f f   	open file with =helm= (or =ido=)	
SPC f F   	try to open the file under point =helm=	
SPC f j   	jump to the current buffer file in dired	
SPC f l   	open file literally in =fundamental mode=	
SPC f L   	Locate a file (using =locate=)	
SPC f o   	open a file using the default external program	
SPC f R   	rename the current file	
SPC f s   	save a file	
SPC f S   	save all files	
SPC f r   	open a recent file with =helm=	
SPC f t   	toggle file tree side bar using [[https://github.com/jaypei/emacs-neotree][NeoTree]]	
SPC f v d 	add a directory variable	
SPC f v f 	add a local variable to the current file	
SPC f v p 	add a local variable to the first line of the current file	
SPC f y   	show current file absolute path in the minibuffer	
		
SPC f e c	open =ido= in the =contrib= folder	
SPC f e d	open the spacemacs dotfile (=/.spacemacs=)	
SPC f e D	open =ediff= buffer of =/.spacemacs= and =.spacemacs.template=	
SPC f e f	discover the =FAQ= using =helm=	
SPC f e i	open the all mighty =init.el=	
SPC f e R	resync the dotfile with spacemacs	
SPC f e v	display and copy the spacemacs version	
Comment		
SPC ;	comment operator	
SPC c y	comment and yank	
SPC c p	comment paragraphs	
Find files		
SPC ff:	find files or url	
SPC pf:	find file in project	
SPC ph:	search in a project with helm	
SPC bb:	search in buffers	
Search in files		
SPC ss		
/: search with evil		
SPC s l	find all function definitons in a file	
 Window		
SPC 1	switch to window 1	
SPC 2	switch to window 2	
SPC w =	balance split windows	
		
SPC w c	close a window	
SPC w C	delete another window using ace-delete-window	
SPC w d	toggle window dedication (dedicated window cannot be reused by a mode)	
SPC w [hjkl]	move to window	
SPC w [HJKL]	move the window	
SPC w s or SPC w	horizontal split and focus new window	
SPC w S	horizontal split and focus new window	
SPC w u	undo window layout (used to effectively undo a closed window)	
SPC w U	redo window layout	
SPC w v	or SPC w /	vertical split
SPC w V	vertical split and focus new window	
SPC w w	cycle and focus between windows	
SPC w m	maximize/minimize a window (maximize is equivalent to delete other windows)	
SPC w M	maximize/minimize a window, when maximized the buffer is centered	
buffer		
SPC TAB	switch to alternate buffer in the current window (switch back and forth)	
SPC b b	switch to a buffer using helm	
SPC b B	ibuffer	
SPC b d	kill the current buffer (does not delete the visited file)	
SPC b M	move buffer to another window	
SPC b e	erase the content of the buffer (ask for confirmation)	
SPC b h	open *spacemacs* home buffer	
SPC b k	kill a buffer	
SPC b K	kill all buffers except the current one	
Project		
SPC p !  	run shell command in root	
SPC p &  	run async shell command in root	
SPC p a  	toggle between implementation and test	
SPC p b  	switch to project buffer	
SPC p c  	compile project using =projectile=	
SPC p d  	find directory	
SPC p D  	open project root in =dired=	
SPC p f  	find file	opens root of project
SPC p G  	regenerate the project's =etags= / =gtags=	
SPC p h  	find file using =helm=	
SPC p I  	invalidate the projectile cache	
SPC p k  	kill all project buffers	
SPC p o  	run =multi-occur=	
SPC p p  	switch project	
SPC p r  	open a recent file	
SPC p R  	replace a string	
SPC p s  	see [[Searching in a project][search in project]]	
SPC p t  	open =NeoTree= in =projectile= root	
SPC p T  	find test files	
SPC p v  	open project root in =vc-dir= or =magit=	
SPC p y  	find tags	
SPC /    	search in project with the best search tool available	
SPC s a p	run =ag=	
SPC s g p	run =grep=	
SPC s k p	run =ack=	
SPC s t p	run =pt=	
errors		
SPC e n	go to the next error	
SPC e p	go to the previous error	
Quit		
SPC q q	Quit Emacs and kill the server, prompt for changed buffers to save	
SPC q Q	Quit Emacs and kill the server, lose all unsaved changes.	
SPC q r	Restart both Emacs and the server, prompting to save any changed buffers	
SPC q s	Save the buffers, quit Emacs and kill the server	
SPC q z	Kill the current frame	
Refactoring		
SPC m r R x	extract region into partial	
Run		
SPC m r :   	run rake task	
SPC m r c c 	run rails generator	
SPC m r i   	start rails console	
SPC m r s r 	reload Rails project	
SPC m r x s 	start rails server	
Ex-commands		
:A	Switch between implementation and tests	
Git commands		
SPC g b  	open a =magit= blame	
SPC g B  	quit =magit= blame	
SPC g c  	commit changes	
SPC g C  	checkout branches	
SPC g d  	show diff prompt	
SPC g D  	show diff against current head	
SPC g e  	show ediff comparison	
SPC g E  	show ediff against current head	
SPC g f  	show fetch prompt	
SPC g F  	show pull prompt	
SPC g H c	clear highlights	
SPC g H h	highlight regions by age of commits	
SPC g H t	highlight regions by last updated time	
SPC g i  	git init a given directory	
SPC g I  	open =helm-gitignore=	
SPC g l  	open a =magit= log	
SPC g L  	display the log for a file	
SPC g P  	show push prompt	
SPC g s  	open a =magit= status window	
SPC g S  	stage current file	
SPC g m  	display the last commit message of the current line	
SPC g t  	launch the git time machine	
SPC g U	unstage current file	
		
SPC v	enter expand-region mode	
SPC V	contract region	
CTRL SPC - Mark Items		
CTRL z - Actions		
CTRL h	up a folder	
CTRL l	open a folder	
CTRL j	up	
CTRL k	down	
Evil-mc		
grm	make-all-cursors	
gru	undo-all-cursors	
grs	pause-cursors	
grr	resume-cursors	
grf	make-and-goto-first-cursor	
grl	make-and-goto-last-cursor	
grh	make-cursor-here	
M-n	make-and-goto-next-cursor	
grN	skip-and-goto-next-cursor	
M-p	make-and-goto-prev-cursor	
grP	skip-and-goto-prev-cursor	
C-n	make-and-goto-next-match	
grn	skip-and-goto-next-match	
C-t	skip-and-goto-next-match	
C-p	make-and-goto-prev-match	
grp	skip-and-goto-prev-match	
Find/Replace		
Alt %	query-replace; active region, or cursor point to end interactive find/replace	
y     	do the replacement.	
n     	skip	
“”!	do this and all remaining replacements without asking.	
Ctrl+g	cancel.	
s (	put parens around a region	
SPC s e	multiple cursors	
n - jump		
N - jump		
SPC h d - help describe		
SPC h d f - help describe functions		
SPC h d v - help describe variables		
SPC f e h - help		
ALT /	snippet completion	
		
SPC t s - syntax checking		
SPC e - syntax checking options		
SPC a r - ranger		
SPC a d - deer		
		
unimpaired		
'"[e    	Move line up	
'"]e    	Move line down	
'"[SPACE	Insert space above	
'"]SPACE	Insert space below	
'"[p    	Paste above current line	
'"]p    	Paste below current line	
```
