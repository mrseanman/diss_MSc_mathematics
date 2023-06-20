Read("list_utils.g");;
Read("interval_group_functions.g");;

a := (1,2);;
b := (2,3);;
c := (3,4);;
d := (4,5);;

s := (1,3);;
t := (1,4);;
u := (1,5);;
v := (2,4);;
w := (2,5);;
x := (3,5);;


letters := [a, b, c, s, t, u, v, w, x];;
S4 := Group(letters);

# Creates a new dictionary of lookup names
names := NewDictionary((1,2), true, FamilyObj((1,2)));;
AddDictionary(names, a, "a");;
AddDictionary(names, b, "b");;
AddDictionary(names, c, "c");;
AddDictionary(names, s, "s");;
AddDictionary(names, t, "t");;
AddDictionary(names, u, "u");;
AddDictionary(names, v, "v");;
AddDictionary(names, w, "w");;
AddDictionary(names, x, "x");;

all_4_words := generate_all_list_products_of_length_n(letters, 4);;

# Functio to find names of group elements
find_name := x -> LookupDictionary(names, x);;

# Find all words that equal a*b*c*d
all_selected_words := [];
for word in all_4_words do
  if Product(word) = a*b*c*d then
    Append(all_selected_words, [word]);
  fi;
od;

levels := form_lesvels(all_selected_words);
levels_with_names := recursive_apply_func(levels, find_name);

pprint_levels(levels_with_names);;