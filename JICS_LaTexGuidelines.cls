%%   JICS_LaTexGuidelines.cls 2021/04/14 version 1.3
%%   
%%   This is the first released version of the LaTeX class for the authors of 
%%   the Journal of Integrated Circuits and Systems. It is heavily based on the 
%%   original `article.cls', as well as the LaTeX class for the IEEE publica-
%%   tions (`IEEEtran.cls'). 
%%   
%%   Please, mind that some features of those two classes are not supported
%%   by the JICS guidelines. 
%%   
%%   For bug reports and suggestions, please e-mail:
%%   	Lígia d'Oliveira - ligiadol@fei.edu.br
%%   	
%%   Copyright 2020-2021
%%   
%%*************************************************************************
%%   Legal Notice:
%%   This code is offered as-is without any warranty either expressed or
%%   implied; without even the implied warranty of MERCHANTABILITY or
%%   FITNESS FOR A PARTICULAR PURPOSE! 
%%   User assumes all risk.
%%   In no event shall the IEEE or any contributor to this code be liable for
%%   any damages or losses, including, but not limited to, incidental,
%%   consequential, or any other damages, resulting from the use or misuse
%%   of any information contained here.
%%   
%%*************************************************************************
%%   RECOMMENDED OPTIONS: `a4paper,10pt,twoside,twocolumn,final'
%%   \footnotetext not supported
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{JICS_LaTexGuidelines}
              [2021/04/14 v.1.3]
\RequirePackage{soul}
% Recommended Packages %
\RequirePackage[fleqn]{amsmath} % Provides several useful options in mathema-
%% tical mode. Is essential for the correct alignment of the equations for 
%% papers to be submitted to JICS.
\setlength{\mathindent}{0.17in}
\RequirePackage[pdftex]{graphicx} % For the \includegraphics command


\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagefalse
% V.1.1 Simplification, as the only option available is A4
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
	\setlength\paperwidth  {210mm}}
\if@compatibility
	\renewcommand\@ptsize{0}
\else
	\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\if@compatibility\else
	\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility\else
	\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
	\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility\else
	\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
% Defines Times New Roman as default font type.
\renewcommand{\sfdefault}{phv}
\renewcommand{\rmdefault}{ptm}
\renewcommand{\ttdefault}{pcr}

\ExecuteOptions{a4paper,10pt,twoside,twocolumn,final}
\ProcessOptions

\input{size1\@ptsize.clo}
% v.0.3 - Defines font sizes
\newdimen\@JICSnormalsizeunitybaselineskip
\@JICSnormalsizeunitybaselineskip\baselineskip

\def\normalsize{\@setfontsize{\normalsize}{10bp}{12bp}}%
\setlength{\@JICSnormalsizeunitybaselineskip}{12bp}%
\normalsize
\abovedisplayskip 1.5ex plus 6bp minus 4bp
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip 0pt plus 6bp
\belowdisplayshortskip 1.5ex plus 6bp minus 4bp
\def\small{\@setfontsize{\small}{9.083bp}{11bp}}
\def\footnotesize{\@setfontsize{\footnotesize}{9bp}{10.5bp}}
\def\scriptsize{\@setfontsize{\scriptsize}{9bp}{10bp}}
\def\tiny{\@setfontsize{\tiny}{8bp}{10bp}}
% sublargesize is the same as large - 14bp
\def\sublargesize{\@setfontsize{\sublargesize}{11bp}{12bp}}
\def\large{\@setfontsize{\large}{15bp}{19bp}}
\def\Large{\@setfontsize{\Large}{17bp}{20bp}}
\def\LARGE{\@setfontsize{\LARGE}{20bp}{24bp}}
\def\huge{\@setfontsize{\huge}{22bp}{26bp}}
\def\Huge{\@setfontsize{\Huge}{24bp}{28bp}}
%
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
% v.0.6 - Interword spacing definition
% For medium (normal weight)
\def\@JICSinterspaceratioM{0.35}
\def\@JICSinterspaceMINratioM{0.23}
\def\@JICSinterspaceMAXratioM{0.50}

% For bold
\def\@JICSinterspaceratioB{0.375}
\def\@JICSinterspaceMINratioB{0.23}
\def\@JICSinterspaceMAXratioB{0.55}

% command to revise the interword spacing for the current font under TeX:
% \fontdimen2 = nominal interword space
% \fontdimen3 = interword stretch
% \fontdimen4 = interword shrink
% since all changes to the \fontdimen are global, we can enclose these commands
% in braces to confine any font attribute or length changes
\def\@@@JICSsetfontdimens#1#2#3{{%
\setlength{\@JICStrantmpdimenB}{\f@size pt}% grab the font size in pt, could use 1em instead.
\setlength{\@JICStrantmpdimenA}{#1\@JICStrantmpdimenB}%
\fontdimen2\font=\@JICStrantmpdimenA\relax
\addtolength{\@JICStrantmpdimenA}{-#2\@JICStrantmpdimenB}%
\fontdimen3\font=-\@JICStrantmpdimenA\relax
\setlength{\@JICStrantmpdimenA}{#1\@JICStrantmpdimenB}%
\addtolength{\@JICStrantmpdimenA}{-#3\@JICStrantmpdimenB}%
\fontdimen4\font=\@JICStrantmpdimenA\relax}}

% revise the interword spacing for each font weight
\def\@@JICSsetfontdimens{{%
\mdseries
\@@@JICSsetfontdimens{\@JICSinterspaceratioM}{\@JICSinterspaceMAXratioM}{\@JICSinterspaceMINratioM}%
\bfseries
\@@@JICSsetfontdimens{\@JICSinterspaceratioB}{\@JICSinterspaceMAXratioB}{\@JICSinterspaceMINratioB}%
}}

% revise the interword spacing for each font shape
% \slshape is not often used for IEEE work and is not altered here. The \scshape caps are
% already a tad too large in the free LaTeX fonts (as compared to what the IEEE uses) so we
% won't alter these either.
\def\@JICSsetfontdimens{{%
\normalfont
\@@JICSsetfontdimens
\normalfont\itshape
\@@JICSsetfontdimens
}}

% command to revise the interword spacing for each font size (and shape
% and weight). Only the \rmfamily is done here as \ttfamily uses a 
% fixed spacing and \sffamily is not used as the main text of IEEE papers.
\def\@JICStunefonts{{\selectfont\rmfamily
\tiny\@JICSsetfontdimens
\scriptsize\@JICSsetfontdimens
\footnotesize\@JICSsetfontdimens
\small\@JICSsetfontdimens
\normalsize\@JICSsetfontdimens
\sublargesize\@JICSsetfontdimens
\large\@JICSsetfontdimens
\LARGE\@JICSsetfontdimens
\huge\@JICSsetfontdimens
\Huge\@JICSsetfontdimens}}
% 
% v.0.4 Defines header text
\def\markboth#1#2{%
	\def\leftmark{\protect#1}%
	\def\rightmark{\protect#2}%
}%
\def\myhrule{\lower1ex\null\vadjust{\hrule}}
% v.0.5 Defines footnote text
\def\footnotetext#1{\def\leftfoot{\protect#1}}
%V.0.5
% V.1.1 Redefine headings and myheadings page styles
% Both have the headings appropriate for this class
%% - headings: Includes the footnote for the DOI (for the 1st page)
%% - myheadings: No footnote
\def\ps@headings{%
	\let\@evenfoot\@empty
	\def\@oddfoot{
		\hbox{}
		\normalfont
		\scriptsize
		\leftfoot
		\hfill
	}\relax
%V.0.4
	\def\@oddhead{%
		\hbox{}
		\normalfont
		\scriptsize
		\leftmark
		\hfil
		\thepage
		\myhrule
	}\relax
	\def\@evenhead{%
		\normalfont
		\scriptsize
		\thepage
		\hfil
		\rightmark
		\hbox{}
		\myhrule
	}\relax
	\let\@mkboth\markboth
}
\def\ps@myheadings{%
    \let\@oddfoot\@empty
	\let\@evenfoot\@empty
	\def\@oddhead{%
		\hbox{}
		\normalfont
		\scriptsize
		\leftmark
		\hfil
		\thepage
		\myhrule
	}\relax
	\def\@evenhead{%
		\normalfont
		\scriptsize
		\thepage
		\hfil
		\rightmark
		\hbox{}
		\myhrule
	}\relax
	\let\@mkboth\markboth
%    \let\@mkboth\@gobbletwo
%    \let\sectionmark\@gobble
%    \let\subsectionmark\@gobble
}
\newcommand\maketitle{\par
	\begingroup
		%V.0.5
		\renewcommand\thefootnote{\@fnsymbol\c@footnote}%
		\def\@makefnmark{%
			\rlap{%
				\@textsuperscript{%
					\normalfont\@thefnmark
				}
			}
		}%
		\long\def\@makefntext##1{%
			\parindent 1em\noindent
			\hb@xt@1.8em{%
			\hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
		% V.1.1 Symplification
		\ifnum \col@number=\@ne
			\@maketitle			
		\else
			\twocolumn[\@maketitle]%
		\fi
		\thispagestyle{headings}\@thanks
	\endgroup
	\global\let\thanks\relax
	\global\let\maketitle\relax
	\global\let\@maketitle\relax
	\global\let\@thanks\@empty
	\global\let\@author\@empty
	\global\let\@title\@empty
	\global\let\title\relax
	\global\let\author\relax
	\global\let\and\relax
}
\def\@maketitle{%
	\newpage
	\bgroup
		\par
		\vskip 0.5\baselineskip
		\centering
		\vskip 0.5em 
		%V.0.5
		\large\@title\par\relax
		\vskip 1.0em
		\sublargesize\@author\par
		\relax  
		\par
		\addvspace{2\baselineskip}
	\egroup
}

\setcounter{secnumdepth}{3}
\newcounter {part}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thesection {\@Roman\c@section.}
\renewcommand\thesubsection   {\@Alph\c@subsection.}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\part{%
   \if@noskipsec \leavevmode \fi
   \par
   \addvspace{4ex}%
   \@afterindentfalse
   \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >\m@ne
       \Large\bfseries \partname\nobreakspace\thepart
       \par\nobreak
     \fi
     \huge \bfseries #2%
     \markboth{}{}\par}%
    \nobreak
    \vskip 3ex
    \@afterheading}
\def\@spart#1{%
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \huge \bfseries #1\par}%
     \nobreak
     \vskip 3ex
     \@afterheading}
%V.0.3
\newcommand\section{\@startsection {section}{1}{\z@}%
									{1.5ex plus 1.5ex minus 0.5ex}%
									{0.7ex plus 1ex minus 0ex}%
									{\normalfont\normalsize\bfseries\centering\scshape}}%
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
									{1.5ex plus 1.5ex minus 0.5ex}%
									{0.7ex plus .5ex minus 0ex}%
									{\normalfont\normalsize\itshape\indent}}%
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\parindent}%
									{0ex plus 0.1ex minus 0.1ex}%
									{0ex}%
									{\normalfont\normalsize\itshape}}%
\newcommand\paragraph{\@startsection{paragraph}{4}{2\parindent}%
									{0ex plus 0.1ex minus 0.1ex}%
									{0ex}%
									{\normalfont\normalsize\itshape}}%
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}
\if@twocolumn
%V.0.3
  \setlength\leftmargini  {0.67in}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
			   
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
%V.0.5
\if@titlepage
  \newenvironment{abstract}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \bfseries \abstractname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}
\else
  \newenvironment{abstract}{%
      \if@twocolumn
%V.0.3 
        \small\bfseries\textit{\abstractname}---\relax
      \else
        \small
        \begin{center}%	
          {\bfseries\abstractname\vspace{-0.5}\vspace{\z@}}%
        \end{center}%
        \quotation
      \fi}
      {\if@twocolumn\else\endquotation\fi}
	\newenvironment{indexterms}{
		\vskip 0.5\baselineskip
		\small
		\bfseries
		\textit{\indextermsname}---\relax
	}
\fi
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\newenvironment{titlepage}
    {%
      \@restonecoltrue\onecolumn
	  % V.1.1 from empty to headings
      \thispagestyle{headings}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\newcommand\appendix{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \gdef\thesection{\@Alph\c@section}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand \theequation {\@arabic\c@equation}
\newcounter{figure}
\renewcommand \thefigure {\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\tiny\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}
\renewcommand\thetable{\@Roman\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tiny\tablename\nobreakspace\thetable.}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{0\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1 #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{3}
\newcommand\tableofcontents{%
    \section*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty\@secpenalty
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
       \if@compatibility
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
      \fi
    \endgroup
  \fi}
\newcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
\newcommand*\l@subsection{\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{3.8em}{3.2em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{7.0em}{4.1em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{10em}{5em}}
\newcommand\listoffigures{%
    \section*{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \section*{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\section*{\refname}%
      %V.1.3 - Correct markboth in the bibliography
      \list{\tiny\@biblabel{\@arabic\c@enumiv}}%
           {\tiny\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\section*{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
				%V.1.2
                \thispagestyle{myheadings}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
% V.1.2
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
	%V.0.5
    \hb@xt@1.8em{#1}}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\refname{References}
\newcommand\indexname{Index}
\newcommand\figurename{Fig.}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
%V.0.3
\newcommand\indextermsname{Index Terms}
%
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
%V.0.3 from plain to headings
%V.1.1 from headings to myheadings
\pagestyle{myheadings}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi
\endinput
%%
%% End of file `JICS_LaTexGuidelines.cls'.
