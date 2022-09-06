%% polyu-presentation.cls
%% Copyright 2022 Tom M. Ragonneau
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Tom M. Ragonneau.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{polyu-presentation}[2022/09/06 PolyU presentation document class]

% Load beamer class as basis
\PassOptionsToPackage{usenames,dvipsnames}{xcolor}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass[10pt]{beamer}

% Manage frame numbering in appendices
\RequirePackage{appendixnumberbeamer}

% Beamer theme and color theme
\usetheme{Boadilla}
\usecolortheme{seahorse}
\usefonttheme{professionalfonts}
\setbeamercolor{alerted text}{fg=DarkOrchid}

% Modify beamer default template
\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{itemize items}[triangle]

% Put only the numbered sections in the table of contents
\setbeamertemplate{section in toc}[sections numbered]

% Latin fonts
\RequirePackage[T1]{fontenc}
\RequirePackage{fontspec}
\setsansfont{FiraSans}[%
    Path=fonts/fira-sans/,%
    Extension=.otf,%
    UprightFont=*-Light,%
    BoldFont=*-SemiBold,%
    ItalicFont=*-LightItalic,%
    BoldItalicFont=*-SemiBoldItalic,%
]
\setmonofont{FiraMono}[%
    Path=fonts/fira-mono/,%
    Extension=.otf,%
    UprightFont=*-Regular,%
    BoldFont=*-Bold,%
]

% Bibliography information processing
\usepackage[%
    style=authoryear-comp,%
    sorting=nyt,%
    maxnames=2,%
    sortcites=false,%
]{biblatex}
\defbibenvironment{bibliography}{%
	\list{}{%
        \settowidth\labelwidth{\usebeamertemplate{bibliography item}}%
        \setlength\leftmargin{\labelwidth}%
        \setlength\itemindent{-\leftmargin}%
        \addtolength\leftmargin{\leftmargin}%
        \setlength\labelsep{\biblabelsep}%
        \addtolength\leftmargin{\labelsep}%
        \setlength\bibitemsep{\itemsep}%
        \setlength\parsep{\bibparsep}%
	}%
}{\endlist}{\item}
\setbeamertemplate{bibliography item}[default]
\DeclareNameAlias{author}{family-given}

% Place a partial table of contents at the beginning of each section
\AtBeginSection[]{%
	\begin{frame}
        \frametitle{Table of contents}
		\tableofcontents[currentsection,hideallsubsections]
	\end{frame}%
}

% Email field
\newcommand{\email}[1]{\href{mailto:#1}{\texttt{\texorpdfstring{\usebeamercolor[fg]{structure}#1}{#1}}}}

% Patch warning `Package hyperref Warning: Token not allowed in a PDF string (Unicode)'
\pdfstringdefDisableCommands{\def\translate#1{#1}}
