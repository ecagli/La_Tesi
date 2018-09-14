%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Classe pour les rapports LETI
%
% Auteur : Florian PEBAY-PEYROULA (CEA-LETI)
% Date : 19/04/2008
% Version : 3.0
%
% Options de la classe (obligatoire) :
%     - [francais]
%     - [english]
%
% D�finir les champs avec les fonctions suivantes (non obligatoires) :
%     - \type{Type de document}
%     - \titre{Titre du document}
%     - \soustitre{Sous titre du document}
%     - \nref{N/Ref}
%     - \vref{V/Ref}
%     - \participants{Participants � l'�tude (environnement de tableau 1 colonne)}
%     - \redacteurs{R�dacteurs (environnement de tableau 3 colonnes)}
%     - \verificateurs{Verificateurs (environnement de tableau 3 colonnes)}
%     - \diffusion{Liste de diffusion (environnement de tableau 1 colonne)}
%     - \entite{Nom de l'entit� hierarchique (d�partement/service/labo)}
%     - \confidentiel{'oui' ou 'non'}
%     - \revision{Num�ro de r�vision}
%     - \historique{Description '&' Date '&' Version, s�par�s par des '\\ \hline'}
%     - \motscles{Liste de mot cl�s s�par�s par des virgules}
%     - \resume{R�sum� du document}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. Information de classe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1.1 Nom de la classe
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rapport-leti}

% 1.2 Sous typage de la classe de base
\LoadClass[a4paper,twoside,10pt]{article}

% 1.3 Traitement des options de la classe
\newcommand{\langue}{francais}
\DeclareOption{english}{\renewcommand{\langue}{english}}
\ProcessOptions\relax

% 1.4 Packages utilis�s
\usepackage[pdftex]{color,graphicx}
\usepackage{ae}
%\usepackage{vmargin}
\usepackage{tabularx}
\usepackage{multirow}
\usepackage{titlesec}
\usepackage{fancyhdr}
\usepackage{lastpage}
\usepackage{amssymb}
\usepackage{float}
\usepackage{tikz}
\usepackage{ifthen}

% Remove the forced use of babel for compatibility with natbib
%\ifthenelse{\equal{\langue}{francais}}{
%	\usepackage[french]{babel}
%	\usepackage[cm]{aeguill}
%}{
%	\usepackage[english]{babel}
%}


% 1.5 Options des packages
\usepackage[pdftex, bookmarks=true, bookmarksopen=true, colorlinks=true, linkcolor=noir, citecolor=noir, filecolor=noir, urlcolor=noir, pdftitle={}, pdfauthor={}, pdfsubject={}]{hyperref}
\usepackage[all]{hypcap}
\urlstyle{rm}

% 1.6 V�rifier les d�finitions des commandes utiles (titre, redacteurs, ...)
\newcommand{\vide}{}

\newcommand{\@type}{\languerapport}
\newcommand{\type}[1]{\renewcommand{\@type}{#1}}

\newcommand{\@titre}{}
\newcommand{\titre}[1]{\renewcommand{\@titre}{#1}}

\newcommand{\@soustitre}{}
\newcommand{\soustitre}[1]{\renewcommand{\@soustitre}{#1}}

\newcommand{\@nref}{}
\newcommand{\nref}[1]{\renewcommand{\@nref}{#1}}

\newcommand{\@vref}{}
\newcommand{\vref}[1]{\renewcommand{\@vref}{#1}}

\newcommand{\@participants}{}
\newcommand{\participants}[1]{\renewcommand{\@participants}{#1}}

\newcommand{\@redacteurs}{&&}
\newcommand{\redacteurs}[1]{\renewcommand{\@redacteurs}{#1}}

\newcommand{\@verificateurs}{&&}
\newcommand{\verificateurs}[1]{\renewcommand{\@verificateurs}{#1}}

\newcommand{\@fonctions}{\langueingenieur}
\newcommand{\fonctions}[1]{\renewcommand{\@fonctions}{#1}}

\newcommand{\@entite}{}
\newcommand{\entite}[1]{\renewcommand{\@entite}{#1}}

\newcommand{\@diffusion}{}
\newcommand{\diffusion}[1]{\renewcommand{\@diffusion}{#1}}

\newcommand{\@ged}{non}
\newcommand{\ged}[1]{\renewcommand{\@ged}{#1}}

\newcommand{\@confidentiel}{non}
\newcommand{\confidentiel}[1]{\renewcommand{\@confidentiel}{#1}}

\newcommand{\@revision}{1.0}
\newcommand{\revision}[1]{\renewcommand{\@revision}{#1}}

\newcommand{\@historique}{}
\newcommand{\historique}[1]{\renewcommand{\@historique}{#1}}

\newcommand{\@motscles}{}
\newcommand{\motscles}[1]{\renewcommand{\@motscles}{#1}}

\newcommand{\@resume}{}
\newcommand{\resume}[1]{\renewcommand{\@resume}{#1}}

\newcommand{\@tabledesmatieres}{oui}
\newcommand{\tabledesmatieres}[1]{\renewcommand{\@tabledesmatieres}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Document
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% 2.1 Marges
%\setmarginsrb{
%	35mm}{ % left
%	35mm}{ % top
%	35mm}{ % right
%	15mm}{ % bottom
%	0mm}{ % header height
%	0mm}{ % header-to-text separation
%	10mm}{ % footer height
%	20mm} % footer-to-text separation

% 2.2 Paragraphes
\parskip = 2 mm
\parindent = 0 mm

% 2.3 Fontes
\usepackage[scaled]{uarial}
\renewcommand*\familydefault{\sfdefault}

% 2.4 Couleurs
\definecolor{noir}{rgb}{0,0,0}
\definecolor{gris}{rgb}{0.5,0.5,0.5}
\definecolor{grisclair}{rgb}{0.85,0.85,0.85}
\definecolor{grisfonce}{rgb}{0.25,0.25,0.25}
\definecolor{rougeclair}{rgb}{0.863,0.019,0.153}
\definecolor{rougefonce}{rgb}{0.576,0.003,0.055}
\definecolor{vertclair}{rgb}{0.584,0.756,0.125}
\definecolor{vertfonce}{rgb}{0.118,0.431,0.208}
\definecolor{pantone3015}{cmyk}{1,0.55,0.19,0.03}

% 2.5 Liste item avec des tirets
\AtBeginDocument{
  \def\labelitemi{\normalfont\bfseries{--}}
}

% 2.6 L�gende des figure et des tableaux.
\renewcommand{\figurename}{Fig.}
\renewcommand{\tablename}{Tab.}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. Table des mati�re, titres et num�rotation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 3.1 Num�rotation de la TOC
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}

% 3.2 Format des titres
\titleformat{\section}[hang]{\LARGE\bf}{\thesection}{1em}{}
\titleformat{\subsection}[hang]{\large\bf}{\thesubsection}{1em}{}
\titleformat{\subsubsection}[hang]{\normalsize\bf}{\thesubsubsection}{1em}{}
\titleformat{\paragraph}[hang]{\normalsize\it}{\theparagraph}{1em}{}

\titlespacing*{\section}{\parindent}{*0.1}{0.01mm}
\titlespacing*{\subsection}{\parindent}{*0.1}{0.01mm}
\titlespacing*{\subsubsection}{\parindent}{*0.1}{0.01mm}
\titlespacing*{\paragraph}{\parindent}{*0.1}{0.01mm}

% 3.3 Redefinition de la table des mati�res (enlever le titre)
%\renewcommand{\tableofcontents}{\@starttoc{toc}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. Langue
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 4.1 Definition de strings suivant la langue
%\ifthenelse{\equal{\langue}{francais}}{
%	\newcommand{\languedate}{Date}
%	\newcommand{\languerevision}{Version}
%	\newcommand{\languerefchrono}{N/R�f}
%	\newcommand{\languerefcontrat}{V/R�f}
%	\newcommand{\langueparticipants}{Participants}
%	\newcommand{\languenom}{Nom}
%	\newcommand{\languefonction}{Fonction}
%	\newcommand{\langueversion}{Version}
%	\newcommand{\langueredacteurs}{R�dacteur(s)}
%	\newcommand{\langueverificateurs}{V�rificateur(s) et approbateur(s)}
%	\newcommand{\languediffusion}{Liste de diffusion}
%	\newcommand{\langueconfidentiel}{Confidentiel}
%	\newcommand{\languehistorique}{HISTORIQUE}
%	\newcommand{\languemodifications}{Nature des modifications}
%	\newcommand{\languetoc}{TABLE DES MATIERES}
%	\newcommand{\languerapport}{Rapport}
%	\newcommand{\languemotscles}{MOTS CLES}
%	\newcommand{\langueresume}{RESUME}
%}
{
	\newcommand{\languedate}{Date}
	\newcommand{\languerevision}{Revision}
	\newcommand{\languerefchrono}{N/Ref}
	\newcommand{\languerefcontrat}{V/Ref}
	\newcommand{\langueparticipants}{Participants}
	\newcommand{\languenom}{Name}
	\newcommand{\languefonction}{Function}
	\newcommand{\langueversion}{Version}
	\newcommand{\langueredacteurs}{Editor(s)}
	\newcommand{\langueverificateurs}{Examine and approve}
	\newcommand{\languediffusion}{Diffusion list}
	\newcommand{\langueconfidentiel}{Confidential}
	\newcommand{\languehistorique}{FORMER EVENTS}
	\newcommand{\languemodifications}{Change record}
	\newcommand{\languetoc}{TABLE OF CONTENT}
	\newcommand{\languerapport}{Report}
	\newcommand{\languemotscles}{KEYWORDS}
	\newcommand{\langueresume}{CONTENT}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 5. Headers et Footers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 5.1 Header et footer pages normales (fancy)
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyhf{}
\fancyhead{}
\fancyfoot{}
%\fancyfoot[L]{
%    \vspace{-2mm}
%	\fontsize{6.3pt}{6.3pt}\selectfont
%	Les informations contenues dans le pr�sent document sont la propri�t� des
%    contractants. Il ne peut �tre reproduit ou transmis � des tiers sans
%    l'autorisation expresse des contractants.
%}
\fancyfoot[C]{
	\vspace{2mm} % bottommargin - hauteur du bandeau rouge bas - 5mm
	%\noindent\makebox[10mm]{
	\includegraphics[height=1pt,width=\linewidth]{figures/greenline.png}
		%\begin{tikzpicture}[x=5mm, line width=0pt]
		%	\fill[left color=rougeclair, right color=rougefonce] (0, 0) rectangle (\paperwidth-10mm, 8mm);
		%	\node[text=white] at (\paperwidth-23mm, 8mm/2) {www.cea.fr};
		%\end{tikzpicture}
	%}
}

% 5.2 Header et footer page de garde
\fancypagestyle{plain}{
	\fancyhf{}
	\fancyhead{}
	\fancyfoot{}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 6. Premi�res pages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 6.1 D�finition de maketitle : page de garde, historique, r�sum�, mots cl�s, TOC
\renewcommand{\maketitle}{

	\hypersetup{
		pdftitle={\@type},
		pdfsubject={\@titre},
		%pdfauthor={\@redacteurs},
		pdfkeywords={\@entite},
		colorlinks
	}
	
	\thispagestyle{plain}
	~\vspace{-25mm}\\
	\begin{tabularx}{\textwidth}{@{}Xr}
		%\begin{tikzpicture}[x=0mm, line width=0pt]
		%	\fill[left color=rougeclair, right color=rougefonce] (0, 0) rectangle (50mm, 40mm);
		%\end{tikzpicture}
		\includegraphics[width=50mm, height=40mm]{logo_cea.pdf}
		& \textcolor{rougeclair}{\Huge \bf \@type} \\
	\end{tabularx}
	\vspace{10mm}
	\\
	{
		\renewcommand{\arraystretch}{1.6}
		\begin{tabularx}{\textwidth}{|X|X|X|X|}
			\hline
			\multicolumn{4}{|c|}{
				\begin{minipage}{100mm}
					\vspace{10mm}
					\centering
					{\Large \@titre}
					\\
					\@soustitre
					\vspace{10mm}
				\end{minipage}
			} \\
			\hline
			\languedate & \today & \languerevision & \@revision \\
			\hline
			\languerefchrono & \@nref & \languerefcontrat & \@vref \\
			\hline
			\langueparticipants & \multicolumn{3}{l|}{\begin{tabular}{l}\@participants\end{tabular}} \\
			\hline
			\begin{minipage}{30mm}
				\vspace{10mm}
				\langueredacteurs
				\vspace{10mm}
			\end{minipage} & 
				\multicolumn{3}{l|}{
					\begin{tabular}{llc}
						%\textit{Name} & \textit{Function} & \textit{Date} \\
						\@redacteurs
					\end{tabular}
				} \\
			\hline
			\begin{minipage}{30mm}
				\vspace{10mm}
				\langueverificateurs
				\vspace{10mm}
			\end{minipage}  &
				\multicolumn{3}{l|}{
					\begin{tabular}{llc}
						%\textit{Name} & \textit{Function} & \textit{Date} \\
						\@verificateurs
					\end{tabular}
				} \\
			\hline
			\begin{minipage}{30mm}
				\vspace{10mm}
				\languediffusion
				\vspace{10mm}
			\end{minipage}  &
				\multicolumn{3}{l|}{
					\begin{tabular}{l}
						\@diffusion
					\end{tabular}
				} \\
			\hline
		\end{tabularx}
	}
	\vspace{5mm}
	\\
	\ifthenelse{\equal{\@confidentiel}{non}}
	{
		\textcolor{rougeclair}{
			\renewcommand{\arraystretch}{1.6}
			\begin{tabularx}{\textwidth}{!{\vrule width 2pt}@{}XcX!{\vrule width 2pt}}
				\noalign{\hrule height 2pt}
				& \LARGE \textbf{\langueconfidentiel} & \\
				\noalign{\hrule height 2pt}
			\end{tabularx}
		}
	}
	{
		\\
	}
	\vspace{20mm}\\
	{
		\renewcommand{\arraystretch}{0.8}
		\begin{tabularx}{\textwidth}{@{}Xr}
			\begin{tikzpicture}[scale=0.02]
				\fill[line width=0.30mm, fill=pantone3015] (17.50,38.00) .. controls (17.50,38.00) and (17.50,10.50) .. (17.50,10.50) .. controls (17.50,10.50) and (17.74,9.77) .. (18.00,9.50) .. controls (18.38,9.10) and (18.95,9.00) .. (19.50,9.00) .. controls (20.69,9.01) and (23.00,9.00) .. (23.00,9.00) .. controls (23.00,9.00) and (20.00,0.50) .. (20.00,0.50) .. controls (20.00,0.50) and (3.00,0.50) .. (3.00,0.50) .. controls (3.00,0.50) and (1.07,0.75) .. (0.50,1.50) .. controls (0.46,1.55) and (0.42,1.61) .. (0.39,1.68) .. controls (0.06,2.32) and (0.00,3.50) .. (0.00,3.50) .. controls (0.00,3.50) and (0.00,38.00) .. (0.00,38.00) .. controls (0.00,38.00) and (17.50,38.00) .. (17.50,38.00);
				\fill[line width=0.30mm, fill=pantone3015] (57.50,0.50) .. controls (57.50,0.50) and (34.50,0.50) .. (34.50,0.50) .. controls (34.50,0.50) and (31.63,0.66) .. (30.50,1.50) .. controls (29.82,2.01) and (29.35,2.73) .. (29.00,3.50) .. controls (28.43,4.76) and (28.16,6.13) .. (28.00,7.50) .. controls (27.63,10.67) and (27.78,13.89) .. (28.50,17.00) .. controls (29.13,19.73) and (30.19,22.36) .. (32.00,24.50) .. controls (33.09,25.79) and (34.43,26.86) .. (36.00,27.50) .. controls (39.64,28.98) and (43.65,29.27) .. (47.50,28.50) .. controls (51.35,27.73) and (54.50,25.00) .. (56.50,21.50) .. controls (58.09,18.72) and (58.00,12.50) .. (58.00,12.50) .. controls (58.00,12.50) and (41.00,12.50) .. (41.00,12.50) .. controls (41.00,12.50) and (40.56,11.88) .. (40.50,11.50) .. controls (40.42,10.95) and (40.64,10.42) .. (41.00,10.00) .. controls (41.40,9.53) and (42.50,9.00) .. (42.50,9.00) .. controls (42.50,9.00) and (60.50,9.00) .. (60.50,9.00) .. controls (60.50,9.00) and (57.50,0.50) .. (57.50,0.50);
				\fill[line width=0.30mm, fill=white] (47.00,17.00) .. controls (47.26,17.28) and (47.43,17.63) .. (47.50,18.00) .. controls (47.63,18.70) and (47.41,19.41) .. (47.00,20.00) .. controls (46.42,20.84) and (45.52,21.50) .. (44.50,21.50) .. controls (42.50,21.50) and (40.00,20.50) .. (40.00,18.50) .. controls (40.00,17.96) and (40.50,17.00) .. (40.50,17.00) .. controls (40.50,17.00) and (47.00,17.00) .. (47.00,17.00);
				\fill[line width=0.30mm, fill=pantone3015] (85.50,0.50) .. controls (85.50,0.50) and (68.50,0.50) .. (68.50,0.50) .. controls (68.50,0.50) and (67.00,0.50) .. (66.00,1.50) .. controls (65.00,2.50) and (65.00,4.00) .. (65.00,4.00) .. controls (65.00,4.00) and (65.00,20.00) .. (65.00,20.00) .. controls (65.00,19.50) and (64.78,20.72) .. (64.50,21.00) .. controls (64.00,21.50) and (63.50,21.50) .. (63.50,21.50) .. controls (63.50,21.50) and (61.50,21.50) .. (61.50,21.50) .. controls (61.50,21.50) and (61.50,27.50) .. (61.50,27.50) .. controls (61.50,27.50) and (67.40,27.63) .. (71.50,30.50) .. controls (76.50,34.00) and (78.00,38.50) .. (78.00,38.50) .. controls (78.00,38.50) and (82.50,38.50) .. (82.50,38.50) .. controls (82.50,38.50) and (82.50,29.00) .. (82.50,29.00) .. controls (82.50,29.00) and (82.45,28.66) .. (82.50,28.50) .. controls (82.57,28.26) and (83.00,28.00) .. (83.00,28.00) .. controls (83.00,28.00) and (86.00,28.00) .. (86.00,28.00) .. controls (86.00,28.00) and (86.00,22.00) .. (86.00,22.00) .. controls (86.00,22.00) and (86.00,22.00) .. (84.00,22.00) .. controls (83.62,22.00) and (83.26,21.78) .. (83.00,21.50) .. controls (82.74,21.22) and (82.50,20.50) .. (82.50,20.50) .. controls (82.50,20.50) and (82.50,10.50) .. (82.50,10.50) .. controls (82.50,10.50) and (82.73,9.77) .. (83.00,9.50) .. controls (83.38,9.11) and (84.50,9.00) .. (84.50,9.00) .. controls (84.50,9.00) and (88.50,9.00) .. (88.50,9.00) .. controls (88.50,9.00) and (85.50,0.50) .. (85.50,0.50);
				\fill[line width=0.30mm, fill=pantone3015] (113.50,0.50) .. controls (113.50,0.50) and (97.00,0.50) .. (97.00,0.50) .. controls (97.00,0.50) and (95.53,0.95) .. (95.00,1.50) .. controls (94.47,2.04) and (94.00,3.50) .. (94.00,3.50) .. controls (94.00,3.50) and (94.00,28.50) .. (94.00,28.50) .. controls (94.00,28.50) and (99.91,27.00) .. (103.00,27.00) .. controls (106.00,27.00) and (111.50,28.00) .. (111.50,28.00) .. controls (111.50,28.00) and (111.50,10.50) .. (111.50,10.50) .. controls (111.50,10.50) and (111.73,9.77) .. (112.00,9.50) .. controls (112.39,9.11) and (112.95,9.01) .. (113.50,9.00) .. controls (114.34,8.99) and (116.00,9.00) .. (116.00,9.00) .. controls (116.00,9.00) and (113.50,0.50) .. (113.50,0.50);
				\fill[line width=0.30mm, fill=pantone3015] (103.00,30.50) .. controls (107.50,30.50) and (113.50,31.50) .. (113.50,34.50) .. controls (113.50,37.50) and (107.18,39.06) .. (102.50,39.00) .. controls (98.39,38.95) and (92.50,37.50) .. (92.50,35.00) .. controls (92.50,31.50) and (98.50,30.50) .. (103.00,30.50);
			\end{tikzpicture} & \\
			\textcolor{pantone3015}{\small Laboratoire d'Electronique et de Technologie de l'Information} & \\
			\begin{tikzpicture}[line width=0pt]
				\fill[left color=vertfonce, right color=vertclair] (0, 0) rectangle (20mm, 1mm);
			\end{tikzpicture} & \\
			\textcolor{grisfonce}{\footnotesize Commissariat � l'�nergie atomique et aux �nergies alternatives} & \textcolor{vertfonce}{\footnotesize Direction de la recherche technologique} \\
			\textcolor{grisfonce}{\footnotesize MINATEC Campus | 17 rue des Martyrs | 38054 Grenoble Cedex 9} & \textcolor{vertfonce}{\footnotesize \@entite} \\
			\textcolor{rougeclair}{\small leti@cea.fr} & \\
			\textcolor{grisfonce}{\scriptsize Etablissement public � caract�re industriel et commercial RCS Paris B 775 685 019} & \\
		\end{tabularx}
	}

	\newpage
	\parbox{\textwidth}{
		{\large\bf\languehistorique}
		\vspace{2mm}
		\\			
		{
			\renewcommand{\arraystretch}{1.5}
			\begin{tabularx}{\textwidth}{|X|p{3cm}|p{2cm}|}
				\hline
				\textbf{\languemodifications} & \textbf{\languedate} & \textbf{\langueversion} \\
				\hline
				\@historique
			\end{tabularx}
		}
	}
	\vspace{10mm}\\
	\ifthenelse{\equal{\@resume}{}}
	{
	}
	{
		\parbox{\textwidth}{
			{\large\bf\langueresume}
			\vspace{2mm}
			\\
			\@resume
		}
		\vspace{10mm}\\
	}
	\ifthenelse{\equal{\@motscles}{}}
	{
	}
	{
		\parbox{\textwidth}{
			{\large\bf\languemotscles}
			\vspace{2mm}
			\\
			\@motscles
		}
		\vspace{10mm}\\
	}
	\ifthenelse{\equal{\@tabledesmatieres}{oui}}
	{
		{\large\bf\languetoc}
		\par
		\tableofcontents
		\newpage
	}
	{
		\newpage
	}
	
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 7. Environnements d�coratifs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 7.1 Code
\newsavebox{\fmbox}
\newenvironment{code}{
	\begin{lrbox}{\fmbox}
	\hspace{0.5cm}
	\begin{minipage}{\textwidth}
		\setlength{\rightmargin}{\leftmargin}
		\setlength{\listparindent}{0pt}
		\raggedright
		\setlength{\itemsep}{0pt}
		\setlength{\parsep}{0pt}
		\normalfont\ttfamily
}{
    \end{minipage}
    \end{lrbox}\fcolorbox{noir}{grisclair}{\usebox{\fmbox}}
    \vspace{0.15cm}
	\\
}
