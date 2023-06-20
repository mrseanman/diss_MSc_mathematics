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

all_3_words = tuple(iter.product(letters, repeat=3))

all_matching_words = tuple(word for word in all_3_words if prod(word)==a*b*c)

levels = form_levels(all_matching_words)
levels_with_name = recursive_apply_func(levels, lambda x: names[x])
