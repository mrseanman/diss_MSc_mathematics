# From a list of lists corr. to equal length products (that  multiply to the 
# same element), take all prefixes of these products and group these prefixes
# by equality in the group.
form_levels := function(max_height_chains)
    local all_levels, max_level, i, current_level, remaining_prefixes, current_test, matching_indices, not_matching_indices;
    all_levels := [];
    max_level := Length(max_height_chains[1]);

    for i in [0..max_level] do
        current_level := [];
        remaining_prefixes := List(max_height_chains, chain -> chain{[1..i]});

        while not IsEmpty(remaining_prefixes) do
            current_test := remaining_prefixes[1];
            matching_indices := Filtered([1..Length(remaining_prefixes)], i -> Product(current_test) = Product(remaining_prefixes[i]));;
            not_matching_indices := Difference([1..Length(remaining_prefixes)], matching_indices);;

            Add(current_level, List(matching_indices, j -> remaining_prefixes[j]));;
            # Update remaining prefixes to only contain ones not so far matched
            remaining_prefixes := remaining_prefixes{not_matching_indices};;
        od;
        
        Add(all_levels, current_level);
    od;

    return all_levels;
end;;



# For pretty printing the output of above.
pprint_levels := function(levels)
local i, level, grouping;;
  for i in [1..Length(levels)] do
    level := levels[i];;
    Print(" LEVEL: ");
    Print(i-1);
    Print(" \n");  
    for grouping in level do
      Display(Unique(grouping));;
      Print(" - \n");;
    od;;
    Print("============================\n");
  od;;
  return true;;
end;;
