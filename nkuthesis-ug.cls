% email:	aqnin@outlook.com
% brief:	基本实现2022年11月版《南开大学本科毕业论文（设计）指导手册》的格式要求

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nkuthesis-ug}
\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax
\LoadClass[zihao=-4,linespread=1.5]{ctexart}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%                               Basic                                 %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 字体
\setmainfont{Times New Roman}
\setsansfont{Times New Roman Bold}

% 页面设置
\pagestyle{plain}
\RequirePackage[paper=a4paper,vmargin=2.54cm,hmargin=3.17cm,
	headheight=0.75cm,headsep=0.29cm,footskip=0.79cm]{geometry}

% 标题
\RequirePackage{titlesec}
\RequirePackage{pifont}
\RequirePackage{calc}
\setcounter{secnumdepth}{5}
\newcommand{\sectionbreak}{\newpage\vspace*{0pt}}
\renewcommand{\thesection}{\chinese{section}}
\renewcommand{\thesubsection}{（\chinese{subsection}）}
\renewcommand{\thesubsubsection}{\arabic{subsubsection}}
\renewcommand{\theparagraph}{(\arabic{paragraph})}
\renewcommand{\thesubparagraph}{\ding{\numexpr171+\value{subparagraph}}}
\titleformat{\section}{\centering\zihao{-3}\sffamily}{{\thesection}、}{0em}{}
\titleformat{\subsection}{\centering\zihao{4}\sffamily}{\thesubsection}{0em}{}
\titleformat{\subsubsection}{\zihao{-4}\sffamily}{{\thesubsubsection}.}{0.5em}{}
\titleformat{\paragraph}{\zihao{-4}\sffamily}{\theparagraph}{0.5em}{}
\titleformat{\subparagraph}{\zihao{-4}\sffamily}{\thesubparagraph}{0.5em}{}

% 注释
\RequirePackage[perpage,bottom]{footmisc}
\renewcommand{\thefootnote}{\ding{\numexpr171+\value{footnote}}} % 仅 1-10 有效
\RequirePackage{etoolbox}
\patchcmd\@makefntext{{\hss\@makefnmark}}
	{{\hss\hbox{\normalfont\zihao{-5}\@thefnmark}}\enspace}{}{\fail}

% 图、表
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{enspace}{\enspace}
\captionsetup{labelsep=enspace,skip=1pt}
\RequirePackage{flafter} % 浮动体置于引用后，包含h选项后似乎不生效
\RequirePackage[section]{placeins} % 浮动体不跨节

