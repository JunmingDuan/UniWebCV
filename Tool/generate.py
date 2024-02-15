import time
import sys
sys.path.append("utility")

from read_data import read_block_json
from read_data import read_block_html
from generate_webpage import generage_block_html
from generate_cv import generage_block_latex

output_html   = "../Website/index.html"
output_latex  = "../CV/"
data_json_dir = "data_json/"
data_html_dir = "data_html/"

if __name__ == "__main__":
    print("\n> Start process.\n")
    start_time = time.perf_counter()
    html_file = open(output_html, 'w')

    html_file.write('''\
    <!DOCTYPE html>
    <!--
    ''')
    print("> Read in readme from readme.md.")
    readme_file = open('../readme.md', 'r')
    html_file.write(readme_file.read())
    readme_file.close()
    html_file.write('''\
    -->

    <html lang="en">
    ''')

    html_file.write(read_block_html("head", data_html_dir))
    html_file.write("<body>\n")
    html_file.write(read_block_html("navigation", data_html_dir))
    html_file.write(read_block_html("personal", data_html_dir))

    block_name  = ["position", "publication", "award", "conference", "teaching"]
    block_title_en = ("Academic Positions", "Research Publications", "Major Awards & Honors", \
            "Conferences & Talks", "Teaching Assistant")
    # block_title_zh = ("学术经历", "研究成果", "奖励荣誉", "学术会议与报告", "助教", "其它服务")
    block_list = []
    for i in range(len(block_name)):
        block_list.append(read_block_json(block_name[i], data_json_dir))

    for i in range(len(block_name)):
        #html block
        html_file.write(
        generage_block_html(block_name[i], block_title_en[i], (i+1)%2, block_list[i], "en"))
        #latex block
        block_latex_file_en = open(output_latex+"CV_en/"+block_name[i]+".tex", 'w')
        # block_latex_file_zh = open(output_latex+"CV_zh/"+block_name[i]+".tex", 'w')
        block_latex_file_en.write(
        generage_block_latex(block_name[i], block_title_en[i], (i+1)%2, block_list[i], "en"))
        # block_latex_file_zh.write(
        # generage_block_latex(block_name[i], block_title_zh[i], (i+1)%2, block_list[i], "zh"))
        block_latex_file_en.close()
        # block_latex_file_zh.close()

    html_file.write(read_block_html("supervision", data_html_dir))
    html_file.write(read_block_html("service", data_html_dir))
    html_file.write(read_block_html("skill", data_html_dir))
    html_file.write(read_block_html("ClustrMaps", data_html_dir))

    html_file.write('''\

        </body>

    </html>\n''')

    print("\n> Output html to", output_html)

    html_file.close()

    print("\n> Processing succeeded!")
    end_time = time.perf_counter()
    print("> Time used: %.3e" %(end_time-start_time))

