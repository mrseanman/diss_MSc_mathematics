import itertools as iter

load("interval_group_functions.sage")
load("list_utils.sage")

S5 = SymmetricGroup(5)

a = S5((1,2))
b = S5((2,3))
c = S5((3,4))
d = S5((4,5))

s = S5((1,3))
t = S5((1,4))
u = S5((1,5))
v = S5((2,4))
w = S5((2,5))
x = S5((3,5))

names = {
    a:"a",
    b:"b",
    c:"c",
    d:"d",
    s:"s",
    t:"t",
    u:"u",
    v:"v",
    w:"w",
    x:"x"}

letters = [a, b, c, d, s, t, u, v, w, x]

levels, all_matching_words = find_words_form_levels(letters, (a,b,c,d))
levels_with_name = recursive_apply_func(levels, lambda x: names[x])
pprint_levels(levels_with_name)
G, p = generate_graph_make_plot(levels_with_name)
G.show(method = "js")
