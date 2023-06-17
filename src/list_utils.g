# Given a list (potentially of lists (of lists...)), apply a function to base
# each base element (anything that is not a list) while retaining the list 
# structure of the input.  
recursive_apply_func := function(list_structure, func)
  if IsList(list_structure) then
    return List(list_structure, x->recursive_apply_func(x,func));;
  else
    return func(list_structure);
  fi;;
end;;

# Given a list and list of indices, remove all these indices from that list
# and return.
remove_many_indices := function(list, indices_to_remove)
  local dummy_list, i;;
  dummy_list := [];;
  for i in [1..Length(list)] do
    if not i in indices_to_remove then
      Add(dummy_list, list[i]);;
    fi;
  od;
  return dummy_list;;
end;;

# Given a test value, a boolean valued two argument function and a list,
# Return all indices for which test_func(test_val, list[i]) = true.
find_matching_indices := function(test_val, test_func, list)
  local i, matching_indices;;
  matching_indices := [];;
  
  for i in [1..Length(list)] do
    if test_func(test_val, list[i]) then
      Add(matching_indices, i);;
    fi;;
  od;;
  return matching_indices;;
end;;

# Given a list of letters (any object really) and an integer n, generate
# all lists of length n containing objects from letters. There will be
# Length(letters)^n many items in the returned list of lists.
generate_all_list_products_of_length_n := function(letters, n)
  local all_prefixes, new_all_prefixes, i,
          word, letter, new_word;;

  all_prefixes := [[]];;
  new_all_prefixes := [];;
  for i in [1..n] do
    for word in all_prefixes do
      for letter in letters do
        new_word := StructuralCopy(word);;
        Add(new_word, letter);;
        Add(new_all_prefixes, new_word);;
      od;
    od;
    all_prefixes := StructuralCopy(new_all_prefixes);;
    new_all_prefixes := [];;
  od;
  return all_prefixes;;
end;;