% 超链接、PDF属性
\RequirePackage[hidelinks,pdfa,pdfusetitle]{hyperref}
\hypersetup{pdfsubject={南开大学本科生毕业论文（设计）}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%                      Command & Envirenment                          %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 文档信息：模仿\title \author \date 的使用
\newcommand{\studentid}[1]{\renewcommand{\@studentid}{#1}}
\newcommand{\grade}[1]{\renewcommand{\@grade}{#1}}
\newcommand{\major}[1]{\renewcommand{\@major}{#1}}
\newcommand{\department}[1]{\renewcommand{\@department}{#1}}
\newcommand{\college}[1]{\renewcommand{\@college}{#1}}
\newcommand{\adviser}[1]{\renewcommand{\@adviser}{#1}}
\NewDocumentCommand{\keywords}{sm}{\IfBooleanTF{#1}
	{\renewcommand{\en@keywords}{#2}}
	{\renewcommand{\zh@keywords}{#2}\hypersetup{pdfkeywords={#2}}}}
\RenewDocumentCommand{\title}{sm}{\IfBooleanTF{#1}
	{\renewcommand{\en@title}{#2}}
	{\renewcommand{\zh@title}{#2}\hypersetup{pdftitle={#2}}}}

% 封面
\renewcommand{\maketitle}{
	\begin{titlepage}
		\centering
			\vspace*{25pt}\par\linespread{1}\fontsize{56}{0}
		\textbf{\CJKfamily{fb@song}\makebox[5.5em][s]{南开大学}}\par
			\vspace{35pt}\par\linespread{1}\zihao{2}
		\makebox[255pt][s]{本科生毕业论文（设计）}\par
			\vspace{60pt}\par\linespread{1.2}\zihao{3}
		\begin{tabular}{l@{：}l}
			中文题目 & \ul@t@parbox{16.5em}{\centering\zh@title} \\
			外文题目 & \ul@t@parbox{16.5em}{\centering\en@title} \\
		\end{tabular}
			\vspace{\fill}\par\linespread{1.15}\zihao{3}
		\begin{tabular}{l@{：}l}
			学\hspace{2em}号 &\ul@t@parbox{8em}{\centering\@studentid}  \\
			姓\hspace{2em}名 &\ul@t@parbox{8em}{\centering\@author}     \\
			年\hspace{2em}级 &\ul@t@parbox{8em}{\centering\@grade}      \\
			专\hspace{2em}业 &\ul@t@parbox{8em}{\centering\@major}      \\
			系\hspace{2em}别 &\ul@t@parbox{8em}{\centering\@department} \\
			学\hspace{2em}院 &\ul@t@parbox{8em}{\centering\@college}    \\
			指导教师         & \ul@t@parbox{8em}{\centering\@adviser}    \\
			完成日期         & \ul@t@parbox{8em}{\centering\@date}       \\
		\end{tabular}
			\vspace{\fill}
	\end{titlepage}}

% 声明
\newcommand{\declaration}{
	\nolabel@section*{3}[声明]{关于南开大学本科生毕业论文（设计）的声明}
	本人郑重声明：所呈交的学位论文，是本人在指导教师指导下，进行研究工作所取得的成果。
	除文中已经注明引用的内容外，本学位论文的研究成果不包含任何他人创作的、
	已公开发表或没有公开发表的作品内容。对本论文所涉及的研究工作做出贡献的其他
	个人和集体，均已在文中以明确方式标明。本学位论文原创性声明的法律责任由本人承担。
	\par\bigskip\begin{flushright}
		学位论文作者签名：\hspace*{6em}\medskip\par\@date
	\end{flushright}\vspace{4\baselineskip}\par
	本人声明：该学位论文是本人指导学生完成的研究成果，已经审阅过论文的全部内容，
	并能够保证题目、关键词、摘要部分中英文内容的一致性和准确性。
	\par\bigskip\begin{flushright}
		学位论文指导教师签名：\hspace*{6em}\medskip\par
		年\hspace{2em}月\hspace{2em}日
	\end{flushright}\clearpage}

% 中英摘要
\renewenvironment{abstract}
	{\nolabel@section*{4}[摘要]{摘\hspace{1em}要}}
	{\par\bigskip\par\noindent\textsf{关键词：}\zh@keywords\clearpage}
\newenvironment{abstract*}
	{\nolabel@section*{4}{Abstract}}
	{\par\bigskip\par\noindent\textsf{Keywords:\space}\en@keywords\clearpage}

% 目录
\RequirePackage{titletoc}
\setcounter{tocdepth}{2}
\newcommand{\content@filler}{~\titlerule*[0.83em]{\CJKfamily{fb@song}…}}
\titlecontents{section}[0em]{\zihao{-3}}
	{\thecontentslabel、}{}{\content@filler\contentspage}
\titlecontents{subsection}[2em]{\zihao{4}}
	{\thecontentslabel}{}{\content@filler\contentspage}
\renewcommand{\tableofcontents}
	{\nolabel@section*{3}[目录]{目\hspace{1em}录}\@starttoc{toc}\clearpage}

% 附录
\RenewDocumentCommand{\appendix}{s}{ % 格式存疑
	\IfBooleanTF{#1}{
		\setcounter{section}{0}
		\setcounter{subsection}{0}
		\renewcommand{\thesection}{附录\Alph{section}}
		\addtocontents{toc}{\protect\setcounter{tocdepth}{1}}%
		\titleformat{\section}{\centering\zihao{4}\sffamily}
			{附\hspace{1em}录\Alph{section}：}{0em}{}
		\titlecontents{section}[0em]{\zihao{-3}}{\thecontentslabel：}{}
			{\content@filler\contentspage}
	}{\nolabel@section{4}[附录]{附\hspace{1em}录}}}

% 参考文献
\RequirePackage[sort&compress]{gbt7714}
\bibliographystyle{gbt7714-numerical} % gbt7714-2015
\RequirePackage{natbib}
\renewcommand{\bibfont}{\zihao{5}}
\renewcommand{\bibsection}{\protect\nolabel@section{4}{参考文献}}

% 致谢
\newenvironment{acknowledgement}
	{\nolabel@section{4}[致谢]{致\hspace{1em}谢}}
	{\clearpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%                         Internal Command                            %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\zh@title}{}
\newcommand{\en@title}{}
\newcommand{\@studentid}{}
\newcommand{\@grade}{}
\newcommand{\@major}{}
\newcommand{\@department}{}
\newcommand{\@college}{}
\newcommand{\@adviser}{}
\newcommand{\zh@keywords}{}
\newcommand{\en@keywords}{}
\newlength\topulineparbox@totalheight
\newcommand\ul@t@parbox[2]{{%
	\hbadness=10000 % 禁用此处 "underfull hbox" 提示
	\settototalheight\topulineparbox@totalheight{\parbox[t]{#1}{#2}}%
	\rlap{\smash{\parbox[t]{#1}{%
		\unlessboolexpr{test {\ifdimless{\topulineparbox@totalheight}{0pt}}}{%
			\underline{\hspace{#1}}\\%
			\addtolength\topulineparbox@totalheight{-\baselineskip}%
		}%
	}}}%
	\makebox[#1][l]{\parbox[t]{#1}{#2}}}}
\setCJKfamilyfont{fb@song}{FandolSong}[AutoFakeBold=1]
\NewDocumentCommand{\nolabel@section}{smO{#4}m}{%
	\clearpage\section*{\phantomsection\sffamily\zihao{#2}#4}\sectionmark{#3}%
	\IfBooleanF{#1}{\addcontentsline{toc}{section}{#3}}}