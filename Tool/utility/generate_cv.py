me = { "en": "J.M. Duan",
       "zh": "段俊明"}

def author_CV(author, language="en", correspondence=False):
    "Generate formatted author in CV"
    author_formatted = ""
    names = author.split(', ')
    for i in range(len(names)):
        if(names[i] == me[language]):
            if correspondence == True:
                author_formatted += r"\pubauthorselfstyle{"+names[i]+r"\textsuperscript{*}}"
                # author_formatted += r"{\bfseries "+names[i]+"}"
            else:
                author_formatted += r"\pubauthorselfstyle{"+names[i]+"}"
        else:
            author_formatted += r"\pubauthorstyle{"+names[i]+"}"
        if(len(names) == 1 or i == len(names)-1):
            author_formatted += ","
        elif(i == len(names)-2):
            if(language == "en"):
                if len(names) < 3:
                    author_formatted += " and "
                else:
                    author_formatted += ", and "
            else:
                author_formatted += "和"
        else:
            author_formatted += ", "

    return author_formatted

def publication_entry_CV(article, language="en"):
    '''Generate an entry for a journal article in CV like:
       \item[\pubenum] AUTHOR, TITLE, {\em\bfseries JOURNAL}, VOLUME(ISSUE): PAGE, YEAR.
       [<a href="arXiv link" target="_blank">arXiv</a>]
       [<a href="journal link" target="_blank">journal</a>]
       [(in Chinese)]
    '''
    if(article.get("chinese") == 1 and language == "zh"):
        article_latex = "%\n\item[\pubenum] "+author_CV(article["author_zh"], language)+" "
    else:
        if article.get("correspondence") == "true":
            article_latex = "%\n\item[\pubenum] "+author_CV(article["author_en"], "en", True)+" "
        else:
            article_latex = "%\n\item[\pubenum] "+author_CV(article["author_en"], "en", False)+" "
    if("url" in article and article["url"] != ""):
        if(article.get("chinese") == 1 and language == "zh"):
            article_latex += '\href{'+article["url"]+'}{'+article["title_zh"]+"}, "
        else:
            article_latex += '\href{'+article["url"]+'}{'+article["title_en"]+"}, "
    else:
        if(article.get("chinese") == 1 and language == "zh"):
            article_latex += article["title_zh"]+", "
        else:
            article_latex += article["title_en"]+", "
    if(article.get("status") == "published"):
        #journal
        if(article.get("chinese") == 1 and language == "zh"):
            article_latex += r"\pubjournalstyle{"+article["journal_zh"]+"}, "
        else:
            article_latex += r"\pubjournalstyle{"+article["journal_en"]+"}, "
        #volume(issue), page, year
        if(("volume" in article) and article.get("volume") != ""):
            if(article.get("issue") != ""):
                article_latex += article["volume"]+"("+article["issue"]+"): "+article["page"]+", "+article["year"]+"."
            else:
                article_latex += article["volume"]+": "+article["page"]+", "+article["year"]+"."
    elif(article.get("status") == "accepted"):
        if(article.get("chinese") == 1 and language == "zh"):
            article_latex += r'accepted by \pubjournalstyle{'+article["journal_zh"]+'}, '+article["year"]+"."
        else:
            article_latex += r'accepted by \pubjournalstyle{'+article["journal_en"]+'}, '+article["year"]+"."
    elif(article.get("status") == "submitted"):
        if(article.get("chinese") == 1 and language == "zh"):
            article_latex += 'submitted to \pubjournalstyle{'+article["journal_zh"]+'}, '+article["year"]+"."
        else:
            article_latex += 'submitted to \pubjournalstyle{'+article["journal_en"]+'}, '+article["year"]+"."
    elif(article.get("status") == "preparation"):
        if(article.get("chinese") == 1 and language == "zh"):
            article_latex += r'{\em\bfseries 准备中}.'
        else:
            article_latex += r'{\em\bfseries in preparation}.'


    if(("arXiv" in article) and article.get("arXiv") != ""):
        article_latex += ' \href{https://arxiv.org/abs/'+article["arXiv"]+'}{'+\
                         '\em arXiv:'+article["arXiv"]+"}."

    #Chinese
    if(article.get("chinese") == 1):
        if(language == "en"):
            article_latex += " (in Chinese)\n"
    else:
        article_latex += "\n"

    return article_latex

def position_entry_CV(position, language="en"):
    '''Generate an entry for an position in CV like:
       \cvposentry{date}{title}{location}{descreption}
    '''
    position_latex = "%"+"\n\cvposentry{"+position["period"+"_"+language]+"}{"+position["position"+"_"+language]+"}{"+position["location"+"_"+language] +"}{"+position["description"+"_cv"]+"}\n"
    return position_latex

