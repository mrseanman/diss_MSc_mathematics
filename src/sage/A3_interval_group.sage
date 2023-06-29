import itertools as iter

load("interval_group_functions.sage")
load("list_utils.sage")

S4 = SymmetricGroup(4)
a = S4((1,2))
b = S4((2,3))
c = S4((3,4))
s = S4((1,3))
t = S4((2,4))
u = S4((1,4))

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
G, p = generate_graph_make_plot(levels_with_name)
p.show(figsize=(20,20))
