Read("list_utils.g");;
Read("interval_group_functions.g");;

F3 := FreeGroup("s", "t", "u");;
AssignGeneratorVariables(F3);;
rels := ParseRelators([s, t, u], 
 "s^2 = t^2 = (s*t)^3 = 1, u = s*t*s");;
D3_fp := F3/rels;;
# KEY STEP \/
AssignGeneratorVariables(D3_fp1);;

letters := [s, t, u];;

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