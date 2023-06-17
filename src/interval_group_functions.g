# From a list of lists corr. to equal length products (that  multiply to the 
# same element), take all prefixes of these products and group these prefixes
# by equality in the group.
form_levels := function (max_height_chains)
  local all_levels, max_level, i,
          remaining_prefixes, current_level,
          indices_corr_to_this_group, current_test;;

  all_levels := [];
  max_level := Length(max_height_chains[1]);

  for i in [0..max_level] do
    # List of lists containing all prefixes of a certain length
    remaining_prefixes := List(max_height_chains, x->x{[1..i]});
    current_level := [];
    
    while true do
      if Length(remaining_prefixes) > 0 then
        current_test := remaining_prefixes[1];;

        # Find all indices of elements matching current test
        indices_corr_to_this_group := find_matching_indices(current_test,
                  {x,y} -> (Product(x) = Product(y)),
                  remaining_prefixes);;

        # Add them all (still bound within a list) to the current level
        Add(current_level, remaining_prefixes{indices_corr_to_this_group});;

        # Remove all current_indeces_in_group from remaining_prefixes;;
        remaining_prefixes := remove_many_indices(remaining_prefixes, indices_corr_to_this_group);;
      else
        break;
      fi;
    od;
    Add(all_levels, current_level);;
  od;
  return all_levels;;
end;;

# For pretty printing the output of above.
pprint_levels := function(levels)
  for i in [1..Length(levels)] do
    level := levels[i];;
    Print(" LEVEL: ");
    Print(i-1);
    Print(" \n");  
    for grouping in level do
      Display(grouping);;
      Print(" - \n");;
    od;;
    Print("============================\n");
  od;;
  return true;;
end;;