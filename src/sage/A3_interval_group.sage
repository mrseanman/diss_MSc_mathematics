import itertools as iter

load("interval_group_functions.sage")
load("list_utils.sage")


a = Permutation((1,2))
b = Permutation((2,3))
c = Permutation((3,4))
s = Permutation((1,3))
t = Permutation((2,4))
u = Permutation((1,4))

names = {
    a:"a",
    b:"b",
    c:"c",
    s:"s",
    t:"t",
    u:"u"
}

letters = [a,b,c,s,t,u]

levels, all_matching_words = find_words_form_levels(letters, (a,b,c))
levels_with_name = recursive_apply_func(levels, lambda x: names[x])
pprint_levels(levels_with_name)
