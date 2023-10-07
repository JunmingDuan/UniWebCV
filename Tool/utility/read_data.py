import json

def read_block_json(block, block_dir):
    '''Read in the block info from the file "block.json"'''
    block_file = open(block_dir+block+".json", 'r')
    block_list = json.load(block_file)
    block_num  = len(block_list)
    print("> Read in "+block+" from "+block+".json.")
    print("  The number of the list:", len(block_list))
    if(block_list[-1].get("date")):
        block_list.sort(key=lambda x:x["date_ID"], reverse=True)
    block_file.close()
    return block_list

def read_block_html(block, block_dir):
    '''Read in the block info directly from the file "block.html"'''
    block_file = open(block_dir+block+".html", 'r')
    print("> Read in "+block+" from "+block+".html.")
    block_html = "<!-- start of "+block+" -->\n";
    block_html += block_file.read();
    block_html += "<!-- end of "+block+" -->\n";
    block_file.close()
    return block_html

