import os
import time
import sys
sys.path.append("utility")

from read_data import read_block_json
from read_data import read_block_html
from generate_webpage import generage_block_html, generate_page
from generate_cv import generage_block_latex

output_html_dir = "../Website"
output_latex  = "../CV/"
data_json_dir = "data_json/"
data_html_dir = "data_html/"

if __name__ == "__main__":
    print("\n> Start process.\n")
    start_time = time.perf_counter()

    block_name  = ["position", "publication", "award", "conference", "teaching"]
    block_title_en = ("Academic Positions", "Research Publications", "Major Awards & Honors", \
            "Conferences & Talks", "Teaching Assistant")
    # block_title_zh = ("学术经历", "研究成果", "奖励荣誉", "学术会议与报告", "助教", "其它服务")
    block_list = []
    for i in range(len(block_name)):
        block_list.append(read_block_json(block_name[i], data_json_dir))

    for i in range(len(block_name)):
        #html block
        #latex block
        block_latex_file_en = open(output_latex+"CV_en/"+block_name[i]+".tex", 'w')
        # block_latex_file_zh = open(output_latex+"CV_zh/"+block_name[i]+".tex", 'w')
        block_latex_file_en.write(
        generage_block_latex(block_name[i], block_title_en[i], (i+1)%2, block_list[i], "en"))
        # block_latex_file_zh.write(
        # generage_block_latex(block_name[i], block_title_zh[i], (i+1)%2, block_list[i], "zh"))
        block_latex_file_en.close()
        # block_latex_file_zh.close()

    # page_names  = ["publication", "conference", "teaching"]
    # page_titles  = ["Publications", "Conference & Talks", "Teaching"]
    page_names  = ["publication", "conference"]
    page_titles  = ["Publications", "Conferences & Talks"]
    for i in range(len(page_names)):
        page_name = page_names[i]
        insert_text = generate_page(page_name, page_titles[i], 0,
                                    read_block_json(page_name, data_json_dir), "en")
        with open(os.path.join(data_html_dir, page_name+"_template.html"), "r") as temp:
            text = temp.read().replace('insert', insert_text)
        with open(os.path.join(output_html_dir, page_name+".html"), "w") as page_file:
            page_file.write(text)

    print("\n> Processing succeeded!")
    end_time = time.perf_counter()
    print("> Time used: %.3e" %(end_time-start_time))