def award_entry_CV(award, language="en"):
    '''Generate an entry for an award in CV like:
        \cvhonorentry{date}{title}{organization}
    '''

    award_latex = "\cvhonorentry"
    award_latex += "{"+award["date"+"_"+language]+"}"
    #title
    award_latex += "{"+award["title"+"_"+language]+"}"
    #organization
    award_latex += "{"+award["organization"+"_"+language]+"}"
    award_latex += "\n%\n"

    return award_latex.replace('&', '\&', 10)

def conference_entry_CV(conference, language="en"):
    '''Generate an entry for a conference in CV like:
       \cventry{date}{conference}{location}{description}
    '''
    conference_latex = "\cventry"
    conference_latex += "{"+conference["date"+"_"+language]+"}"
    conference_latex += "{"+conference["title"+"_"+language]+"}"
    conference_latex += "{"+conference["location"+"_"+language]+"} "
    conference_latex += "{"+conference["description"+"_"+language]+"}"
    conference_latex += "\n%\n"

    return conference_latex

def teaching_entry_CV(teaching, language="en"):
    '''Generate an entry for a teaching in CV like:
       \cventry{date}{course}{location}{description}
    '''
    teaching_latex  = "%\n\cventry"
    teaching_latex += "{"+teaching["date"+"_"+language]+"}"
    teaching_latex += "{"+teaching["course"+"_"+language]+"}"
    teaching_latex += "{"+teaching["location"+"_"+language]+"}"
    teaching_latex += "{}"

    return teaching_latex

def service_entry_CV(service, language="en"):
    '''Generate an entry for a service in CV like:
       \makefield{\faBookmark}{Journal of Computational Physics}
    '''
    service_latex = "\makefield{\\faBookmark}{"+service["plain"]+"}\n"

    return service_latex

switch_entry = {'publication': publication_entry_CV,
                'position': position_entry_CV,
                'award': award_entry_CV,
                'conference': conference_entry_CV,
                'teaching': teaching_entry_CV,
                'service': service_entry_CV,
                }

def generage_block_latex(block, title, is_light, block_list, language="en"):
    print("> Generate "+block+" list in CV_"+language+".")
    block_latex = "%\n"

    if(block == "publication"):
        article_list = []
        preprint_list = []
        block_latex += r"\begin{cvpublicationsection}{Journal Articles}"+"\n"
        for i in range(len(block_list)):
            if(block_list[i].get("status") == "published" or block_list[i].get("status") == "accepted"):
                article_list.append(block_list[i])
            else:
                preprint_list.append(block_list[i])

        for i in range(len(article_list)):
            block_latex += switch_entry[block](article_list[i], language)
        block_latex += "\end{cvpublicationsection}\n\n"

        if len(preprint_list) > 0:
            if(language == "en"):
                block_latex += r"\begin{cvpublicationsection}{Preprints}"+"\n"
            else:
                block_latex += "\end{enumerate}\n\n"\
                               +"\makesubrubrichead{\songti 预印本}\n"\
                               +"\\begin{enumerate}\n"

            for i in range(len(preprint_list)):
                block_latex += switch_entry[block](preprint_list[i], language)
            block_latex += "\end{cvpublicationsection}\n"


    elif block == "position":
        if(language == "en"):
            block_latex += r"\begin{cvsection}{"+title.replace('&', '\&', 10)+"}{L{5.5cm} Q}\n"
        else:
            block_latex += r"\begin{cvsection}{\songti "+title.replace('&', '\&', 10)+"}\n"
        for i in range(len(block_list)):
            block_latex += switch_entry[block](block_list[i], language)
        block_latex += r"\end{cvsection}"

    elif block == "award":
        if(language == "en"):
            block_latex += r"\begin{cvsection}{"+title.replace('&', '\&', 10)+"}{L{\linewidth-3cm} R{3cm}}\n"
        else:
            block_latex += r"\begin{cvsection}{\songti "+title.replace('&', '\&', 10)+"}\n"
        for i in range(len(block_list)):
            block_latex += switch_entry[block](block_list[i], language)
        block_latex += r"\end{cvsection}"

    elif block == "conference":
        if(language == "en"):
            block_latex += r"\begin{cvsection}{"+title.replace('&', '\&', 10)+"}{L{\linewidth-3.5cm} R{3.5cm}}\n"
        else:
            block_latex += r"\begin{cvsection}{\songti "+title.replace('&', '\&', 10)+"}\n"
        for i in range(len(block_list)):
            block_latex += switch_entry[block](block_list[i], language)
        block_latex += r"\end{cvsection}"

    elif block == "teaching":
        if(language == "en"):
            block_latex += r"\begin{cvsection}{"+title.replace('&', '\&', 10)+"}{L{\linewidth-3.5cm} R{3.5cm}}\n"
        else:
            block_latex += r"\begin{cvsection}{\songti "+title.replace('&', '\&', 10)+"}\n"
        for i in range(len(block_list)):
            block_latex += switch_entry[block](block_list[i], language)
        block_latex += r"\end{cvsection}"

    return block_latex

