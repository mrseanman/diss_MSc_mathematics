Read("list_utils.g");;
Read("interval_group_functions.g");;

a := (1,2);
b := (2,3);
c := (3,4);
s := (1,3);
t := (2,4);
u := (1,4);

letters := [a, b, c, s, t, u];;
S4 := Group(a, b, c, s, t, u);

# Creates a new dictionary of lookup names
names := NewDictionary((1,2), true, FamilyObj((1,2)));;
AddDictionary(names, a, "a");;
AddDictionary(names, b, "b");;
AddDictionary(names, c, "c");;
AddDictionary(names, s, "s");;
AddDictionary(names, t, "t");;
AddDictionary(names, u, "u");;

#f := FreeGroup("a", "b", "c", "s", "t", "u");
# Assigns a,b,s, etc to be the generators of f
#AssignGeneratorVariables(f);;
#r := ParseRelators([a, b, c, s, t, u], 
#  "a^2 = b^2 = c^2 = 1, (a*b)^3 = (b*c)^3 = 1, a*b*a = s, b*c*b = t, a*b*c*b*a = u");
#S4_gen_6 := f/r;;
# Assigns a,b,s, etc to be the generators of f
#AssignGeneratorVariables(S4_gen_6);;

all_3_words := generate_all_list_products_of_length_n(letters, 3);;

# Functio to find names of group elements
find_name := x -> LookupDictionary(names, x);;

# Find all words that equal a*b*c
all_selected_words := [];
for word in all_3_words do
  if Product(word) = a*b*c then
    Append(all_selected_words, [word]);
  fi;
od;

levels := form_levels(all_selected_words);
levels_with_names := recursive_apply_func(levels, find_name);

pprint_levels(levels_with_names);;




