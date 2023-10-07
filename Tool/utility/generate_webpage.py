me = { "en": "J.M. Duan",
       "zh": "段俊明"}

def author_web(author, language="en", correspondence=False):
    "Generate formatted author in webpage"
    author_formatted = ""
    names = author.split(', ')
    for i in range(len(names)):
        if(names[i] == me[language]):
            if correspondence == True:
                author_formatted += "<b>"+names[i]+"</b>"+"<sup>*</sup>"
                # author_formatted += "<b>"+names[i]+"</b>"
            else:
                author_formatted += "<b>"+names[i]+"</b>"
        else:
            author_formatted += names[i]
        if(len(names) == 1 or i == len(names)-1):
            author_formatted += ","
        elif(i == len(names)-2):
            if len(names) < 3:
                author_formatted += " and "
            else:
                author_formatted += ", and "
        else:
            author_formatted += ", "

    return author_formatted

def publication_entry_web(article, language="en"):
    '''Generate an entry for a journal article in webpage like:
       <li>
       <b>J.M. Duan</b> and H.Z. Tang,
         TITLE,
         <i><b>JOURNAL</b></i>, VOLUME(ISSUE): PAGE, YEAR.
         [<a href="arXiv link" target="_blank">arXiv</a>]
         [<a href="journal link" target="_blank">journal</a>]
         [(in Chinese)]
       </li>
    '''
    article_html = "<li>"
    #author
    if article.get("correspondence") == "true":
        article_html += author_web(article["author"+"_"+language], language, True)+"\n"
    else:
        article_html += author_web(article["author"+"_"+language], language, False)+"\n"
    #title
    article_html += article["title"+"_"+language]+", "

    if(article.get("status") == "published"):
        #journal
        article_html += "<i><b>"+article["journal"+"_"+language]+"</b></i>, "
        #volume(issue), page, year
        article_html += article["volume"]
        if(article.get("issue") is not ""):
            article_html += "("+article["issue"]+"): "
        else:
            article_html += ": "
        article_html += article["page"]+", "+article["year"]+".\n"
    elif(article.get("status") == "accepted"):
        if article.get("arXiv" != ""):
            article_html += ' accepted by <i><b>'+article["journal"+"_"+language]+"</b></i>, "
            article_html += ' arXiv:'+article.get("arXiv")
        else:
            article_html += ' accepted by <i><b>'+article["journal"+"_"+language]+"</b></i>"
        article_html += ", "+article["year"]+".\n"
    elif(article.get("status") == "submitted"):
        if article.get("arXiv" != ""):
            article_html += ' submitted to <i><b>'+article["journal"+"_"+language]+"</b></i>, "
            article_html += ' arXiv:'+article.get("arXiv")
        else:
            article_html += ' submitted to <i><b>'+article["journal"+"_"+language]+"</b></i>"
        article_html += ", "+article["year"]+".\n"
    elif(article.get("status") == "preparation"):
        article_html += ' <i><b>in preparation</b></i>.'

    #Chinese
    if(article.get("chinese") == 1):
        if(language == "en"):
            article_html += " (in Chinese)\n"
    else:
        article_html += "\n"
    #arXiv
    if(article.get("arXiv")):
        article_html += ' [<a href="https://arxiv.org/abs/'+article.get("arXiv")+'" target="_blank">'
        article_html += "arXiv</a>]"
    #journal link
    if(article.get("url")):
        article_html += '[<a href="'+article.get("url")+'" target="_blank">journal</a>]\n'

    article_html += "</li>\n"

    return article_html

def position_entry_web(position, language="en"):
    '''Generate an entry for an position in webpage like:
        <li>
        <b>POSITION</b>, location, PERIOD.
        </li>
    '''
    position_html = "<li>"
    #period
    position_html += position["period"+"_"+language]+", "
    #position
    position_html += position["position"+"_"+language]+", "
    #location
    position_html += position["location"+"_"+language]+". "
    position_html += "("+position["description"+"_html"]+")</li>\n"

    return position_html

def award_entry_web(award, language="en"):
    '''Generate an entry for an award in webpage like:
        <li>
        <b>TITLE</b>, ORGANIZATION, [MONTH] YEAR.
        </li>
    '''
    award_html = "<li>"
    #title
    award_html += "<b>"+award["title"+"_"+language]+"</b>, "
    #organization
    award_html += award["organization"+"_"+language]+", "
    #date
    award_html += award["date"+"_"+language]+".\n"
    award_html += "</li>\n"

    return award_html

