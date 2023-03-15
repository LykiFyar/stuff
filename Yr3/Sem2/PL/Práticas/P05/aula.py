import re

header = "ab,cd{3,5}::sum,abc{4}::media"

for id,min,comp,func in re.findall(r"""""", header,flags=re.VERBOSE):
    print(id,min,comp,func)