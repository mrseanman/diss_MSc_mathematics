Read("list_utils.g");;
Read("interval_group_functions.g");;

F6 := FreeGroup("s", "t", "u", "v", "w", "x");;
AssignGeneratorVariables(F6);;
rels := ParseRelators([s, t, u, v, w, x], 
 "s^2 = t^2 = (s*t)^6 = 1,  \
 u = t*s*t,                 \
 v = t*s*t*s*t,             \
 w = s*t*s*t*s,             \
 x = s*t*s");;
D6_fp := F6/rels;;
# KEY STEP \/
AssignGeneratorVariables(D6_fp);;

letters := [s, t, u, v, w, x];;

all_2_words := generate_all_list_products_of_length_n(letters, 2);;

# Find all words that equal s*t
all_selected_words := [];
for word in all_2_words do
  if Product(word) = s*t then
    Append(all_selected_words, [word]);
  fi;
od;

levels := form_levels(all_selected_words);

pprint_levels(levels);;