def conference_entry_web(conference, language="en"):
    '''Generate an entry for a conference in webpage like:
      <li>
        <b>TITLE</b>,
        [LOCATION] [online], PERIOD.
        [Attended]
        [(Talk: <i>TALK</i>)]
      </li>
    '''
    conference_html = "<li>"
    #title
    if conference["title"+"_"+language] != "":
        conference_html += "<b>"+conference["title"+"_"+language]+"</b>,\n"
    #[location] [online], PERIOD.
    if(conference.get("online") == 1):
        if(language == "en"):
            conference_html += "online, "+conference["date"+"_"+language]+".\n"
        else:
            conference_html += "线上, "+conference["date"+"_"+language]+".\n"
    else:
        conference_html += conference["location"+"_"+language]+", "+conference["date"+"_"+language]+".\n"
    if(conference.get("description"+"_"+language)):
        if(language == "en"):
            conference_html += "(Talk: <i>"+conference["description"+"_"+language]+"</i>)\n"
        else:
            conference_html += "(报告: <i>"+conference["description"+"_"+language]+"</i>)\n"
    elif(conference.get("poster"+"_"+language) and conference.get("poster_app")):
        if(language == "en"):
            conference_html += "(Poster: <i>"+conference["poster"+"_"+language]+"</i> "+conference["poster_app"+"_"+language]+")\n"
        else:
            conference_html += "(海报: <i>"+conference["poster"+"_"+language]+"</i> "+conference["poster_app"+"_"+language]+")\n"
    elif(conference.get("poster"+"_"+language)):
        if(language == "en"):
            conference_html += "(Poster: <i>"+conference["poster"+"_"+language]+"</i>)\n"
        else:
            conference_html += "(海报: <i>"+conference["poster"+"_"+language]+"</i>)\n"
    else:
        if(language == "en"):
            conference_html += "(Attended)\n"
        else:
            conference_html += "(参加)\n"
    conference_html += "</li>\n"

    return conference_html

def teaching_entry_web(teaching, language="en"):
    '''Generate an entry for a teaching in webpage like:
        <li>
        <b>COURSE</b>
        ([graduate | undergraduate]), location, DATE.
        </li>
    '''
    teaching_html = "<li>"
    #course
    teaching_html += "<b>"+teaching["course"+"_"+language]+"</b>\n"
    #(description)
    teaching_html += "("+teaching["description"+"_"+language]+"),\n"
    #location
    teaching_html += teaching["location"+"_"+language]+", "
    #date
    teaching_html += teaching["date"+"_"+language]+".\n"
    # if teaching["role"] == "TA":
        # teaching_html += " Teaching Assistant.\n"
    # elif teaching["role"] == "Instructor":
        # teaching_html += " Instructor.\n"
    teaching_html += "</li>\n"

    return teaching_html

def service_entry_web(service, language="en"):
    '''Generate an entry for a service in webpage like:
        <li>
        JOURNAL
        </li>
    '''
    service_html = "<li>"
    service_html += service["plain"]
    service_html += "</li>\n"

    return service_html

switch_entry = {'publication': publication_entry_web,
                'position': position_entry_web,
                'award': award_entry_web,
                'conference': conference_entry_web,
                'teaching': teaching_entry_web,
                'service': service_entry_web,
                }

def generage_block_html(block, title, is_light, block_list, language="en"):
    print("> Generate "+block+" list in webpage"+"_"+language+".")
    block_html = "<!-- start of "+block+" -->\n"
    if(is_light):
        block_html += '<div class="bg-light p-3">\n'
    else:
        block_html += '<div class="p-3">\n'
    block_html += '<div class="content-md container-fluid">\n'
    block_html += '<h2 id="'+block+'">'+title+'</h2>\n'

    if(block == "publication"):
        block_html += '''
            <h4>Journal Articles</h4>
            <ol class="split start">
        '''
        article_list = []
        preprint_list = []
        for i in range(len(block_list)):
            if(block_list[i].get("status") == "published" or block_list[i].get("status") == "accepted"):
                article_list.append(block_list[i])
            else:
                preprint_list.append(block_list[i])

        for i in range(len(article_list)):
            block_html += switch_entry[block](article_list[i], language)

        if len(preprint_list) > 0:
            block_html += '''\
                    </ol>

                <h4>Preprints</h4>
                <ol class="split">
            '''
            for i in range(len(preprint_list)):
                block_html += switch_entry[block](preprint_list[i], language)

    else:
        block_html += "<ul>\n"
        for i in range(len(block_list)):
            block_html += switch_entry[block](block_list[i], language)
        block_html += "</ul>\n"

    block_html += '''
        </div>
    </div>
    '''
    block_html += "<!-- end of "+block+" -->\n"

    return block_html

