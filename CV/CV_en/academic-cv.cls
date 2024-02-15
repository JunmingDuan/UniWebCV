%% Start of file `academic-cv.cls'.
% Academic CV Class File
%
% This class has been downloaded from:
% https://github.com/posquit0/Awesome-CV
% And modified by Jessi Rick <jrick@uwyo.edu>
% And modified by Junming Duan <duan.junming@icloud.com>
%

%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{academic-cv}[2019/03/08 v1.0 Academic Curriculum Vitae Class]
\NeedsTeXFormat{LaTeX2e}


%-------------------------------------------------------------------------------
%                Class options
%
%-------------------------------------------------------------------------------
% Options for draft or final
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}

% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}


%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
% Needed to make fixed length table
\RequirePackage{array}
% Needed to make long table
\RequirePackage{ltxtable}
% Needed to handle list environment
\RequirePackage{enumitem}
% Needed to handle text alignment
\RequirePackage{ragged2e}
% Needed to configure page layout
\RequirePackage{geometry}
% Needed to make header & footer effeciently
\RequirePackage{fancyhdr}
% Needed to manage colors
\RequirePackage{xcolor}
% Needed to use \ifxetex-\else-\fi statement
\RequirePackage{ifxetex}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
% Needed to use a toolbox of programming tools
\RequirePackage{etoolbox}
% Needed to change line spacing in specific environment
\RequirePackage{setspace}
% Needed to manage fonts
\RequirePackage[quiet]{fontspec}
% To support LaTeX quoting style
\defaultfontfeatures{Ligatures=TeX}
% Needed to manage math fonts
\RequirePackage{unicode-math}
% Needed to use icons from font-awesome
% (https://github.com/posquit0/latex-fontawesome)
\RequirePackage{fontawesome5}
\RequirePackage[default,opentype]{sourcesanspro}
% Needed for the photo ID
\RequirePackage[skins]{tcolorbox}
% Needed to deal a paragraphs
\RequirePackage{parskip}
% Needed to deal hyperlink
\RequirePackage[hidelinks,unicode]{hyperref}
\hypersetup{%
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={}
}
% Needed for hanging indents
\RequirePackage{hanging}

\RequirePackage{lastpage}

%-------------------------------------------------------------------------------
%                Configuration for directory locations
%-------------------------------------------------------------------------------
% Configure a directory location for fonts(default: 'fonts/')
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir


%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------
%% Page Layout
% Configure page margins with geometry
% these are defaults, but can be modified in the cv.tex file
\geometry{left=0.75in, top=0.75in, right=0.75in, bottom=0.75in, footskip=.5cm}

%% Header & Footer
% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}


%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------
% Gray-scale colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
% Basic colors
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
% Text colors
\colorlet{text}{black}
\colorlet{darktext}{black}
\colorlet{graytext}{black}
\colorlet{lighttext}{black}

% Boolean value to switch section color highlighting
\newbool{acvSectionColorHighlight}
\setbool{acvSectionColorHighlight}{false}

% Awesome section color
\def\@sectioncolor#1#2#3{%
  \ifbool{acvSectionColorHighlight}{{\color{awesome}#1#2#3}}{#1#2#3}%
}


%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------
% Set the FontAwesome font to be up-to-date.
%\newfontfamily\FA[Path=./fonts/]{FontAwesome}
% Set font for header (default is Roboto)
\newfontfamily\headerfont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{Roboto}

\newfontfamily\headerfontlight[
  Path=\@fontdir,
  UprightFont=*-Thin,
  ItalicFont=*-ThinItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{Roboto}

\newcommand*{\footerfont}{\sourcesanspro}
\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesansprolight}

%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------
% Configure styles for each CV elements
% For fundamental structures
% here, you can modify colors, sizes, and fonts for each type of text
\newcommand*{\headerfirstnamestyle}[1]{{\fontsize{24pt}{1em}\headerfont\color{graytext} #1}}
\newcommand*{\headerlastnamestyle}[1]{{\fontsize{24pt}{1em}\headerfont\color{text} #1}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{14pt}{1em}\bodyfont\scshape\color{darktext} #1}}
\newcommand*{\headeraddressstyle}[1]{{\fontsize{9pt}{1em}\headerfont\itshape\color{lighttext} #1}}
\newcommand*{\headersocialstyle}[1]{{\fontsize{8pt}{1em}\headerfont\color{text} #1}}
\newcommand*{\headerquotestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\itshape\color{darktext} #1}}
\newcommand*{\footerstyle}[1]{{\fontsize{8pt}{1em}\footerfont\scshape\color{lighttext} #1}}
\newcommand*{\sectionstyle}[1]{{\fontsize{14pt}{1em}\bodyfont\color{text}\@sectioncolor #1}}
\newcommand*{\subsectionstyle}[1]{{\fontsize{12pt}{1em}\bodyfont\scshape\textcolor{text}{#1}}}
\newcommand*{\paragraphstyle}{\fontsize{9pt}{1em}\bodyfontlight\color{text}}

% % For elements of entry
% \newcommand*{\entrytitlestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
% \newcommand*{\entrypositionstyle}[1]{{\fontsize{10pt}{1em}\bodyfont\scshape\color{graytext} #1}}
% \newcommand*{\entrydatestyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\slshape\color{graytext} #1}}
% \newcommand*{\entrylocationstyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\slshape\color{darktext} #1}}
% \newcommand*{\descriptionstyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\upshape\color{text} #1}}

% For elements of subentry
\newcommand*{\subentrytitlestyle}[1]{{\fontsize{8pt}{1em}\bodyfont\mdseries\color{graytext} #1}}
\newcommand*{\subentrypositionstyle}[1]{{\fontsize{8pt}{1em}\bodyfont\scshape\color{graytext} #1}}
\newcommand*{\subentrydatestyle}[1]{{\fontsize{8pt}{1em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\subentrylocationstyle}[1]{{\fontsize{8pt}{1em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\subdescriptionstyle}[1]{{\fontsize{8pt}{1em}\bodyfontlight\upshape\color{text} #1}}

% For elements of entry
\newcommand*{\entrytitlestyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\bfseries\color{darktext} #1}}
\newcommand*{\entrylocationstyle}[1]{{\fontsize{10pt}{1em}\bodyfont\color{graytext} #1}}
\newcommand*{\entrydescriptionstyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\entrydatestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\color{text} #1}}

% For elements of publication
\newcommand*{\pubtitlestyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\bfseries\color{darktext} #1}}
\newcommand*{\pubjournalstyle}[1]{{\fontsize{10pt}{1em}\bodyfont\slshape\bfseries\color{darktext} #1}}
\newcommand*{\pubdescriptionstyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\pubdatestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\color{text} #1}}
\newcommand*{\pubauthorstyle}[1]{{\fontsize{10pt}{1em}\bodyfont\color{darktext} #1}}
\newcommand*{\pubauthorselfstyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}

% For elements of reference
\newcommand*{\referencenamestyle}[1]{{\fontsize{11pt}{1em}\bodyfontlight\bfseries\color{text} #1}}
\newcommand*{\referencelocationstyle}[1]{{\fontsize{10pt}{1em}\bodyfont\color{text} #1}}
\newcommand*{\referenceemailstyle}[1]{{\fontsize{10pt}{1em}\bodyfont\color{text} #1}}

%-------------------------------------------------------------------------------
%                Commands for personal information
%-------------------------------------------------------------------------------
% Define photo ID
% Usage: \photo[circle|rectangle,edge|noedge,left|right]{<path-to-image>}
\newcommand{\photo}[2][circle,edge,left]{%
  \def\@photo{#2}
  \@for\tmp:=#1\do{%
    \ifthenelse{\equal{\tmp}{circle} \or \equal{\tmp}{rectangle}}%
    {\let\@photoshape\tmp}{}%
    \ifthenelse{\equal{\tmp}{edge} \or \equal{\tmp}{noedge}}%
    {\let\@photoedge\tmp}{}%
    \ifthenelse{\equal{\tmp}{left} \or \equal{\tmp}{right}}%
    {\let\@photoalign\tmp}{}%
  }%
}
\def\@photoshape{circle}
\def\@photoedge{edge}
\def\@photoalign{left}

% Define writer's name
% Usage: \name{<firstname>}{<lastname>}
% Usage: \firstname{<firstname>}
% Usage: \lastname{<lastname>}
% Usage: \familyname{<familyname>}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\def\@familyname{\@lastname}

% Define writer's address
% Usage: \address{<address>}
\newcommand*{\address}[1]{\def\@address{#1}}

% Define writer's position
% Usage: \name{<position>}
\newcommand*{\position}[1]{\def\@position{#1}}

% Defines writer's mobile (optional)
% Usage: \mobile{<mobile number>}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}

% Defines writer's phone (optional)
% Usage: \phone{<phone number>}
\newcommand*{\phone}[1]{\def\@phone{#1}}

% Defines writer's email (optional)
% Usage: \email{<email adress>}
\newcommand*{\email}[1]{\def\@email{#1}}

% Defines writer's homepage (optional)
% Usage: \homepage{<url>}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}

% Defines writer's orcid (optional)
% Usage: \orcid{<url>}
\newcommand*{\orcid}[1]{\def\@orcid{#1}}

% Defines writer's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\def\@github{#1}}

% Defines writer's gitlab (optional)
% Usage: \gitlab{<gitlab-nick>}
\newcommand*{\gitlab}[1]{\def\@gitlab{#1}}

% Defines writer's stackoverflow profile (optional)
% Usage: \stackoverflow{<so userid>}{<so username>}
%   e.g.https://stackoverflow.com/users/123456/sam-smith
%       would be \stackoverflow{123456}{sam-smith}
\newcommand*{\stackoverflow}[2]{\def\@stackoverflowid{#1}\def\@stackoverflowname{#2}}

% Defines writer's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}

% Defines writer's twitter handle (optional)
% Usage: \twitter{<twitter handle>}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}

% Defines writer's skype (optional)
% Usage: \skype{<skype account>}
\newcommand*{\skype}[1]{\def\@skype{#1}}

% Defines writer's reddit (optional)
% Usage: \reddit{<reddit account>}
\newcommand*{\reddit}[1]{\def\@reddit{#1}}

% Defines writer's xing (optional)
% Usage: \xing{<xing name>}
\newcommand*{\xing}[1]{\def\@xing{#1}}

% Defines writer's extra informations (optional)
% Usage: \extrainfo{<extra informations>}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}

%-------------------------------------------------------------------------------
%                Commands for extra
%-------------------------------------------------------------------------------
%% Define helper macros a user can change easily
% Header
% here, you can change the spacing in the header information
\newcommand{\acvHeaderNameDelim}{\space}
\newcommand{\acvHeaderAfterNameSkip}{2mm}
\newcommand{\acvHeaderAfterPositionSkip}{2mm}
\newcommand{\acvHeaderAfterAddressSkip}{-.5mm}
\newcommand{\acvHeaderIconSep}{\space\space}
\newcommand{\acvHeaderSocialSep}{\quad\textbar\quad}
\newcommand{\acvHeaderAfterSocialSkip}{6mm}
\newcommand{\acvHeaderAfterQuoteSkip}{5mm}

% Others
% this defines the spacing between each section
\newcommand{\acvSectionTopSkip}{3mm}
\newcommand{\acvSectionContentTopSkip}{2.5mm}


%-------------------------------------------------------------------------------
%                Commands for utilities
%-------------------------------------------------------------------------------
% Use to align an element of tabular table
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{Q}{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}X}
% \newcolumntype{P}{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}X}

% Use to draw horizontal line with specific thickness
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

% Use to execute conditional statements by checking empty string
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}

%-------------------------------------------------------------------------------
%                Commands for elements of CV structure
%-------------------------------------------------------------------------------
% Define a header for CV
% Usage: \makecvheader
\newcommand*{\makecvheader}[1][C]{%
  \newcommand*{\drawphoto}{%
    \ifthenelse{\isundefined{\@photo}}{}{%
      \newlength{\photodim}
      \ifthenelse{\equal{\@photoshape}{circle}}%
      {\setlength{\photodim}{1.3cm}}%
      {\setlength{\photodim}{1.8cm}}%
      \ifthenelse{\equal{\@photoedge}{edge}}%
      {\def\@photoborder{darkgray}}%
      {\def\@photoborder{none}}%
      \begin{tikzpicture}%
        \node[\@photoshape, draw=\@photoborder, line width=0.3mm, inner sep=\photodim, fill overzoom image=\@photo] () {};
      \end{tikzpicture}
    }%
  }
  \newlength{\headertextwidth}
  \newlength{\headerphotowidth}
  \ifthenelse{\isundefined{\@photo}}{
    \setlength{\headertextwidth}{\textwidth}
    \setlength{\headerphotowidth}{0cm}
  }{%
    \setlength{\headertextwidth}{0.76\textwidth}
    \setlength{\headerphotowidth}{0.24\textwidth}
  }%
  \begin{minipage}[c]{\headerphotowidth}%
    \ifthenelse{\equal{\@photoalign}{left}}{\raggedright\drawphoto}{}
  \end{minipage}
  \begin{minipage}[c]{\headertextwidth}
    \ifthenelse{\equal{#1}{L}}{\raggedright}{\ifthenelse{\equal{#1}{R}}{\raggedleft}{\centering}}
    \headerfirstnamestyle{\@firstname}\headerlastnamestyle{{}\acvHeaderNameDelim\@lastname}%
    \\[\acvHeaderAfterNameSkip]%
    \ifthenelse{\isundefined{\@position}}{}{\headerpositionstyle{\@position\\[\acvHeaderAfterPositionSkip]}}%
    \ifthenelse{\isundefined{\@address}}{}{\headeraddressstyle{\@address\\[\acvHeaderAfterAddressSkip]}}%
    \headersocialstyle{%
      \newbool{isstart}%
      \setbool{isstart}{true}%
      \ifthenelse{\isundefined{\@mobile}}%
      {}%
      {%
        \faMobile\acvHeaderIconSep\@mobile%
        \setbool{isstart}{false}%
      }%
      \ifthenelse{\isundefined{\@phone}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \faPhoneSquare\acvHeaderIconSep\@phone%
      }%
      \ifthenelse{\isundefined{\@email}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{mailto:\@email}{\faEnvelope\acvHeaderIconSep\@email}%
      }%
      \ifthenelse{\isundefined{\@homepage}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{https://\@homepage}{\faHome\acvHeaderIconSep\@homepage}%
      }%
      \ifthenelse{\isundefined{\@orcid}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{https://orcid.org/\@orcid}{\faOrcid\acvHeaderIconSep\@orcid}%
      }%
      \ifthenelse{\isundefined{\@github}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{https://github.com/\@github}{\faGithubSquare\acvHeaderIconSep\@github}%
      }%
      \ifthenelse{\isundefined{\@gitlab}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{https://gitlab.com/\@gitlab}{\faGitlab\acvHeaderIconSep\@gitlab}%
      }%
      \ifthenelse{\isundefined{\@stackoverflowid}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{https://stackoverflow.com/users/\@stackoverflowid}{\faStackOverflow\acvHeaderIconSep\@stackoverflowname}%
      }%
      \ifthenelse{\isundefined{\@linkedin}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{https://www.linkedin.com/in/\@linkedin}{\faLinkedinSquare\acvHeaderIconSep\@linkedin}%
      }%
      \ifthenelse{\isundefined{\@twitter}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{https://twitter.com/\@twitter}{\faTwitter\acvHeaderIconSep\@twitter}%
      }%
      \ifthenelse{\isundefined{\@skype}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \faSkype\acvHeaderIconSep\@skype%
      }%
      \ifthenelse{\isundefined{\@reddit}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{https://www.reddit.com/user/\@reddit}{\faReddit\acvHeaderIconSep\@reddit}%
      }%
      \ifthenelse{\isundefined{\@xing}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \href{https://www.xing.com/profile/\@xing}{\faXingSquare\acvHeaderIconSep\@xing}
      }%
      \ifthenelse{\isundefined{\@extrainfo}}%
      {}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
        \@extrainfo%
      }%
    } \\[\acvHeaderAfterSocialSkip]%
    \ifthenelse{\isundefined{\@quote}}%
    {}%
    {\headerquotestyle{\@quote\\}\vspace{\acvHeaderAfterQuoteSkip}}%
  \end{minipage}%
  \begin{minipage}[c]{\headerphotowidth}%
    \ifthenelse{\equal{\@photoalign}{right}}{\raggedleft\drawphoto}{}
  \end{minipage}
}

% Define a footer for CV
% Usage: \makecvfooter{<left>}{<center>}{<right>}
\newcommand*{\makecvfooter}[3]{%
  \fancyfoot{}
  \fancyfoot[L]{\footerstyle{#1}}
  \fancyfoot[C]{\footerstyle{#2}}
  \fancyfoot[R]{\footerstyle{#3}}
}

\newcommand{\makesection}[1]{
  \LTXtable{\linewidth}{#1}
  \vspace{-4mm}
}
% Define a section environment for CV
% Usage: \begin{cvsection}{<section-title>} ... \end{cvsection}

%\renewcommand{\arraystretch}{8.0}
\setlength\tabcolsep{0pt}
\setlength{\extrarowheight}{0pt}
\newenvironment{cvsection}[2]{%
% \gdef\@nextentry{}%
% \global\let\old@newpage\newpage%
% \global\let\old@pagebreak\pagebreak%
% \global\let\old@nopagebreak\oldpagebreak
  %\vspace{\acvSectionTopSkip}
% \vspace{\acvSectionContentTopSkip}
%\parskip=-40pt
%\baselineskip=80pt
  \begin{longtable}{@{} #2 @{}}
    \multicolumn{2}{@{}l@{}}{\sectionstyle{#1} {\color{gray}\vhrulefill{0.9pt}}}  \\
    \endfirsthead
    \multicolumn{2}{@{}l@{}}{\sectionstyle{#1 (continued)} {\color{gray}\vhrulefill{0.9pt}}}  \\
    \endhead%
% \noalign{%
    % \global\let\in@newpage\newpage%
    % \global\let\in@pagebreak\pagebreak%
    % \global\let\in@nopagebreak\nopagebreak%
    % \gdef\newpage{\@nextentry\noalign{\gdef\@nextentry{}}\in@newpage}%
    % \gdef\pagebreak{\@nextentry\noalign{\gdef\@nextentry{}}\in@pagebreak}%
    % \gdef\nopagebreak{\@nextentry\noalign{\gdef\@nextentry{}}\in@nopagebreak}}
  }{%
  \end{longtable}%
  %\vspace{-4mm}
% \global\let\newpage\old@newpage%
% \global\let\pagebreak\old@pagebreak%
% \global\let\oldpagebreak\old@nopagebreak
}

\newcounter{pubenum}
\newcommand*{\pubenum}{\thepubenum.\stepcounter{pubenum}}

\newcommand{\makepublication}[1]{%
  \sectionstyle{Research Publications} {\color{gray}\vhrulefill{0.9pt}} \\ 
  \setcounter{pubenum}{1}
  \input{#1}
}

\newenvironment{cvpublicationsection}[1]{%
  \subsectionstyle{#1} \\
  \setlength{\parskip}{0pt}
  \vspace{-5mm}
  \begin{enumerate}%
      \raggedright
    }{%
  \end{enumerate}%
  %\vspace{-2mm}
}

% Define a subsection for CV
% Usage: \cvsubsection{<subsection-title>}
\newcommand{\cvsubsection}[1]{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-3mm}
  \subsectionstyle{#1}
  \phantomsection
}

% Define a paragraph for CV
\newenvironment{cvparagraph}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-3mm}
  \paragraphstyle
}{%
  \par
  \vspace{2mm}
}

% % Define an environment for cventry
% \newenvironment{cventries}{%
%   \vspace{\acvSectionContentTopSkip}
%   \begin{center}
% }{%
%   \end{center}
% }

% Define a line of cv entry
% Usage: \cventry{<date>}{<title>}{<location>}{<description>}
\newcommand*{\cventry}[4]{%
  \entrytitlestyle{#2} | \entrylocationstyle{#3} \ifthenelse{\equal{#4}{}}{}{ | \entrydescriptionstyle{#4}} & \entrydatestyle{#1}\\
}

% Define a line of cv position entry
% Usage: \cvposentry{<date>}{<title>}{<location>}{<mentor>}
\newcommand*{\cvposentry}[4]{%
  \entrydatestyle{#1} & \entrytitlestyle{#2} \newline \entrylocationstyle{#3} \newline \entrydescriptionstyle{#4} \\
}

% Define a line of cv education entry
% Usage: \cveduentry{<date>}{<title>}{<location>}{<thesis>}{<advisor>}
\newcommand*{\cveduentry}[5]{%
  \entrydatestyle{#1} & \entrytitlestyle{#2} \newline \entrylocationstyle{#3} \ifstrempty{#4}{}{\newline \entrydescriptionstyle{#4} \newline \entrydescriptionstyle{#5}}  \\
}

% Define a line of cv interest entry
% Usage: \cvintentry{<title>}
\newcommand*{\cvintentry}[1]{%
  {\fontsize{8pt}{1em}{\faBookmark}} & \entrylocationstyle{#1}\\
}

% Define a line of cv publication entry
% Usage: \cvpubentry{<author>}{<title>}{<journal>}{<volume: page, year>}{<arXiv>}{<url>}{<description>}
\newcommand*{\cvpubentry}[7]{%
  \entrypubdatestyle{#1} & \entrytitlestyle{#2} \newline \entrylocationstyle{#3} \newline \entrydescriptionstyle{#4} \\
}

% Define a line of cv honor entry
% Usage: \cvhonorentry{<date>}{<title>}{<location>}
\newcommand*{\cvhonorentry}[3]{%
  \entrytitlestyle{#2} | \entrylocationstyle{#3} & \entrydatestyle{#1} \\
}

% Define a line of cv supervision entry
% Usage: \cvsupentry{<date>}{<title>}{<location>}
\newcommand*{\cvsupentry}[3]{%
  \entrytitlestyle{#2} | \entrylocationstyle{#3} & \entrydatestyle{#1} \\
}

% Define a line of cv conference entry
% Usage: \cvprojectentry{<date>}{<title>}{<detail>}{<organization>}{<description>}
\newcommand*{\cvconferenceentry}[4]{%
  \entrytitlestyle{#2} | \entrylocationstyle{#3}
  \ifthenelse{\equal{#4}{}}{}{\newline \entrydescriptionstyle{#4}} & \entrydatestyle{#1} \\
}

% Define a line of cv project entry
% Usage: \cvprojectentry{<date>}{<title>}{<detail>}{<organization>}{<description>}
\newcommand*{\cvprojectentry}[5]{%
  \entrytitlestyle{#2}: \entrylocationstyle{#3} \newline
  \entrydescriptionstyle{Supported by #4 |} \entrydescriptionstyle{#5} & \entrydatestyle{#1} \\
}

% Define a line of cv reference entry
% Usage: \cvprojectentry{<name>}{<department>}{<university>}{<location>}{<email>}
\newcommand*{\cvrefentry}[5]{%
  \begin{minipage}[c]{0.48\textwidth}
    \vspace{1mm}
    \referencenamestyle{#1}\newline \referencelocationstyle{#2} \newline \referencelocationstyle{#3} \newline \referencelocationstyle{#4} \newline \href{mailto:\@email}{{\fontsize{8pt}{1em}{\faEnvelope}}\acvHeaderIconSep \referenceemailstyle{#5}}
  \end{minipage}
}


% % Define an entry of cv information
% % Usage: \cventry{<position>}{<title>}{<location>}{<date>}{<description>}
% \newcommand*{\cventry}[5]{%
%   \vspace{-2.0mm}
%   \setlength\tabcolsep{0pt}
%   \setlength{\extrarowheight}{0pt}
%   \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
%     \ifempty{#2#3}
%       {\entrypositionstyle{#1} & \entrydatestyle{#4} \\}
%       {\entrytitlestyle{#2} & \entrylocationstyle{#3} \\
%       \entrypositionstyle{#1} & \entrydatestyle{#4} \\}
%     \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#5}}
%   \end{tabular*}%
% }

% Define an environment for cvsubentry
\newenvironment{cvsubentries}{%
  \begin{center}
  }{%
  \end{center}
}

% Define a subentry of cv information
% Usage: \cvsubentry{<position>}{<title>}{<date>}{<description>}
\newcommand*{\cvsubentry}[4]{%
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \setlength\leftskip{0.2cm}
    \subentrytitlestyle{#2} & \ifthenelse{\equal{#1}{}}
    {\subentrydatestyle{#3}}{}
    \ifthenelse{\equal{#1}{}}
    {}
    {\subentrypositionstyle{#1} & \subentrydatestyle{#3} \\}
    \ifthenelse{\equal{#4}{}}
    {}
    {\multicolumn{2}{L{17.0cm}}{\subdescriptionstyle{#4}} \\}
  \end{tabular*}
}

% Define an environment for cvhonor
\newenvironment{cvhonors}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2mm}
  \begin{center}
    \setlength\tabcolsep{0pt}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} R{1.7cm} L{\textwidth - 4.5cm} R{2cm}}
    }{%
    \end{tabular*}
  \end{center}
}

% Define a line of cv information(honor, award or something else)
% Usage: \cvhonor{<position>}{<title>}{<location>}{<date>}
\newcommand*{\cvhonor}[4]{%
  \honordatestyle{#4} & \honorpositionstyle{#1} | \honortitlestyle{#2} & \honorlocationstyle{#3} \\
}

% Define an environment for cvskill
\newenvironment{cvskills}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2.0mm}
  \begin{center}
    \setlength\tabcolsep{1ex}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} R{1.7cm} L{\textwidth * \real{0.9}}}
    }{%
    \end{tabular*}
  \end{center}
}

% Define a line of cv information(skill)
% Usage: \cvskill{<type>}{<skillset>}
\newcommand*{\cvskill}[3]{%
  \skilltypestyle{#1} & \skillsetstyle{#2}, \skilllocstyle{#3}\\
}

% Define an environment for cvpub
\newenvironment{cvpubs}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2mm}
  \paragraphstyle
}{%
  \par
  \vspace{1mm}
}

% Define a line of cvpub
% Usage: \cvpub{<ciation>}
\newcommand*{\cvpub}[1]{%
  \leftskip 0.7cm
  \parindent -0.7cm
  \pubstyle{#1}
}

% Define an environment for cvitems(for cventry)
\newenvironment{cvitems}{%
  \vspace{-4.0mm}
  \begin{justify}
    \begin{itemize}[leftmargin=2ex, nosep, noitemsep]
        \setlength{\parskip}{0pt}
        \renewcommand{\labelitemi}{\bullet}
      }{%
    \end{itemize}
  \end{justify}
  \vspace{-4.0mm}
}


% 26/09/2023
% Define an environment for cvposition
\newenvironment{cvpositions}{%
  % \vspace{\acvSectionContentTopSkip}
  % \vspace{-2mm}
  % \begin{center}
    % \setlength\tabcolsep{0pt}
    % \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{L{5cm} L{\textwidth - 5cm} }
  }{%
  \end{tabular*}
  % \end{center}
}

% Define a line of cv information(honor, award or something else)
% Usage: \cvposition{<date>}{<title>}{<location>}{<position>}
\newcommand*{\cvposition}[4]{%
  \honordatestyle{#1} & \honorpositionstyle{#2}, \honortitlestyle{#3} \honorlocationstyle{#4} \\
}



