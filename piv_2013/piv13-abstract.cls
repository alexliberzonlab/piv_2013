%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% `piv11.cls' file
%% Adapted by Christian Poelma for PIV13
%% Adapted by Jun Sakakibara for PIV11
%% Adapted by Julio Soria for PIV09
%% Created by C.H. Atkinson for the
%% Australaian Conference on Laser Diagnostics in Fluid Mechanics and Combustion
%% adpated from the 16th afmc template by P.V. Lanspeary
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{piv13}[09/08/2013 PIV13 article class]

% DECLARE TEMPLATE OPTIONS
\DeclareOption{onecolumn}{\OptionNotUsed}
\DeclareOption{11pt}{\OptionNotUsed}
\DeclareOption{12pt}{\OptionNotUsed}
\DeclareOption{letterpaper}{\OptionNotUsed}
\DeclareOption{legalpaper}{\OptionNotUsed}
\DeclareOption{executivepaper}{\OptionNotUsed}
\DeclareOption{a5paper}{\OptionNotUsed}
\DeclareOption{b5paper}{\OptionNotUsed}
\DeclareOption{titlepage}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

\LoadClass[a4paper,10pt,onecolumn,notitlepage]{article}
\usepackage{pslatex}

%% PAGE LAYOUT
\renewcommand{\columnsep}{10mm}
\setlength{\textheight}{248mm}
\setlength{\textwidth}{170mm}
\setlength{\oddsidemargin}{-5.4mm}    % 30 mm left margin on 1st page
\setlength{\evensidemargin}{-5.4mm}   % 20 mm left margin on 2nd page
\setlength{\topmargin}{10mm}
\setlength{\headsep}{-5mm}

%% FONT SIZES
\renewcommand{\normalsize}{\fontsize{9}{9}\selectfont}
\newcommand{\authorsize}{\fontsize{10}{10}\selectfont}
\newcommand{\titlesize}{\fontsize{14}{14}\selectfont}

%% SECTIONS       

\renewcommand{\section}{\@ifstar\unnumberedsection\numberedsection}
\def\numberedsection#1{\vspace{1.0ex}%
                           {\refstepcounter{section} \rmfamily \bfseries \normalsize {\thesection. #1}}%
                           \par \vspace{0.5ex}}                          
\def\unnumberedsection#1{\vspace{1.0ex}%
                           {\refstepcounter{section} \addtocounter{section}{-1} \rmfamily \bfseries \normalsize{#1}}%
                           \par \vspace{0.5ex}}
\renewcommand{\subsection}[1]{\vspace{1.0ex}%
                              {\refstepcounter{subsection} \rmfamily \normalsize{\emph{\thesubsection \hspace{5pt} #1}}}
			   \par \vspace{-1.7ex}}
\renewcommand{\subsubsection}[1]{\typeout{Please do not use paragraph!}\par}
\renewcommand{\paragraph}[1]{\typeout{Please do not use paragraph!}\par}
\renewcommand{\subparagraph}[1]{\typeout{Please do not use subparagraph!}\par}

%% FIGURES AND TABLES

\renewcommand{\fnum@figure}{\textbf{\sffamily Figure \thefigure}}
\renewcommand{\fnum@table}{\textbf{\sffamily Table \thetable}}


%% ITEMIZE
\renewcommand{\labelitemi}{$\bullet$ \hspace{5pt}}


%% ABSTRACT
\renewenvironment{abstract}{\section*{ABSTRACT}}{}
\setcounter{secnumdepth}{0}

\pagestyle{empty}	% no headings or page numbers

\newcommand{\ps@pivhead}{%
  \renewcommand{\@oddhead}{\setlength{\unitlength}{1pt}%
    \renewcommand{\baselinestretch}{1.00}%
    \begin{picture}(-0,0)(0,0)
    \put(0,20){\parbox{120mm}{\rmfamily \mdseries \normalsize 10TH INTERNATIONAL SYMPOSIUM ON PARTICLE IMAGE VELOCIMETRY - PIV13\\
	 Delft, The Netherlands, July 1-3, 2013\\
         }}
    \end{picture}}
  \renewcommand{\@evenhead}{}
  \renewcommand{\@oddfoot}{}
  \renewcommand{\@evenfoot}{}
}


\raggedbottom
%
% define paragraph format
\setlength{\parindent}{0.0em}
\setlength{\parskip}{2.0ex}
\setlength{\textfloatsep}{16pt plus 2pt minus 4pt}
\renewcommand{\baselinestretch}{1.15}
%


%
% set-up definitions for title (pinched from emac98.sty)
%
\def\affiliation#1{\gdef\@affiliation{#1}}
\gdef\@affiliation{}
\renewcommand{\maketitle}{\par
  \begingroup
    \renewcommand{\thefootnote}{\fnsymbol{footnote}}%
     \def\@makefnmark{\hbox to\z@{$\m@th^{\@thefnmark}$\hss}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hbox to1.8em{\hss$\m@th^{\@thefnmark}$}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{pivhead}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \let\thanks\relax
\let\maketitle\relax \let\@maketitle\relax \gdef\@affiliation{}
 \gdef\@thanks{}\gdef\@author{}\gdef\@title{}\let\thanks\relax}
\def\@maketitle{%
  \newpage
 \null
 \begin{center}%
%  \vskip -2.5em%
   {\sffamily \bfseries \titlesize \@title \par}%
   \vskip 1.5em%
   {\sffamily \bfseries \authorsize \@author \par}%
   \vskip 1.5em%
   {\sffamily \mdseries \authorsize \@affiliation \par}%
 \end{center}%
 \par
 \vskip 1.0em}

\def\refname{\rmfamily \bfseries \normalsize REFERENCES}

\renewenvironment{thebibliography}[1]
     {\vspace{1.0ex}%
      \section*{\refname
        \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}}%
      \par \vspace{-2.0ex}%
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

%
% ignore requests for tableofcontents, listoffigures, listoftables.
% Discourage index.
%
\renewcommand{\tableofcontents}
             {\typeout{Request for tableofcontents is ignored.}}
\renewcommand{\listoffigures}
             {\typeout{Request for listoffigures is ignored.}}
\renewcommand{\listoftables}
             {\typeout{Request for listoftables is ignored.}}
\renewenvironment{theindex}
               {\typeout{Please do not put an index in your paper!}
                \if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\section{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}


