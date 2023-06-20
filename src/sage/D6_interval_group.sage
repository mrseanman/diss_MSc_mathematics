import itertools as iter

load("interval_group_functions.sage")
load("list_utils.sage")

F6.<s, t, u, v, w, x> = FreeGroup()

D6 = F6/[ s^2, t^2, (s*t)^6,
            u*t*s*t,
            v*t*s*t*s*t,
            w*s*t*s*t*s,
            x*s*t*s]

D6.inject_variables()

letters = [s,t,u,v,w,x]

levels, all_matching_words = find_words_form_levels(letters, (s,t))
pprint_levels(levels)