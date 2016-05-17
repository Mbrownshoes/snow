

import re



f_dic = {'Precipitation':'P'}
s_dic = {'Accumulated_Precip':'Ac_P'}
t_dic = {'Snow_Depth':'S_D'}
sn_dic = {'Snow_Water_Equivalent':'S _W_Eq'}




def replace_all(text, dic):
    for i, j in dic.iteritems():
        text = text.replace(i, j)
    return text

with open('build/daily_asp_archive.csv','r') as f:
    text=f.read()
    text=replace_all(text,f_dic)
    text=replace_all(text,s_dic)
    text=replace_all(text,t_dic)
    text=replace_all(text,sn_dic)
    # text=re.sub(r'PROD\s(?=[1-9])',r'PROD',text)

with open('daily_asp.csv','w') as w:
    w.write(text)



