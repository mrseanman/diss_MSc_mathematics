\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{guthesis}[2013/08/01 GU Thesis (JJCN/AJB)]
\DeclareOption{phd} {
  \def\d@greename{Doctor of Philosophy}
}

\DeclareOption{msc} {
  \def\d@greename{Master of Science}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ExecuteOptions{msc}
\ProcessOptions

\LoadClass[11pt,oneside]{book}
\RequirePackage{cite,amsmath,amsfonts}

%A4 width and height
\setlength{\textwidth}{8.276in} \setlength{\textheight}{11.705in}
%Allow 20mm + 40mm margins and nothing else
\addtolength{\textwidth}{-60mm} \addtolength{\textheight}{-60mm}
\setlength{\oddsidemargin}{-1in}\addtolength{\oddsidemargin}{40mm}
\setlength{\evensidemargin}{\oddsidemargin}
\setlength{\topmargin}{0pt} \addtolength{\topmargin}{-\headheight}
\addtolength{\topmargin}{-\headsep}
\renewcommand{\baselinestretch}{1.4} % should be 1.5
\renewcommand{\bibname}{References}
\renewenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
     \addcontentsline{toc}{chapter}%
                                   {\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
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

\newcommand\submissionmonth[1]{\def\m@nth{#1}}
\newcommand\submissionyear[1]{\def\ye@r{#1}}
\newcommand\copyrightto[1]{\def\c@pyright{\copyright\;#1\ \ye@r}}
\let\c@pyright\relax
\renewcommand\maketitle{\begin{titlepage}
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 20\p@
  \begin{center}
    {\Huge\bf \@title \par}
    \vskip 3em
    {\Large
     \lineskip .75em
      \begin{tabular}[t]{c}
        by\\
        \lineskip 3em
        \lineskip 3em
        \bf\@author\\[12pt]
        \lineskip 3em
        \lineskip 3em
        A thesis submitted to the\\
        College of Science and Engineering\\
        at the University of Glasgow\\
        for the degree of\\
        \d@greename\\
      \end{tabular}\par}
      \vskip 8.5em
      \vskip 3em
    {\large \m@nth\ \ye@r \par}
    \vskip 3.5em
    \c@pyright
  \end{center}\par
  \vfil\null
  \end{titlepage}
}

%
% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.
% Stolen from Oxford thesis class.

\newenvironment{alwayssingle}{%
       \@restonecolfalse
       \if@twocolumn\@restonecoltrue\onecolumn
       \else\if@openright\cleardoublepage\else\clearpage\fi
       \fi}%
       {\if@restonecol\twocolumn
       \else\newpage\thispagestyle{empty}\fi}

\newenvironment{dedication}
{\begin{alwayssingle}
  \thispagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE }
  \end{center}
  \vspace{0.5cm}
  \begin{verse}\begin{center}}
{\end{center}\end{verse}\end{alwayssingle}}

\endinput
